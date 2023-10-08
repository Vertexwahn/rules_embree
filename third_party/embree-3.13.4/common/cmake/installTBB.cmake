## Copyright 2009-2021 Intel Corporation
## SPDX-License-Identifier: Apache-2.0

IF (EMBREE_STATIC_LIB)
  INSTALL(TARGETS TBB EXPORT TBB-targets)
  INSTALL(EXPORT TBB-targets DESTINATION "${EMBREE_CMAKEEXPORT_DIR}" COMPONENT devel)
ENDIF()

IF (EMBREE_INSTALL_DEPENDENCIES)
  IF (TARGET TBB::${EMBREE_TBB_COMPONENT})
    GET_TARGET_PROPERTY(LIB_PATH TBB::${EMBREE_TBB_COMPONENT} IMPORTED_LOCATION_RELEASE)
    IF(WIN32)
      INSTALL(FILES "${LIB_PATH}" DESTINATION "${CMAKE_INSTALL_BINDIR}" COMPONENT examples)
      GET_TARGET_PROPERTY(IMPLIB_PATH TBB::${EMBREE_TBB_COMPONENT} IMPORTED_IMPLIB_RELEASE)
      INSTALL(FILES "${IMPLIB_PATH}" DESTINATION "${CMAKE_INSTALL_LIBDIR}" COMPONENT lib)
    ELSE()
      GET_FILENAME_COMPONENT(LIB_DIR "${LIB_PATH}" DIRECTORY)
      FILE(GLOB LIB_FILES ${LIB_DIR}/libtbb.*)
      INSTALL(FILES ${LIB_FILES} DESTINATION "${CMAKE_INSTALL_LIBDIR}" COMPONENT lib)
    ENDIF()
  ELSE()
    MESSAGE(SEND_ERROR "Target TBB::${EMBREE_TBB_COMPONENT} not found during install.")
  ENDIF()
ENDIF()