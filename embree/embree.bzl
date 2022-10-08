"""
    SPDX-FileCopyrightText: 2022 Julian Amann <dev@vertexwahn.de>
    SPDX-License-Identifier: Apache-2.0
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def embree_deps():
    maybe(
        git_repository,
        name = "oneTBB",
        commit = "6bfd29bde7e9c47bdfc3ae8a1670ea961c95c78c",
        shallow_since = "1664967433 +0200",
        remote = "https://github.com/oneapi-src/oneTBB",
    )

    maybe(
        http_archive,
        name = "embree",
        build_file = "@de_vertexwahn_rules_embree//:BUILD.embree",
        strip_prefix = "embree-3.13.5",
        patches = ["@de_vertexwahn_rules_embree//:0001-fix-includes.patch"],
        urls = [
            "https://github.com/embree/embree/archive/refs/tags/v3.13.5.tar.gz",
        ],
        sha256 = "b8c22d275d9128741265537c559d0ea73074adbf2f2b66b0a766ca52c52d665b",
    )
