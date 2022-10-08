<!--
SPDX-FileCopyrightText: 2022 Julian Amann <dev@vertexwahn.de>
SPDX-License-Identifier: Apache-2.0
-->

[![Support Ukraine](https://img.shields.io/badge/Support-Ukraine-FFD500?style=flat&labelColor=005BBB)](https://opensource.fb.com/support-ukraine)

# rules_embree -- Bazel build rules for Intel Embree

[Intel Embree](https://www.embree.org/) is a ray tracing kernel.
This Bazel rules enable you to use Intel Embree within your Bazel project.

To use these rules, add the following to your `WORKSPACE.bazel` file:

```bazel
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

_RULES_EMBREE_COMMIT = "652b21e35e4eeed5579e696da0facbe8dba52b1f"

http_archive(
    name = "com_github_nelhage_rules_boost",
    #sha256 = "c1b8b2adc3b4201683cf94dda7eef3fc0f4f4c0ea5caa3ed3feffe07e1fb5b15",
    strip_prefix = "rules_embree-%s" % _RULES_BOOST_COMMIT,
    urls = [
        "https://github.com/Vertexwahn/rules_embree/archive/%s.tar.gz" % _RULES_BOOST_COMMIT,
    ],
)

load("@de_vertexwahn_rules_embree//:embree/embree.bzl", "embree_deps")
embree_deps()
```

## License

This work is published under Apache 2.0 License.
