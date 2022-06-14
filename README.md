<div align="center">
<img src="https://raw.githubusercontent.com/leahevy/template-python-with-setup/master/assets/template-python-with-setup.png" width="350px"/> 
</div>
<br/>

<p align="center">
<b>Template repository for Python projects.</b> 
</p>

<p align="center">
<a href="https://github.com/leahevy/template-python-with-setup/graphs/commit-activity"><img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg"/></a>
<a href="https://github.com/leahevy/template-python-with-setup/actions/workflows/build.yml"><img src="https://github.com/leahevy/template-python-with-setup/actions/workflows/build.yml/badge.svg"/></a>
<a href="https://github.com/leahevy/template-python-with-setup/actions/workflows/tests.yml"><img src="https://github.com/leahevy/template-python-with-setup/actions/workflows/tests.yml/badge.svg"/></a>
<a href="https://github.com/leahevy/template-python-with-setup/actions/workflows/coverage.yml"><img src="https://raw.githubusercontent.com/leahevy/template-python-with-setup/coverage/coverage.svg"/></a>
<a href="https://github.com/leahevy/template-python-with-setup/actions/workflows/style.yml"><img src="https://github.com/leahevy/template-python-with-setup/actions/workflows/style.yml/badge.svg"/></a>
<a href="https://github.com/leahevy/template-python-with-setup/actions/workflows/format.yml"><img src="https://github.com/leahevy/template-python-with-setup/actions/workflows/format.yml/badge.svg"/></a>
<a href="https://github.com/leahevy/template-python-with-setup/actions/workflows/typechecks.yml"><img src="https://github.com/leahevy/template-python-with-setup/actions/workflows/typechecks.yml/badge.svg"/></a>
<a href="https://www.gnu.org/licenses/gpl-3.0"><img src="https://img.shields.io/badge/License-GPLv3-blue.svg"/></a>
<a href="https://www.python.org/"><img src="https://img.shields.io/badge/Made%20with-Python-1f425f.svg"/></a>
<a href="https://www.linux.org/"><img src="https://svgshare.com/i/Zhy.svg"/></a>
<a href="https://www.apple.com/"><img src="https://svgshare.com/i/ZjP.svg"/></a>
<a href="https://github.com/psf/black"><img src="https://img.shields.io/badge/code%20style-black-000000.svg"/></a>
</p>
  
---

## Template

A Python project template with a setup.py file.

## Configure

To configure the template for your project run `./configure-template.sh`,
modify the *README.md* file, and replace the *./assets/template-python-with-setup.png* image.

## Features

- Script (*./configure-template.sh*) to change the file/directory names and references from the template repository to your new repository.
- Example command with main function and argument parsing using *typer*.
- Testing with pytest with coverage report and evaluating doctests (a configurable package shortcut import is injected into the doctest namespace as well).
- GitHub workflows for testing the *build*, *pytest*, *format*, *typechecks*, *style*, and generating a *coverage* svg on each push to **master**.
- GitHub Issue templates and Code-of-Conduct using issue forms.
- Configured toolchain including *flake8*, *mypy*, *pytest*, *black*, and *isort*.
- *bumpversion* for version updating.
- *editorconfig* file with defaults suitable to PEP expectations (e.g. line length: 79).
- *dependabot* for dependency management.
- *pre-commit* is ready to used (you could remove the **test** command from *pre-commit* by modifying *./.pre-commit.sh* if your pre-commit hook takes too long, but this may lead to a **failed** *test* badge in the Readme).
- *CONTRIBUTING.md* template.

---

## License

Copyright (C)  2022 Leah Lackner

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
