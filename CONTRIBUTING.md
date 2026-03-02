# CONTRIBUTING

## sVIe project installation

1. Fork this repo on [Github](https://docs.github.com/en/get-started/quickstart/fork-a-repo)
2. Clone your fork on your machine: `git clone https://github.com/<your-username>/svie`
3. Add a new remote repo to track

```sh
git remote add upstream git@github.com:<your-username>/svie.git
```

## Add a new feature

If you wish to add a new feature, improving/make documentation, refactor, etc..., please, make a PR on the [devel](https://github.com/szorfein/svie/tree/devel) branch, they will be manually tested before integrate the main branch.

```sh
git checkout -b devel
git checkout -b new-cool-feature devel
```

And work on until it works, when finished:

    git push origin new-cool-feature

Target this `new-cool-feature` from your repository on my `devel` branch.

## Fixes bug, runtime error

For important bugs, error, make your PR on default `main` branch.

```sh
git checkout -b fix-zettel main
```

And work on until it works, when finished:

    git push origin fix-zettel

Target this `fix-zettel` from your repository on my `main` branch.

## Before contributing

- When making a PR (pull request), please be very descriptive about what you've done!
- Commit messages must follow [Conventional Commits Specification](https://www.conventionalcommits.org/en/v1.0.0/)
  - PR titles and commit messages should be formatted with 'fix', 'feat', 'docs', 'refactor', or 'chore'. ex: feat: add new plugin
  - If your contribution mostly pertains to a single module in the project, please include that in the title. ex: If you have modified something in the lua/configs/lsp folder for the lsp configuration use something like fix(lsp): typo in lsp mapping
  - If your contribution contains any sort of breaking change include a ! at the end of the change type. ex: feat!: move status bar from lualine to feline
- We are open to all PRs, but if a PR is denied for any reason please don't be discouraged! We'll still be open to discussions. If you have any questions before opening the PR feel free to create a new issue.
- sVIe projects aim to provide the best user experience when it comes to being able to support confident updating for users, for this reason please avoid opening PRs with breaking changes. Avoiding breaking changes is not always going to be possible, so if you think it is completely necessary we are open to discussion.

## Help

For help with contributing and anything else, just report an [issue](https://github.com/szorfein/svie/issues)
