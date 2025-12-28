set(CPPUTEST_DIR "${CMAKE_CURRENT_LIST_DIR}/cpputest")

file(GLOB CPPUTEST_CORE "${CPPUTEST_DIR}/src/CppUTest/*.cpp")
file(GLOB CPPUTEST_EXT "${CPPUTEST_DIR}/src/CppUTestExt/*.cpp")

idf_component_register(
    SRCS ${CPPUTEST_CORE} ${CPPUTEST_EXT}
    INCLUDE_DIRS "${CPPUTEST_DIR}/include")