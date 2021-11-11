# Copyright 2020 Google LLC
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

"""Loads the TCL scripting language."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def tk_tcl():
    maybe(
        http_archive,
        name = "tk_tcl",
        urls = [
            "https://prdownloads.sourceforge.net/tcl/tcl8.6.12-src.tar.gz",
        ],
        strip_prefix = "tcl8.6.12",
        sha256 = "26c995dd0f167e48b11961d891ee555f680c175f7173ff8cb829f4ebcde4c1a6",
        build_file = Label("//dependency_support:tk_tcl/bundled.BUILD.bazel"),
    )
