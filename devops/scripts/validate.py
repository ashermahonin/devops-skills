#!/usr/bin/env python3
from __future__ import annotations

import json
import os
import re
import stat
import sys
import xml.etree.ElementTree as ET
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
SKILLS_DIR = ROOT / "devops" / "skills"
EXPECTED_SKILLS = {
    "devops-router",
    "kubernetes-operations",
    "cloud-operations",
    "observability-operations",
    "cicd-automation",
    "scripting-automation",
    "infrastructure-as-code",
    "container-platforms",
    "security-secrets",
    "incident-troubleshooting",
    "network-vpn-security",
}
BANNED_TEXT = [
    "/" + "Users" + "/" + "ashermahonin",
    "devops" + "-tasks",
    "garry" + "tan",
    "g" + "stack",
]


def fail(message: str) -> None:
    print(f"[fail] {message}")
    raise SystemExit(1)


def ok(message: str) -> None:
    print(f"[ok] {message}")


def read(path: Path) -> str:
    try:
        return path.read_text(encoding="utf-8")
    except UnicodeDecodeError as exc:
        fail(f"{path} is not utf-8: {exc}")


def parse_frontmatter(text: str, path: Path) -> dict[str, str]:
    if not text.startswith("---\n"):
        fail(f"{path} is missing YAML frontmatter")
    end = text.find("\n---\n", 4)
    if end == -1:
        fail(f"{path} frontmatter is not closed")
    data: dict[str, str] = {}
    for line in text[4:end].splitlines():
        if not line.strip():
            continue
        if ":" not in line:
            fail(f"{path} has invalid frontmatter line: {line}")
        key, value = line.split(":", 1)
        data[key.strip()] = value.strip().strip('"')
    return data


def validate_skills() -> None:
    if not SKILLS_DIR.is_dir():
        fail(f"missing skills directory: {SKILLS_DIR}")
    actual = {p.name for p in SKILLS_DIR.iterdir() if p.is_dir()}
    missing = EXPECTED_SKILLS - actual
    extra = actual - EXPECTED_SKILLS
    if missing:
        fail(f"missing skills: {sorted(missing)}")
    if extra:
        fail(f"unexpected skills: {sorted(extra)}")

    for skill in sorted(EXPECTED_SKILLS):
        folder = SKILLS_DIR / skill
        skill_md = folder / "SKILL.md"
        openai_yaml = folder / "agents" / "openai.yaml"
        references = folder / "references"
        if not skill_md.is_file():
            fail(f"{skill} is missing SKILL.md")
        if not openai_yaml.is_file():
            fail(f"{skill} is missing agents/openai.yaml")
        if not references.is_dir() or not list(references.glob("*.md")):
            fail(f"{skill} needs at least one references/*.md file")

        text = read(skill_md)
        fm = parse_frontmatter(text, skill_md)
        if fm.get("name") != skill:
            fail(f"{skill_md} name does not match folder")
        description = fm.get("description", "")
        if len(description) < 80:
            fail(f"{skill_md} description is too short")
        for heading in ["## Role", "## Start By", "## Procedure", "## Output", "## Quality Bar"]:
            if heading not in text:
                fail(f"{skill_md} missing heading: {heading}")
        yaml_text = read(openai_yaml)
        if f"${skill}" not in yaml_text:
            fail(f"{openai_yaml} default prompt must mention ${skill}")
    ok("skills are structurally valid")


def validate_routing() -> None:
    routing_path = ROOT / "devops" / "routing" / "skills.json"
    data = json.loads(read(routing_path))
    names = {entry["name"] for entry in data["skills"]}
    if names != EXPECTED_SKILLS:
        fail("routing skills do not match skill folders")
    for combo in data.get("combinations", []):
        for name in combo.get("chain", []):
            if name not in EXPECTED_SKILLS:
                fail(f"routing combination references unknown skill: {name}")
    ok("routing is consistent")


def validate_docs() -> None:
    required = [
        ROOT / "README.md",
        ROOT / "DESIGN.md",
        ROOT / "AGENTS.md",
        ROOT / "CLAUDE.md",
        ROOT / "devops" / "docs" / "README.ru.md",
        ROOT / "devops" / "docs" / "project-memory.md",
        ROOT / "devops" / "routing" / "README.md",
    ]
    for path in required:
        if not path.is_file():
            fail(f"missing required doc: {path}")

    for svg in [
        ROOT / "devops" / "docs" / "assets" / "routing-flow.svg",
        ROOT / "devops" / "docs" / "assets" / "routing-flow.ru.svg",
    ]:
        ET.parse(svg)

    link_pattern = re.compile(r"\[[^\]]+\]\(([^)#][^)]+)\)")
    for md in [p for p in ROOT.rglob("*.md") if ".git" not in p.parts]:
        text = read(md)
        for link in link_pattern.findall(text):
            if "://" in link or link.startswith("mailto:"):
                continue
            target = (md.parent / link).resolve()
            if not target.exists():
                fail(f"broken link in {md}: {link}")
    ok("docs and svg assets are valid")


def validate_no_machine_paths() -> None:
    for path in ROOT.rglob("*"):
        if ".git" in path.parts or path.is_dir():
            continue
        if path.suffix.lower() in {".png", ".jpg", ".jpeg", ".gif", ".webp"}:
            continue
        text = read(path)
        for banned in BANNED_TEXT:
            if banned in text:
                fail(f"banned text {banned!r} found in {path}")
    ok("no banned source names or machine-specific paths found")


def validate_installer() -> None:
    installer = ROOT / "install.sh"
    if not installer.is_file():
        fail("missing install.sh")
    mode = installer.stat().st_mode
    if not (mode & stat.S_IXUSR):
        fail("install.sh is not executable")
    text = read(installer)
    for token in ["--global", "--local", "--target", "--dry-run", "CODEX_HOME", "CLAUDE_HOME"]:
        if token not in text:
            fail(f"install.sh missing {token}")
    ok("installer is present and executable")


def main() -> int:
    validate_skills()
    validate_routing()
    validate_docs()
    validate_no_machine_paths()
    validate_installer()
    print("All checks passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
