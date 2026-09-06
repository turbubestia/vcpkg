# 1. Fetch source code from GitHub
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO turbubestia/fzy-match
    REF 8b51c89f35358b408dd064a4cd8734788233ba3a
    HEAD_REF main
)

vcpkg_apply_patch(
    SOURCE_PATH "${SOURCE_PATH}"
    PATCH_FILES fix-gtest-optional.patch
)

# 2. Configure CMake build
vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

# 3. Build and install into vcpkg sandbox
vcpkg_cmake_install()

# 4. Fix up target exports and CMake config locations
vcpkg_cmake_config_fixup(PACKAGE_NAME fzy_match)

# 5. Copy license file to share/fzy-match/copyright
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")