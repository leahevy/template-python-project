#!/usr/bin/env python
from setuptools import find_packages, setup

with open("requirements.txt", "r") as f:
    required_packages = f.read().strip().split()

with open("requirements-dev.txt", "r") as f:
    required_dev_packages = f.read().strip().split()

with open("README.md", "r") as f:
    long_description = f.read().strip()

setup_info = dict(
    name="template-python-with-setup",
    version="0.2.0",
    author="Leah Lackner",
    author_email="leah.lackner+github@gmail.com",
    url="https://github.com/leahevy/template-python-with-setup",
    project_urls={
        "Documentation": "https://github.com/leahevy/"
        "template-python-with-setup"
        "/blob/master/README.md",
        "Source": "https://github.com/leahevy/template-python-with-setup",
        "Tracker": "https://github.com/leahevy/"
        "template-python-with-setup/issues",
    },
    description="A Python project template with a setup.py file.",
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
            "template-python-with-setup=template_python_with_setup.main:main"
        ],
    },
    package_dir={"": "src"},
    packages=find_packages(where="src"),
    python_requires=">=3.10",
    install_requires=required_packages,
    extras_require={
        "dev": required_dev_packages,
    },
    cmdclass={},
)
setup(**setup_info)  # type: ignore
