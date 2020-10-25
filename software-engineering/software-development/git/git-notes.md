# git notes

## Remove commit

The easiest way to <u>undo the last Git commit</u> is to execute the “git reset” command with the “–soft” option that will preserve changes done to your files. You have to specify the commit to undo which is “HEAD~1” in this case.

The last commit will be removed from your Git history.

```bash
$ git reset --soft HEAD~1
```

The [“git reset” command](https://git-scm.com/docs/git-reset) can be seen as the opposite of the “git add” command, essentially adding files to the Git index.

When specifying the “–soft” option, Git is instructed not to modify the files in the working directory or in the index at all.

As an example, let’s say that you have added two files in your most recent commit but you want to perform some modifications on this file.

```bash
$ git log --oneline --graph

* b734307 (HEAD -> master) Added a new file named "file1"
* 90f8bb1 Second commit
* 7083e29 Initial repository commit
```

As a consequence, you will use “git reset” with the “–soft” option in order **to undo the last commit** and perform additional modifications.

```bash
$ git reset --soft HEAD~1

$ git status

On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   file1

$ git log --oneline --graph

* 90f8bb1 (HEAD -> master) Second commit
* 7083e29 Initial repository commit
```

As you can see, by undoing the last commit, the file is still in the index (changes to be committed) but the commit was removed.

---

There are four ways of removing specific commit:

- Clean way, reverting but keep in log the revert:

  ```bash
  git revert --strategy resolve <commit>
  ```

- Harsh way, remove altogether only the last commit:

  ```bash
  git reset --soft "HEAD^"
  ```

Note: Avoid `git reset --hard` as it will also discard all changes in files since the last commit. If `--soft` does not work, rather try `--mixed` or `--keep`.

- Rebase (show the log of the last 5 commits and delete the lines you don't want, or reorder, or squash multiple commits in one, or do anything else you want, this is a very versatile tool):

  ```bash
  git rebase -i HEAD~5
  ```

And if a mistake is made:

```bash
git rebase --abort
```

- Quick rebase: remove only a specific commit using its id:

  ```bash
  git rebase --onto commit-id^ commit-id
  ```

- Alternatives: you could also try:

  ```bash
  git cherry-pick commit-id
  ```

  > Nice command! I used it when GitHub didn't show my commits in the history.

- Yet another alternative:

  ```bash
  git revert --no-commit
  ```

- As a last resort, if you need full freedom of history editing (eg, because git don't allow you to edit what you want to), you can use this [very fast](http://esr.ibiblio.org/?p=4861) open source application: [reposurgeon](http://www.catb.org/esr/reposurgeon/).

Note: of course, all these changes are done locally, you should `git push` afterwards to apply the changes to the remote. And in case your repo doesn't want to remove the commit ("no fast-forward allowed", which happens when you want to remove a commit you already pushed), you can use `git push -f` to force push the changes.

Note2: if working on a branch and you need to force push, you should absolutely avoid `git push --force` because this may overwrite other branches (if you have made changes in them, even if your current checkout is on another branch). Prefer to **always specify the remote branch when you force push**: `git push --force origin your_branch`.

## Rewriting history in Git

> Dangerous zone! :fire: :radioactive:

**Issue**

After git pushing to Github, I notice that I have two accounts with identical names: vladkinoman and vladkinoman. Using git show, I found that my commits have different emails:

- `vladkinoman@github.com`
- `vladbeklenyshchev@gmail.com` - my primary email, this is what I want to see in the history of the repository.

**Solution**

The problem is the email specified in the config files. I changed my login on Github. After that, I probably forgot to introduce myself to the system.

I had many similar occurrences in the history. Plus, this is my personal repository, so I decided to rewrite the history.

We can use "filter-branch" command. It allows you to batch-process a (potentially large) number of commits with a script. You can run the below sample script in your repository (filling in real values for the old and new email and name):

```bash
$ git filter-branch --env-filter '
WRONG_EMAIL="wrong@example.com"
NEW_NAME="New Name Value"
NEW_EMAIL="correct@example.com"

if [ "$GIT_COMMITTER_EMAIL" = "$WRONG_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$NEW_NAME"
    export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$WRONG_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$NEW_NAME"
    export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
```

The same warning applies to this method as to the others mentioned: **you are rewriting history with this command**, creating new commit objects along the way!

Preferably, you should only do this in repositories that haven't been published / shared, yet. In any other case you should **use it with extreme care** - and only if you're aware of the side effects!

## Add all files to a commit except a single file

**For a file**

```bash
git add -u
git reset -- main/dontcheckmein.txt
```

**For a folder**

```bash
git add -u
git reset -- main/*
```

The -u option updates the index just where it already has an entry matching `<pathspec>`. This removes as well as modifies index entries to match the working tree, but adds no new files. If no `<pathspec>` is given when -u option is used, all tracked files in the entire working tree are updated (old versions of Git used to limit the update to the current directory and its subdirectories).

-u is used to reference your current branch you're pushing to. You will no longer need to type `git push origin master` in your next push, just `git push` and git will know that is it in master branch.

## References

1. https://devconnected.com/how-to-undo-last-git-commit/#:~:text=The%20easiest%20way%20to%20undo,removed%20from%20your%20Git%20history
2. https://stackoverflow.com/questions/2938301/remove-specific-commit
3. https://www.git-tower.com/learn/git/faq/change-author-name-email/
4. https://stackoverflow.com/questions/4475457/add-all-files-to-a-commit-except-a-single-file