# Day 24 – Advanced Git: Merge, Rebase, Stash & Cherry Pick

## Task 1 - Git Merge

### What is a fast-forward merge?

Occurs when `main` has no new commits since the feature branch was created. Git simply moves the `main` pointer forward without creating a new commit.

### When does Git create a merge commit instead?

Git creates a merge commit when both branches contain unique commits and their histories need to be combined.


### What is a merge conflict?

A merge conflict occurs when Git cannot automatically determine which changes should be kept because the same file or line was modified differently in multiple branches.

### Commands Practiced

```bash
# Create feature-login branch and switch to that branch..
git checkout -b feature-login

# Create commits
echo "Login Page" > login.txt
git add .
git commit -m "Add login page"

echo "Login Validation" >> login.txt
git add .
git commit -m "Add login validation"

# Merge into master/main
git checkout master
git merge feature-login
```

### Example of Merge Conflict

```bash
git checkout -b conflict-test

echo "Version A" > app.txt
git add .
git commit -m "Version A"

git checkout master

echo "Version B" > app.txt
git add .
git commit -m "Version B"

git checkout conflict-test

echo "Version C" > app.txt
git add .
git commit -m "Version C"

git checkout master
git merge conflict-test
```

Resolve conflict:

```bash
git add app.txt
git commit
```


## Task 2: Git Rebase — Hands-On

### Commands & Execution
```bash
git checkout -b feature-dashboard
echo "Dashboard UI" > dashboard.txt && git add . && git commit -m "Dashboard UI"
echo "Dashboard Backend" >> dashboard.txt && git add . && git commit -m "Dashboard Backend"

# Update master
git checkout master
echo "Main Update" > update.txt && git add . && git commit -m "main Updated" 

# Rebase
git checkout feature-dashboard
git rebase master
```

### Key Concepts
* **What Rebase Does:** Rewrites history by moving feature branch commits and re-applying them individually on top of the latest target branch commit.
* **History Difference:** Merge preserves exact branch timeline with a multi-parent commit. Rebase creates a clean, linear history.
* **Golden Rule of Rebase:** **Never rebase public/shared commits.** It rewrites commit hashes, causing divergence and merge conflicts for collaborators.
* **Rebase vs. Merge:** Use rebase for a clean history on local branches And Use merge when working with shared branches and preserving branch history.
---

## Task 3: Squash Commit vs Merge Commit

### Commands & Execution
```bash
git checkout -b feature-profile

echo "Profile Page" > profile.txt && git add . && git commit -m "Profile page"
echo "Typo Fix" >> profile.txt && git add . && git commit -m "Fix typo"
echo "Formatting" >> profile.txt && git add . && git commit -m "Formatting"

git checkout master

git merge --squash feature-profile
git commit -m "Add complete profile feature"
```

### Key Concepts
* **Squash Merging:** Squash merge combines all commits from a feature branch into a single commit before merging.
* **When to Use:** Use squash merge when there are many small commits & Use regular merge when detailed history is important.
* **Trade-off:** The detailed commit history is lost.

---

## Task 4: Git Stash — Hands-On

### Commands & Execution
```bash
# Create temporary changes
echo "Work in progress" > temp.txt

# Stash tracked files
git stash

# Stash including untracked files
git stash -u

# View stashes
git stash list

# Restore and remove stash
git stash pop

# Restore but keep stash
git stash apply stash@{0}
```

### Key Concepts
* **`stash pop` vs `stash apply`:** git stash pop restores changes and removes the stash entry. While git stash apply restores changes but keeps the stash entry.
* **Real-World Usage:** When switching tasks quickly without committing unfinished work.
---

## Task 5: Cherry Picking

### Commands & Execution
```bash
git checkout -b feature-hotfix
echo "c1" > f1.txt && git add . && git commit -m "Commit 1"
echo "c2" > f2.txt && git add . && git commit -m "Commit 2: critical fix"
echo "c3" > f3.txt && git add . && git commit -m "Commit 3"

# Pick only Commit 2 onto main
git checkout main
git cherry-pick <COMMIT-2-HASH>
```

### Key Concepts
* **What Cherry-Pick Does:** Applies the specific changes of a single commit from another branch onto your current branch as a new commit.
* **Real-World Usage:** To apply a specific bug fix or hotfix without merging the entire branch.
* **Risks:** It can create conflicts, duplicate commits, and make history harder to understand.
---



## Key Learnings

* Merge combines branch histories.
* Rebase rewrites history into a linear timeline.
* Squash merge combines multiple commits into one.
* Stash temporarily saves unfinished work.
* Cherry-pick copies individual commits between branches.
* Merge preserves history while rebase creates a cleaner history.

## Summary of Commands (`git-commands.md` reference)

| Command | Category | Description |
| :--- | :--- | :--- |
| `git merge <branch>` | Merge | Combines specified branch into current branch |
| `git merge --squash <branch>` | Merge | Squashes multiple branch commits into one commit |
| `git rebase <branch>` | Rebase | Re-applies current commits on top of target branch |
| `git stash` | Stash | Temporarily stashes modified tracked files |
| `git stash pop` | Stash | Applies latest stash and deletes it |
| `git stash apply stash@{N}` | Stash | Applies specific stash index without deleting |
| `git stash list` | Stash | Lists all stashed changes |
| `git cherry-pick <hash>` | Cherry-Pick | Applies specific commit onto current branch |
