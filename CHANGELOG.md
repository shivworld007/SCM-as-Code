# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-12-02

### Added
- **Core Modules**:
    - `repository`: Manage repos, branch protection, webhooks, keys.
    - `team`: Manage teams and memberships (Org only).
    - `runner_group`: Manage self-hosted runner groups (Org only).
    - `branch_protection`: Standalone branch protection management.
- **Examples**:
    - `create-repository`: Complete setup for new repositories.
    - `manage-existing-repository`: Import and manage existing repos.
- **Documentation**:
    - Comprehensive `README.md` with architecture and compatibility matrix.
    - Module-level READMEs.
    - `CONTRIBUTING.md` and `LICENSE` (MIT).
- **CI/CD**:
    - GitHub Actions workflow for Terraform validation.
