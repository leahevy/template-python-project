from typing import Any

import pytest

import template_python_with_setup


@pytest.fixture(autouse=True)
def add_imports(doctest_namespace: dict[str, Any]) -> None:
    doctest_namespace["tp"] = template_python_with_setup
