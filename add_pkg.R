
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

# Pull drat repo
git2r::pull(drat_loc)

# Stage all
git2r::add(drat_loc, path = paste0(drat_loc, "/*"))

# Store the status
git_status <- git2r::status(drat_loc)

# Commit
git2r::commit(drat_loc, message = paste("Added", pkg, "to drat"))

# Push
git2r::push(drat_loc)

add_to_drat <- function(pkg) {
  
  # Find the package files
  compile_loc <- file.path(setupr::get_dirs()$git_local, "costverse", "_builds")
  pkg_files <- list.files(compile_loc, recursive = TRUE, full.names = TRUE, pattern = pkg)
  
  # Pull drat repo
  git2r::pull(drat_loc)
  
  # Insert all the versions
  drat_loc <- file.path(setupr::get_dirs()$git_local, "costverse", "repo")
  invisible(lapply(pkg_files, drat::insertPackage, repodir = file.path(drat_loc, "docs")))
  
  # Cleanup
  drat::archivePackages("docs")
  
  # Stage all
  git2r::add(drat_loc, path = paste0(drat_loc, "/*"))
  
  # Store the status
  git_status <- git2r::status(drat_loc)
  
  # Commit
  git2r::commit(drat_loc, message = paste("Added", pkg, "to drat"))
  
  # Push
  git2r::push(drat_loc)
  
  git_status
}
