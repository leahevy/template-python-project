# 👥 Contributing

Want to add a contribution to **template-python-project**? Feel free to send a [pull request](https://github.com/leahevy/template-python-project/compare).

---

## 💿 Setup development environment

To setup your development environment it is recommended to setup some kind of virtual Python environment such as [pyenv](https://github.com/pyenv/pyenv) with [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv).

After that you can install the development dependencies with `pip install -e .[dev]`.

It is recommended to install the provided **pre-commit** hook before making any changes: `pre-commit install`.

---

## ⌨️ Setup commands

The following custom **setup.py** commands are available:

<dl>
  <dt><strong>format</strong></dt>
  <dd>Re-formats the code (isort+black)</dd>
  <dt><strong>check_format</strong></dt>
  <dd>Checks the formatting (isort+black)</dd>
  <dt><strong>check_style</strong></dt>
  <dd>Checks the coding style (flake8)</dd>
  <dt><strong>test</strong></dt>
  <dd>Run all tests (pytest)</dd>
  <dt><strong>typechecks</strong></dt>
  <dd>Checks whether all typechecks pass (mypy)</dd>
  <dt><strong>run_build</strong></dt>
  <dd>Builds the package</dd>
  <dt><strong>upload_pypi_public</strong></dt>
  <dd>Uploads the package to the official pypi repository</dd>
  <dt><strong>upload_pypi_test</strong></dt>
  <dd>Uploads the package to the pypi test repository (testpypi)</dd>
  <dt><strong>pre_commit_checks</strong></dt>
  <dd>Run all pre-commit checks</dd>
  <dt><strong>all_checks</strong></dt>
  <dd>Run all checks (including tests and build)</dd>
</dl>

---

## ☁️ How to Create Releases

A release commit should advance the version.

The commit should also be tagged (annotated) with the version and the tag should be pushed to *github.com*:

```bash
git tag -a "v1.0.0" -m "Version v1.0.0"
git push --tags
```

After that a release should be published at *github.com/leahevy* named as *v1.0.0* with a description describing the new features and fixes, e.g.:

```markdown
# 🟢 Version 1.0.0

## ✨ New features

- Some change
- Another change

## 🐞 Bugfixes

- Some fix
- Another fix

## 🌍 See also

**Full Changelog**: <https://github.com/leahevy/template-python-project/compare/v0.0.9...v1.0.0>
```

---

## 🏷 How to Create Releases

Create an account on <https://pypi.org/account/register/>

Use the provided **setup.py** commands to upload the package: `./setup.py upload_pypi_test` (*testpypi* repository) and `./setup.py upload_pypi_public` (default *pypi* repository).

You can also activate the automatic release workflow at **./.github/workflows/release.yml**.