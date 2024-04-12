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

workspace(name = "rules_hdl")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

http_archive(
    name = "rules_cc",
    sha256 = "2037875b9a4456dce4a79d112a8ae885bbc4aad968e6587dca6e64f3a0900cdf",
    strip_prefix = "rules_cc-0.0.9",
    urls = ["https://github.com/bazelbuild/rules_cc/releases/download/0.0.9/rules_cc-0.0.9.tar.gz"],
)

http_archive(
    name = "toolchains_llvm",
    sha256 = "b7cd301ef7b0ece28d20d3e778697a5e3b81828393150bed04838c0c52963a01",
    strip_prefix = "toolchains_llvm-0.10.3",
    canonical_id = "0.10.3",
    url = "https://github.com/grailbio/bazel-toolchain/releases/download/0.10.3/toolchains_llvm-0.10.3.tar.gz",
)

http_archive(
    name = "bazel_skylib",
    sha256 = "74d544d96f4a5bb630d465ca8bbcfe231e3594e5aae57e1edbf17a6eb3ca2506",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
    ],
)

load("@toolchains_llvm//toolchain:deps.bzl", "bazel_toolchain_dependencies")

bazel_toolchain_dependencies()

load("@toolchains_llvm//toolchain:rules.bzl", "llvm_toolchain")

llvm_toolchain(
    name = "llvm_toolchain",
    llvm_version = "16.0.0",
)

load("@llvm_toolchain//:toolchains.bzl", "llvm_register_toolchains")

llvm_register_toolchains()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

rules_python_version = "0.31.0"
maybe(
    http_archive,
    name = "rules_python",
    integrity = "sha256-xovcT77CXeW1STuIGc/Id8TqKZwNyxXCRMWgAgjN4xE=",
    strip_prefix = "rules_python-%s" % (rules_python_version,),
    url = "https://github.com/bazelbuild/rules_python/releases/download/%s/rules_python-%s.tar.gz" % (rules_python_version, rules_python_version)
)

load("@rules_python//python:repositories.bzl", "python_register_toolchains", "py_repositories")

python_register_toolchains(
    name = "python39",

    # Required for our containerized CI environments; we do not recommend
    # building bazel_rules_hdl as root normally.
    ignore_root_user_error = True,
    python_version = "3.9",
)

py_repositories()

# This sysroot is used by github.com/vsco/bazel-toolchains.
# Disabled for now waiting on https://github.com/pybind/pybind11_bazel/pull/29
# py_bind11 relies on installed linux headers which a custom sysroot disables.
# Once hermetic python is supported this should no longer be an issue.
# http_archive(
#     name = "org_chromium_sysroot_linux_x64",
#     build_file_content = """
# filegroup(
#   name = "sysroot",
#   srcs = glob(["*/**"]),
#   visibility = ["//visibility:public"],
# )
# """,
#     sha256 = "73d828bf653f8f8548be704ce1ded4d195bf2bf937fc5426dd5636a9940d1969",
#     urls = ["https://commondatastorage.googleapis.com/chrome-linux-sysroot/toolchain/3c248ba4290a5ad07085b7af07e6785bf1ae5b66/debian_stretch_amd64_sysroot.tar.xz"],
# )

# load("@com_grail_bazel_toolchain//toolchain:deps.bzl", "bazel_toolchain_dependencies")

# bazel_toolchain_dependencies()

# load("@com_grail_bazel_toolchain//toolchain:rules.bzl", "llvm_toolchain")

# llvm_toolchain(
#     name = "llvm_toolchain",
#     llvm_version = "10.0.1",
#     sha256 = {
#         "linux": "02a73cfa031dfe073ba8d6c608baf795aa2ddc78eed1b3e08f3739b803545046",
#     },
#     strip_prefix = {
#         "linux": "clang+llvm-10.0.1-x86_64-pc-linux-gnu",
#     },
#     urls = {
#         "linux": [
#             # Use a custom built Clang+LLVM binrary distribution that is more portable than
#             # the official builds because it's built against an older glibc and does not have
#             # dynamic library dependencies to tinfo, gcc_s or stdlibc++.
#             #
#             # For more details, see the files under toolchains/clang.
#             "https://github.com/retone/deps/releases/download/na5/clang+llvm-10.0.1-x86_64-pc-linux-gnu.tar.xz",
#         ],
#     },
#     # Disabled for now waiting on https://github.com/pybind/pybind11_bazel/pull/29
#     # sysroot = {
#     #     "linux": "@org_chromium_sysroot_linux_x64//:sysroot",
#     # },
# )

maybe(
    http_archive,
    name = "rules_7zip",
    sha256 = "fd9e99f6ccb9e946755f9bc444abefbdd1eedb32c372c56dcacc7eb486aed178",
    strip_prefix = "rules_7zip-e00b15d3cb76b78ddc1c15e7426eb1d1b7ddaa3e",
    urls = ["https://github.com/zaucy/rules_7zip/archive/e00b15d3cb76b78ddc1c15e7426eb1d1b7ddaa3e.zip"],
)

load("@rules_7zip//:setup.bzl", "setup_7zip")

setup_7zip()

maybe(
    http_archive,
    name = "rules_proto",
    sha256 = "dc3fb206a2cb3441b485eb1e423165b231235a1ea9b031b4433cf7bc1fa460dd",
    strip_prefix = "rules_proto-5.3.0-21.7",
    urls = [
        "https://github.com/bazelbuild/rules_proto/archive/refs/tags/5.3.0-21.7.tar.gz",
    ],
)

maybe(
    http_archive,
    name = "rules_pkg",
    sha256 = "a89e203d3cf264e564fcb96b6e06dd70bc0557356eb48400ce4b5d97c2c3720d",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.5.1/rules_pkg-0.5.1.tar.gz",
        "https://github.com/bazelbuild/rules_pkg/releases/download/0.5.1/rules_pkg-0.5.1.tar.gz",
    ],
)

load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

rules_pkg_dependencies()

load("@rules_pkg//toolchains:rpmbuild.bzl", "rpmbuild_register_toolchains")

rpmbuild_register_toolchains()

# Third Party
load("//dependency_support:dependency_support.bzl", "dependency_support")

dependency_support()
# Third Party

load("@python39//:defs.bzl", "interpreter")
load("//:init.bzl", "init")

init(python_interpreter_target = interpreter)
