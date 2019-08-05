project('mkxp-z', 'cpp', version: '1.0')

xxd = find_program('xxd', native: true)
host_system = host_machine.system()
compiler = meson.get_compiler('cpp')

if get_option('workdir_current') == true
    add_project_arguments('-DWORKDIR_CURRENT', language: 'cpp')
endif

subdir('src')
subdir('binding')
subdir('shader')
subdir('assets')

all_sources = [main, bindings, processed_shaders, processed_assets]
include_dirs = [include_directories('src', 'binding')]

linker_args = []

if host_system == 'windows'
    subdir('windows')
    all_sources += windows_resources
    include_dirs += include_directories('windows')
elif host_system == 'darwin'
    if compiler.get_id() == 'clang'
        add_project_arguments(['-std=c++11','-stdlib=libc++'], language: 'cpp')
    endif
endif

executable(meson.project_name(),
    sources: all_sources,
    dependencies: [main_dependencies, binding_dependencies],
    include_directories: include_dirs
)