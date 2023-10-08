## Copyright 2009-2020 Intel Corporation
## SPDX-License-Identifier: Apache-2.0

# optionally use static runtime library
OPTION(EMBREE_STATIC_RUNTIME "Use the static version of the C/C++ runtime library." OFF)
IF (EMBREE_STATIC_RUNTIME)
  STRING(REPLACE "/MDd" "/MTd" CMAKE_CXX_FLAGS_DEBUG ${CMAKE_CXX_FLAGS_DEBUG})
  STRING(REPLACE "/MD" "/MT" CMAKE_CXX_FLAGS_RELWITHDEBINFO ${CMAKE_CXX_FLAGS_RELWITHDEBINFO})
  STRING(REPLACE "/MD" "/MT" CMAKE_CXX_FLAGS_RELEASE ${CMAKE_CXX_FLAGS_RELEASE})
ENDIF()

# remove define NDEBUG and instead set define DEBUG for config RelWithDebInfo
STRING(REPLACE "NDEBUG" "DEBUG" CMAKE_CXX_FLAGS_RELWITHDEBINFO ${CMAKE_CXX_FLAGS_RELWITHDEBINFO})