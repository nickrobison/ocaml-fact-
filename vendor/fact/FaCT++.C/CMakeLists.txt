set(SOURCE_FILES
	fact.cpp
	fact.h
)

add_library(fact STATIC ${SOURCE_FILES})
target_link_libraries(fact PUBLIC Kernel)

add_executable(fact_test test.c)
target_link_libraries(fact_test PUBLIC Kernel fact)

# allow library users to find headers
target_include_directories(fact PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# Build a dynamic library as well
add_library(factShared SHARED ${SOURCE_FILES})
target_link_libraries(factShared PUBLIC Kernel)
set_target_properties(factShared PROPERTIES OUTPUT_NAME fact)
set_target_properties(factShared PROPERTIES SUFFIX .so)

set_target_properties(factShared PROPERTIES LINK_FLAGS "-Wl,-rpath,./")
