cmake_minimum_required(VERSION 3.15.1)

project(PromiseKit LANGUAGES Swift)

option(BUILD_SHARED_LIBS "build shared libraries" ON)

find_package(dispatch CONFIG REQUIRED)
find_package(Foundation CONFIG REQUIRED)

file(GLOB_RECURSE SOURCES Sources/PromiseKit/*.swift)

add_library(PromiseKit
	${SOURCES}
)

target_link_libraries(PromiseKit PUBLIC
	dispatch
	Foundation
)

set_target_properties(PromiseKit PROPERTIES
  INSTALL_RPATH "$ORIGIN"
  Swift_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/swift
  INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_BINARY_DIR}/swift
)

export( TARGETS PromiseKit
  FILE PromiseKitConfig.cmake
)