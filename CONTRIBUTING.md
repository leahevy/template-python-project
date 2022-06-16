# 👥 Contributing

Want to add a contribution to **template-python-project**? Feel free to send a [pull request](https://github.com/leahevy/template-python-project/compare).

---

## 💿 Setup development environment

To setup your development environment it, is recommended to setup some kind of virtual Python environment such as [pyenv](https://github.com/pyenv/pyenv) with [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv).

After that you can install the development dependencies with `make install-dev`.

---

## ⌨️ Development commands

To see the development commands, run `make help`.

---

## ☁️ How to Create Releases on GitHub

Advance the version with one of:

- `make bump-major`
- `make bump-major`
- `make bump-patch`

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

## 🏷 How to publish releases on Pypi

Create an account on <https://pypi.org/account/register/>

Use the provided **Makefile** commands to upload the package: `make upload-pypi-test` (*testpypi* repository) and `make upload-pypi-public` (default *pypi* repository).

You can also activate the automatic release workflow (**./.github/workflows/release.yml**).
