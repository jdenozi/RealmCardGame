# Function to generate Sphinx documentation if Sphinx is found
function(generate_sphinx_docs TARGET_NAME)
    find_package(Sphinx QUIET)

    if (Sphinx_FOUND)
        set(SPHINX_SOURCE "${CMAKE_CURRENT_SOURCE_DIR}/docs")
        set(SPHINX_BUILD "${CMAKE_CURRENT_BINARY_DIR}/docs")

        add_custom_target(
                ${TARGET_NAME}_sphinx_docs
                COMMAND
                ${SPHINX_EXECUTABLE} -b html
                ${SPHINX_SOURCE} ${SPHINX_BUILD}
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                COMMENT "Generating Sphinx documentation for ${TARGET_NAME}"
        )
    else()
        message("-- [WARNING] Sphinx not found. Sphinx documentation will not be generated.")
    endif()
endfunction()