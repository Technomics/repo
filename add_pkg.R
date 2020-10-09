
pkg <-"readflexfile_0.2.0"

compile_loc <- file.path(setupr::get_dirs()$git_local, "costverse")

drat::insertPackage(paste0(compile_loc, "/", pkg, ".zip"), "docs")
drat::insertPackage(paste0(compile_loc, "/", pkg, ".tar.gz"), "docs")
drat::archivePackages("docs")


