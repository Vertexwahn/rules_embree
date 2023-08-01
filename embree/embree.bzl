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
        commit = "45a99b4218b9feea441b8f1c683ef08379742180",
        #shallow_since = "1671635968 +0100",
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

    maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 = "66ffd9315665bfaafc96b52278f57c7e2dd09f5ede279ea6d39b2be471e7e3aa",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.4.2/bazel-skylib-1.4.2.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.2/bazel-skylib-1.4.2.tar.gz",
        ],
    )
