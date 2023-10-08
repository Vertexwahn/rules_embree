# Copyright 2021 Intel Corporation
# SPDX-License-Identifier: Apache-2.0

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def embree_deps():
    """Fetches third party depencendies of Embree"""

    maybe(
        git_repository,
        name = "oneTBB",
        #branch = "bazel-support",
        commit = "783bb7a882f83629fcfb2bee27ab164576e0445a",
        remote = "https://github.com/Vertexwahn/oneTBB",
        shallow_since = "1623602602 +0200",
    )
