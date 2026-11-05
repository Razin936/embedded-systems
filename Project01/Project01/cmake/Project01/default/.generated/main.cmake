include("${CMAKE_CURRENT_LIST_DIR}/rule.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/file.cmake")

set(Project01_default_library_list )

set(OUTPUT_SUFFIX elf)
# Handle files with suffix (s|as|asm|AS|ASM|As|aS|Asm), for group default-XC8
if(Project01_default_default_XC8_FILE_TYPE_assemble)
add_library(Project01_default_default_XC8_assemble OBJECT ${Project01_default_default_XC8_FILE_TYPE_assemble})
    Project01_default_default_XC8_assemble_rule(Project01_default_default_XC8_assemble)
    list(APPEND Project01_default_library_list "$<TARGET_OBJECTS:Project01_default_default_XC8_assemble>")

endif()

# Handle files with suffix S, for group default-XC8
if(Project01_default_default_XC8_FILE_TYPE_assemblePreprocess)
add_library(Project01_default_default_XC8_assemblePreprocess OBJECT ${Project01_default_default_XC8_FILE_TYPE_assemblePreprocess})
    Project01_default_default_XC8_assemblePreprocess_rule(Project01_default_default_XC8_assemblePreprocess)
    list(APPEND Project01_default_library_list "$<TARGET_OBJECTS:Project01_default_default_XC8_assemblePreprocess>")

endif()

# Handle files with suffix [cC], for group default-XC8
if(Project01_default_default_XC8_FILE_TYPE_compile)
add_library(Project01_default_default_XC8_compile OBJECT ${Project01_default_default_XC8_FILE_TYPE_compile})
    Project01_default_default_XC8_compile_rule(Project01_default_default_XC8_compile)
    list(APPEND Project01_default_library_list "$<TARGET_OBJECTS:Project01_default_default_XC8_compile>")

endif()

# Handle files with suffix elf, for group default-XC8
if(Project01_default_default_XC8_FILE_TYPE_objcopy_avr)
add_library(Project01_default_default_XC8_objcopy_avr OBJECT ${Project01_default_default_XC8_FILE_TYPE_objcopy_avr})
    Project01_default_default_XC8_objcopy_avr_rule(Project01_default_default_XC8_objcopy_avr)
    list(APPEND Project01_default_library_list "$<TARGET_OBJECTS:Project01_default_default_XC8_objcopy_avr>")

endif()


# Main target for this project
add_executable(Project01_default_image_kOreEjNX ${Project01_default_library_list})

set_target_properties(Project01_default_image_kOreEjNX PROPERTIES
    OUTPUT_NAME "default"
    SUFFIX ".elf"
    ADDITIONAL_CLEAN_FILES "${output_extensions}"
    RUNTIME_OUTPUT_DIRECTORY "${Project01_default_output_dir}")
target_link_libraries(Project01_default_image_kOreEjNX PRIVATE ${Project01_default_default_XC8_FILE_TYPE_link})
# Add the link options from the rule file.
Project01_default_link_rule( Project01_default_image_kOreEjNX)


#Add objcopy steps
Project01_default_objcopy_avr_rule(Project01_default_image_kOreEjNX)

