# Git Fundamentals

<p align="center">
  <img src="https://www.atatus.com/blog/content/images/2021/06/Untitled--12-.jpeg"style="width: 100%; max-width: 400px; height: auto;" alt="Banner"/>


## Starting Your Own Project

1. **Initialize git** to create a local repository within the project directory using `git init`
2. **Create a new repository** on GitHub
3. **Link the remote repository** on GitHub to your local repository using `git remote add origin REMOTE-URL` and verify that you set the remote URL correctly using `git remote -v`
4. **Collaborators should clone** the repo to create a local repository using `git clone repo-link.git`

## Git Basic Local Lifecycle

1. **Initialize git** in the working directory using `git init`
2. **Create/clone repo** (if not already done)
3. **Modify files** locally in your working directory
4. **Review changes** using `git status` and `git diff`
5. **Stage changes** to the staging area using `git add <filename>` or `git add .` for all changes
6. **Commit changes** with a descriptive message using `git commit -m "Your commit message"`
7. **Push to remote repo** using `git push origin main` (or your branch name)

## Git Collaboration Lifecycle

1. **Pull latest changes** from remote using `git pull origin main` before starting work
2. **Create a new branch** for your feature using `git checkout -b feature-branch-name`
3. **Make your changes** and follow the basic lifecycle (modify → status/diff → add → commit)
4. **Push your branch** to remote using `git push origin feature-branch-name`
5. **Create a Pull Request** (PR) on GitHub for code review
6. **Merge approved changes** into main branch
7. **Delete feature branch** after merging to keep repo clean
8. **Pull updated main** to sync your local repository

## Essential Commands Reference

- `git status` - Check current state of working directory and staging area
- `git diff` - Show differences between working directory and staging area
- `git log` - View commit history
- `git branch` - List all branches
- `git checkout <branch-name>` - Switch to a different branch
- `git merge <branch-name>` - Merge specified branch into current branch
- `git pull` - Fetch and merge changes from remote repository
- `git fetch` - Download changes from remote without merging

## Best Practices

- Always pull before starting new work to avoid conflicts
- Write clear, descriptive commit messages
- Commit frequently with logical chunks of work
- Use branches for new features or bug fixes
- Review changes before committing using `git diff`
- Never commit directly to main branch in collaborative projects

