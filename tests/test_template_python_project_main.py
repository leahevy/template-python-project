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

from types import ModuleType


def test_template_python_project_api_some(
    template_python_project: ModuleType,
) -> None:
    template_python_project.api.some_api_func()


def test_template_python_project_api_other(
    template_python_project: ModuleType,
) -> None:
    template_python_project.api.other_api_func()
