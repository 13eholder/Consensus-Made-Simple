set(DEFAULT_COMPILE_OPTIONS -Wall -Wextra -Werror -Wpedantic)

macro(target_add_lib LIB_NAME)
    file(GLOB_RECURSE LIB_SOURCES CONFIGURE_DEPENDS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} ".h" ".cc")
    add_library(${LIB_NAME} STATIC ${LIB_SOURCES})
    target_include_directories(${LIB_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/src)
    target_link_libraries(${LIB_NAME} PUBLIC ${ARGN} " ")
    target_compile_options(${LIB_NAME} PRIVATE ${DEFAULT_COMPILE_OPTIONS})
endmacro()


macro(target_add_bin BIN_NAME MAIN_FILE)
    add_executable(${BIN_NAME} ${MAIN_FILE})
    target_include_directories(${BIN_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/src)
    target_link_libraries(${BIN_NAME} PUBLIC ${ARGN})
    set_target_properties(${BIN_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
endmacro()