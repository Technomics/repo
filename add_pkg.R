
# Enter the name of the package you want to add to the repository
pkg <-"costmisc_0.6.0"

# Location of the compiled file
compile_loc <- file.path(setupr::get_dirs()$git_local, "costverse")

# Insert the binary
drat::insertPackage(paste0(compile_loc, "/", pkg, ".zip"), "docs")

# Insert the source
drat::insertPackage(paste0(compile_loc, "/", pkg, ".tar.gz"), "docs")

# Cleanup
drat::archivePackages("docs")
