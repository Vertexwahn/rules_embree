<!--
SPDX-FileCopyrightText: 2022 Julian Amann <dev@vertexwahn.de>
SPDX-License-Identifier: Apache-2.0
-->

[![Support Ukraine](https://img.shields.io/badge/Support-Ukraine-FFD500?style=flat&labelColor=005BBB)](https://opensource.fb.com/support-ukraine)
![BazelBuild](https://github.com/Vertexwahn/rules_embree/actions/workflows/bazel_build.yml/badge.svg)

# rules_embree -- Bazel build rules for Intel Embree

[Intel Embree](https://www.embree.org/) is a ray tracing kernel.

## Bzlmod support

If you are using Bzlmod you can fetch Embree 4.3.0 using [the Bazel Central Registry](https://registry.bazel.build/).

Add to your `MODULE.bazel` file:


```bazel
bazel_dep(name = "embree", version = "4.3.0")
```

The underlying source code that makes this work is not part of this repository, but part of
the [bazelbuild/bazel-central-registry](https://github.com/bazelbuild/bazel-central-registry/tree/main/modules/embree/4.3.0).

## Using a WORKSPACE file

These Bazel rules enable you to use Intel Embree within your Bazel project using a `WORKSPACE` file.

To use these rules, add the following to your `WORKSPACE.bazel` file:

```bazel
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

_RULES_EMBREE_COMMIT = "4ec4392626fe18d8f1272a795d0df4fefbd17006"

http_archive(
    name = "de_vertexwahn_rules_embree",
    #sha256 = <REPLACE_WITH_SHA256>,
    strip_prefix = "rules_embree-%s" % _RULES_EMBREE_COMMIT,
    urls = [
        "https://github.com/Vertexwahn/rules_embree/archive/%s.tar.gz" % _RULES_EMBREE_COMMIT,
    ],
)

load("@de_vertexwahn_rules_embree//:embree/embree.bzl", "embree_deps")
embree_deps()
```

### How to test?

```shell
git clone https://github.com/Vertexwahn/rules_embree.git
cd rules_embree
cd test
bazel build --config=gcc11 //... # See test/.bazelrc for other supported configs
```

## Bazelization of Embree

If you are interested in how to bazelize the [Embree repository](https://github.com/embree/embree/) itself you can find all my attempts in the `third_party` folder.
I have bazelized the Embree repository at different states:

- Embree 3.12.1
- Embree 3.13.0
- Embree 3.13.4
- Embree 3.13.5
- Embree 4.3.0

## Further references

I have written two blog posts about bazelizing Embree:

- [Bazel: Bazelizing Embree 3.13.0](https://vertexwahn.de/2021/07/30/bazelizingembre3.13.0/)
- [Bazel: Bazelizing Embree 3.12.1](https://vertexwahn.de/2021/01/12/bazelizingembree3.12.1/)


## License

This work is published under the Apache 2.0 License.
