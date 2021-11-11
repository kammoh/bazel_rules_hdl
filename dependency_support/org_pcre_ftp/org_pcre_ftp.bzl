# Copyright 2021 Google LLC
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

"""Loads the pcre library"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def org_pcre_ftp():
    maybe(
        http_archive,
        name = "org_pcre_ftp",
        urls = [
            "http://ftp.cs.stanford.edu/pub/exim/pcre/pcre-8.45.zip",
        ],
        strip_prefix = "pcre-8.45",
        sha256 = "5b709aa45ea3b8bb73052947200ad187f651a2049158fb5bbfed329e4322a977",
        build_file = Label("//dependency_support:org_pcre_ftp/bundled.BUILD.bazel"),
    )
