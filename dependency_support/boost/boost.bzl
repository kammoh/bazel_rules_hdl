# Copyright 2020 The XLS Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Registers Bazel workspaces for the Boost C++ libraries."""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def boost():
    maybe(
        git_repository,
        name = "com_github_nelhage_rules_boost",
        # commit = "7f8b161db3e892289437998a384e1cc5ab11b16c",
        commit = "fce83babe3f6287bccb45d2df013a309fa3194b8",
        
        remote = "https://github.com/nelhage/rules_boost",
        shallow_since = "1591047380 -0700",
        patches = [
            # rules_boost does not include Boost Python, see
            # https://github.com/nelhage/rules_boost/issues/67
            # This is because there doesn't exist a nice standard way in
            # Bazel to depend on the Python headers of the current Python
            # toolchain. The patch below selects the same Python headers
            # that the rest of XLS uses.
            "@rules_hdl//dependency_support/boost:add_python.patch",
        ],
    )
