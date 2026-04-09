---
name: repo-researcher
description: Research and analyze GitHub repositories. Use when asked to explore, debug, or understand a codebase from a GitHub URL or owner/repo pointer.
---

# Repo Researcher

This skill allows you to download and perform deep research on any GitHub repository to solve problems or answer technical questions.

## Workflow

1.  **Sync the Repository**: Use the `sync_repo.sh` script to clone or update the repository in the local cache.
    ```bash
    ./scripts/sync_repo.sh <github-url-or-slug>
    ```
    This script will return the absolute path to the repository on the local filesystem.

2.  **Investigate**: Once you have the local path, use tools to explore the codebase. 
    **Note**: If the path is outside your current workspace (e.g., in `~/.gemini/cache`), specialized tools like `codebase_investigator` or `list_directory` may be restricted. In these cases, **always use `run_shell_command`** with standard Unix tools (`ls`, `grep`, `find`, `cat`) to perform your research.

    - `run_shell_command`: Use `ls -R`, `grep -r`, or `find` to explore the structure and content.
    - `grep_search`: Try using the `dir_path` parameter, but fall back to `run_shell_command("grep ...")` if restricted.

3.  **Solve/Answer**: Synthesize the information gathered from the tools to provide a comprehensive answer or solution to the user's request.

## Example

**User**: "How does the caching work in the `jax-ml/jax` repo?"

**Agent**:
1. Run `./scripts/sync_repo.sh jax-ml/jax`
2. Received path: `/home/user/.gemini/cache/repos/jax-ml_jax`
3. Call `codebase_investigator(objective="Understand the caching mechanisms in the JAX repository at /home/user/.gemini/cache/repos/jax-ml_jax")`
4. Use `grep_search` and `read_file` to drill into specific cache implementations.
5. Provide the final explanation.
