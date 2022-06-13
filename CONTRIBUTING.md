# Contributing

Want to add a contribution to **template-python-with-setup**? Feel free to send a [pull request](https://github.com/leahevy/template-python-with-setup/compare).

---

# How to Create Releases

A release commit should advance the version.

The commit should also be tagged (annotated) with the version and the tag should be pushed to *github.com*:

```bash
git tag -a "v1.0.0" -m "Version v1.0.0"
git push --tags
```

After that a release should be published at *github.com/leahevy* named as *v1.0.0* with a description describing the new features and fixes, e.g.:

```markdown
# Version 1.0.0

## New features

- Some change
- Another change

## Bugfixes

- Some fix
- Another fix

## See also

**Full Changelog**: https://github.com/leahevy/template-python-with-setup/compare/v0.0.9...v1.0.0
```

Create an account on https://pypi.org/account/register/

The package can be build and uploaded with:

```bash
pip install -r requirements-dev.txt
rm -rf dist
python setup.py sdist
twine upload dist/*
```