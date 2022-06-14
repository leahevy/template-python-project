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

"""This is the main module docstring.

Some description comes here.
"""

import os.path
import sys

import typer
from rich import print

from .__version__ import __version__

app = typer.Typer()


@app.command()
def main(
    version: bool = typer.Option(
        False, "-v", "--version", help="Print the version"
    )
) -> None:
    """
    Doctest test:

    >>> print("True")
    True
    """
    if version:
        print(
            f"[green]{os.path.basename(sys.argv[0])}:[/green]"
            f" [blue]v{__version__}[/blue]"
        )
        return None
    print("[green]Hello[/green] [yellow]World[/yellow][red]![/red]")


def run_main() -> None:
    app()


if __name__ == "__main__":
    run_main()
