#!/usr/bin/env python
#
# Copyright (C) 2022 Leah Lackner
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

import pty
import sys

from setuptools import Command, find_packages, setup

with open("requirements.txt", "r") as f:
    required_packages = f.read().strip().split()

with open("requirements-dev.txt", "r") as f:
    required_dev_packages = f.read().strip().split()

with open("README.md", "r") as f:
    long_description = f.read().strip()

setup_info = dict(
    name="template-python-project",
    version="0.25.0",
    author="Leah Lackner",
    author_email="leah.lackner+github@gmail.com",
    url="https://github.com/leahevy/template-python-project",
    project_urls={
        "Documentation": "https://github.com/leahevy/"
        "template-python-project"
        "/blob/master/README.md",
        "Source": "https://github.com/leahevy/template-python-project",
        "Tracker": "https://github.com/leahevy/"
        "template-python-project/issues",
    },
    description="A Python project template.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    platforms="Linux, Mac OSX",
    license="GPLv3",
    include_package_data=True,
    classifiers=[
        "Development Status :: 2 - Pre-Alpha",
        "Environment :: Console",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: GNU General"
        " Public License v3 or later (GPLv3+)",
        "Operating System :: MacOS :: MacOS X",
        "Operating System :: POSIX :: Linux",
        "Programming Language :: Python :: 3.10",
    ],
    zip_safe=True,
    entry_points={
        "console_scripts": [
            "template-python-project=template_python_project.cli:main"
        ],
    },
    package_dir={"": "."},
    packages=find_packages(where="."),
    python_requires=">=3.10",
    install_requires=required_packages,
    extras_require={
        "dev": required_dev_packages,
    },
    cmdclass={},
)
setup(**setup_info)  # type: ignore
