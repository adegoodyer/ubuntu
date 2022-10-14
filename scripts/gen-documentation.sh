#!/bin/bash
# generates the README.md file for the project

# Intro
cat documentation/readme-intro > README.md

# Security Scan
printf '\n## Security Scan\n```bash\n' >> README.md
grype adegoodyer/ubuntu:latest | tee -a README.md
printf '```\n' >> README.md

# SMOB
printf '\n## SBOM\n```bash\n' >> README.md
syft adegoodyer/ubuntu:latest | tee -a README.md
printf '```\n' >> README.md
