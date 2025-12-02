# Contributing to SCM-as-Code

Thank you for your interest in contributing to SCM-as-Code! We welcome contributions from the community to make this project better.

## How to Contribute

### Reporting Issues
If you find a bug or have a feature request, please open an issue on GitHub. Provide as much detail as possible, including steps to reproduce the issue.

### Submitting Pull Requests
1.  **Fork the repository** and create your branch from `main`.
2.  **Make your changes**. Ensure your code follows the existing style and conventions.
3.  **Run tests**. Verify that your changes work as expected.
    ```bash
    terraform fmt -recursive
    terraform validate
    ```
4.  **Update documentation**. If your changes affect usage or variables, update the relevant `README.md` files.
5.  **Open a Pull Request**. Describe your changes and reference any related issues.

## Coding Standards
- Use `terraform fmt` to format your code.
- Follow standard Terraform best practices (e.g., use `snake_case` for names).
- Document all new variables and outputs.

## License
By contributing, you agree that your contributions will be licensed under its MIT License.
