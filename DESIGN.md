---
colors:
  primary: "#1F4F46"
  secondary: "#7A9FD8"
  accent: "#C77B9C"
  surface: "#F4F0E8"
  background: "#FFFFFF"
  text: "#1C1C1C"
  muted: "#6B7280"
  success: "#79A96B"
  warning: "#B88A35"
  danger: "#B94A48"
typography:
  heading: "GitHub Markdown heading scale"
  body: "GitHub Markdown body"
  mono: "GitHub Markdown monospace"
spacing:
  compact: "8px"
  normal: "16px"
  section: "32px"
rounded:
  sm: "6px"
  md: "8px"
components:
  diagram: "SVG graph with restrained color classes and four stacked phases"
  table: "GitHub table with short action-oriented descriptions"
  switcher: "Anchor links for language and documentation switching"
---

# Documentation Design

## Overview

This repository is documentation-first. The root README should feel like a professional GitHub landing page: clear promise, fast install path, visible routing model, and complete DevOps skill map. Extended language docs live under `devops/docs/`.

## Colors

Use the same restrained visual language as the main Agentic Skills repository:

- `primary` for entrypoints and routing.
- `surface` for safety gates and planning.
- `secondary` for implementation and domain workflows.
- `success` for validation.
- `accent` for project memory and graph handoff.

## Typography

Use normal GitHub Markdown hierarchy. SVG text uses system UI fonts and compact labels. Avoid oversized decorative prose inside diagrams.

## Layout

The root README should follow this order:

1. Product name and one-line promise.
2. Language/documentation links.
3. Short emoji capability row.
4. English overview.
5. SVG routing diagram.
6. Quick start, installer flags, skills, routing model, repository layout, and validation.

## Components

- Use SVG for the main README routing map.
- Keep the diagram in one rounded shell with four stacked rounded phases.
- Use small arrowheads and short labels so GitHub rendering stays clean.
- Use tables for installer flags and skill descriptions.
- Keep code blocks short and copyable.

## Do's And Don'ts

- Do make the path from request to validated DevOps handoff visible.
- Do keep localized diagrams in the same language as the localized page.
- Do keep docs portable and avoid machine-specific absolute paths.
- Do not make diagrams the only source of routing truth; `devops/routing/skills.json` remains canonical.
- Do not use large arrowheads, square phase cards, or labels that collide at GitHub scale.
