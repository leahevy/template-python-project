<div align="center">
<a href="https://github.com/leahevy/template-python-project"><img src="https://raw.githubusercontent.com/leahevy/template-python-project/master/assets/template-python-project.png" width="350px" alt="template-python-project"/></a>
</div>
<br/>

<p align="center">
<b>Template repository for Python projects.</b> 
</p>

<p align="center">
<a href="https://github.com/leahevy/template-python-project/graphs/commit-activity"><img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" alt="This project is maintained"/></a>
<a href="https://github.com/leahevy/template-python-project/actions/workflows/build.yml"><img src="https://github.com/leahevy/template-python-project/actions/workflows/build.yml/badge.svg" alt="Build"/></a>
<a href="https://github.com/leahevy/template-python-project/actions/workflows/tests.yml"><img src="https://github.com/leahevy/template-python-project/actions/workflows/tests.yml/badge.svg" alt="Tests"/></a>
<a href="https://github.com/leahevy/template-python-project/actions/workflows/coverage.yml"><img src="https://raw.githubusercontent.com/leahevy/template-python-project/coverage/coverage.svg" alt="Coverage"/></a>
<a href="https://github.com/leahevy/template-python-project/actions/workflows/style.yml"><img src="https://github.com/leahevy/template-python-project/actions/workflows/style.yml/badge.svg" alt="Coding style"/></a>
<a href="https://github.com/leahevy/template-python-project/actions/workflows/format.yml"><img src="https://github.com/leahevy/template-python-project/actions/workflows/format.yml/badge.svg" alt="Formatting checks"/></a>
<a href="https://github.com/leahevy/template-python-project/actions/workflows/typechecks.yml"><img src="https://github.com/leahevy/template-python-project/actions/workflows/typechecks.yml/badge.svg" alt="Typechecks"/></a>
<a href="https://www.gnu.org/licenses/gpl-3.0"><img src="https://img.shields.io/badge/License-GPLv3-blue.svg" alt="GPLv3"/></a>
<a href="https://www.python.org/"><img src="https://img.shields.io/badge/Made%20with-Python-1f425f.svg" alt="Made with Python"/></a>
<a href="https://www.linux.org/"><img src="https://svgshare.com/i/Zhy.svg" alt="Running on Linux"/></a>
<a href="https://www.apple.com/"><img src="https://svgshare.com/i/ZjP.svg" alt="Running on MacOS"/></a>
<a href="https://github.com/psf/black"><img src="https://img.shields.io/badge/code%20style-black-000000.svg" alt="Formatted with black"/></a>
</p>
  
---

## Template

A Python project template.

## Configure

To configure the template for your project run `./configure-template.sh`,
modify the *README.md* file, and replace the *./assets/template-python-project.png* image.

## Features

- Script (*./configure-template.sh*) to change the file/directory names and references from the template repository to your new repository.
- Example command with main function and argument parsing using *typer*.
- Testing with pytest with coverage report and evaluating doctests (a configurable package shortcut import is injected into the doctest namespace as well).
- GitHub workflows for testing the *build*, *pytest*, *format*, *typechecks*, *style*, and generating a *coverage* svg on each push to **master**.
- GitHub Issue templates and Code-of-Conduct using issue forms.
- Documentation generated and published on GitHub pages using **pdoc**.
- Configured toolchain including *flake8*, *mypy*, *pytest*, *black*, and *isort*.
- *bumpversion* for version updating.
- *editorconfig* file with defaults suitable to PEP expectations (e.g. line length: 79).
- *dependabot* for dependency management.
- *pre-commit* is ready to use.
- *CONTRIBUTING.md* template.

## Installation

To install this package locally for development clone it first using `git clone https://github.com/leahevy/template-python-project` and run: `pip install -e .[dev]`.

For remote installation on your machine you can install it with pip directly from GitHub with the command: `pip install git+https://github.com/leahevy/template-python-project.git`.

## Documentation

The documentation is available at <https://leahevy.github.io/template-python-project>.

> To setup the documentation page, just push to your repository and wait for the *documentation* workflow to finish. After that, setup [GitHub-Pages](https://github.com/leahevy/template-python-project/settings/pages) by setting the branch to **documentation** and the directory to **docs**. Optionally check the **Enforce HTTPS** checkbox.

---

## License

Copyright (C) 2022 Leah Lackner

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
