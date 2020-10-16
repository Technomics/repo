
# Enter the name of the package you want to add to the repository
pkg <-"costmisc_0.6.0"

# Location of the compiled file
compile_loc <- file.path(setupr::get_dirs()$git_local, "costverse", "_builds")

# Insert the binary
drat::insertPackage(paste0(compile_loc, "/bin", "3.6", pkg, ".zip"), "docs")
drat::insertPackage(paste0(compile_loc, "/bin", "4.0", pkg, ".zip"), "docs")

# Insert the source
drat::insertPackage(paste0(compile_loc, "/src", pkg, ".tar.gz"), "docs")

# Cleanup
drat::archivePackages("docs")
