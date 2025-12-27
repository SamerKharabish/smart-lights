# Contributing

This project follows a strict workflow to keep changes reviewable and releasable.

## Branching model

- `main`is always releasable.
- Work happens on short-lived branches off `main`.

## Branch Branch

The branch specification must follow the [Conventional Branch](https://conventional-branch.github.io/)
spec:

- main: The main development branch (e.g., main, master, or develop)
- feature/: For new features (e.g., feature/add-login-page, feat/add-login-page)
- bugfix/: For bug fixes (e.g., bugfix/fix-header-bug, fix/header-bug)
- hotfix/: For urgent fixes (e.g., hotfix/security-patch)
- release/: For branches preparing a release (e.g., release/v1.2.0)
- chore/: For non-code tasks like dependency, docs updates (e.g., chore/update-dependencies)

## Conventional Commits

The commit specification must follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
spec and correlate with Semantic Versioning.

The commit message should be structured as follows:

```bash
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Types are:

- feat: For new features (this correlates with MINOR in Semantic Versioning).
- fix: For bug fixes (this correlates with PATCH in Semantic Versioning).
- chore: For non-code tasks like dependency, docs updates.

Footer could be:

- BREAKING CHANGE or appends a ! after the type/scope: For breaking API change (correlating with
  MAJOR in Semantic Versioning).

Additional types are not mandated by the Conventional Commits specification, and have no implicit
effect in Semantic Versioning (unless they include a BREAKING CHANGE). A scope may be provided to a
commit’s type, to provide additional contextual information and is contained within parenthesis,
e.g., feat(parser): add ability to parse arrays.

## Semantic Versioning

This project follows the [Semantic Versioning 2.0.0](https://semver.org/) scheme:

Given a version number MAJOR.MINOR.PATCH, the:

1. MAJOR version increments when incompatible API changes are made
2. MINOR version increments when functionality in a backward compatible manner are added
3. PATCH version increments when backward compatible bug fixes are made

Releases are made by tagging `main`: `v0.1.0`, `v0.1.1`, `v0.2.0`, ...

The changelog is updated for each release (see [changelog.md](../changelog.md)).
