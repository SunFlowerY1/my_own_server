"""Provides a macro to import all TensorFlow Serving dependencies.

Some of the external dependencies need to be initialized. To do this, duplicate
the initialization code from TensorFlow Serving's WORKSPACE file.
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def tf_serving_workspace():
    """All TensorFlow Serving external dependencies."""

    # ===== Bazel package rules dependency =====
    http_archive(
        name = "rules_pkg",
        sha256 = "352c090cc3d3f9a6b4e676cf42a6047c16824959b438895a76c2989c6d7c246a",
        url = "https://github.com/bazelbuild/rules_pkg/releases/download/0.2.5/rules_pkg-0.2.5.tar.gz",
    )

    # ===== RapidJSON (rapidjson.org) dependency =====
    http_archive(
        name = "com_github_tencent_rapidjson",
        url = "https://github.com/Tencent/rapidjson/archive/v1.1.0.zip",
        sha256 = "8e00c38829d6785a2dfb951bb87c6974fa07dfe488aa5b25deec4b8bc0f6a3ab",
        strip_prefix = "rapidjson-1.1.0",
        build_file = "@//third_party/rapidjson:BUILD",
    )
