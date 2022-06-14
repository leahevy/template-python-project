#!/usr/bin/env python
import pty
import sys

from setuptools import Command, find_packages, setup


def shell(cmd: str, *args: str, fatal_on_error: bool = True) -> None:
    res = pty.spawn([cmd] + list(args))
    if fatal_on_error and res != 0:
        sys.exit(res)


def shellcommand(
    name: str, cmds: list[list[str]], desc: str | None = None
) -> type[Command]:
    class InnerCommand(Command):
        user_options: list[str] = []
        description = desc
        if description is None:
            description = f"Runs the commands: {str(cmds)}"

        def initialize_options(self) -> None:
            pass

        def finalize_options(self) -> None:
            pass

        def run(self) -> None:
            for cmd in cmds:
                shell(cmd[0], *cmd[1:])

    InnerCommand.__name__ = name + "Command"
    return InnerCommand


with open("requirements.txt", "r") as f:
    required_packages = f.read().strip().split()

with open("requirements-dev.txt", "r") as f:
    required_dev_packages = f.read().strip().split()

with open("README.md", "r") as f:
    long_description = f.read().strip()

setup_info = dict(
    name="template-python-project",
    version="0.6.0",
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
    cmdclass={
        "format": shellcommand(
            "Format",
            [["black", "."], ["isort", "."]],
            desc="Re-formats the code (isort+black)",
        ),
        "check_format": shellcommand(
            "FormatCheck",
            [["./.pre-commit.sh", "format"]],
            desc="Checks the formatting (isort+black)",
        ),
        "check_style": shellcommand(
            "Style",
            [["./.pre-commit.sh", "style"]],
            desc="Checks the coding style (flake8)",
        ),
        "test": shellcommand(
            "Test",
            [["./.pre-commit.sh", "test"]],
            desc="Run all tests (pytest)",
        ),
        "typechecks": shellcommand(
            "Typechecks",
            [["./.pre-commit.sh", "typechecks"]],
            desc="Checks whether all typechecks pass (mypy)",
        ),
        "run_build": shellcommand(
            "Build",
            [["rm", "-rf", "dist"], ["./.pre-commit.sh", "build"]],
            desc="Builds a source distribution",
        ),
        "upload_pypi_public": shellcommand(
            "UploadPypiPublic",
            [
                ["rm", "-rf", "dist"],
                ["./.pre-commit.sh", "build"],
                ["bash", "-c", "twine upload dist/*"],
            ],
            desc="Uploads the package to the official pypi repository",
        ),
        "upload_pypi_test": shellcommand(
            "UploadPypiTest",
            [
                ["rm", "-rf", "dist"],
                ["./.pre-commit.sh", "build"],
                ["bash", "-c", "twine upload --repository testpypi dist/*"],
            ],
            desc="Uploads the package to the pypi test repository (testpypi)",
        ),
        "pre_commit_checks": shellcommand(
            "PreCommit",
            [["./.pre-commit.sh", "on-commit"]],
            desc="Run all pre-commit checks",
        ),
        "all_checks": shellcommand(
            "AllChecks",
            [["./.pre-commit.sh", "all"]],
            desc="Run all checks (including tests and build)",
        ),
    },
)
setup(**setup_info)  # type: ignore
