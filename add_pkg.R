
# Enter the name of the package you want to add to the repository
pkg <-"readflexfile_0.2.0"

# Find the package files
compile_loc <- file.path(setupr::get_dirs()$git_local, "costverse", "_builds")
pkg_files <- list.files(compile_loc, recursive = TRUE, full.names = TRUE, pattern = pkg)

# Insert all the versions
drat_loc <- file.path(setupr::get_dirs()$git_local, "costverse", "repo")
invisible(lapply(pkg_files, drat::insertPackage, repodir = file.path(drat_loc, "docs")))

# Cleanup
drat::archivePackages("docs")
