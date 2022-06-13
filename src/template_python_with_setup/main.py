import typer
from rich import print

app = typer.Typer()


@app.command()
def main_command():
    """
    Doctest test:

    >>> print("True")
    True
    """
    print("[green]Hello[/green] [yellow]World[/yellow][red]![/red]")


def main():
    app()


if __name__ == "__main__":
    main()
