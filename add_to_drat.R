
#' Add to costverse drat repo
#' 
#' \code{add_to_drat()} Will add a given package_version to the costverse GitHub drat
#' \code{repo}sitory. This requires SSH connection to GitHub, and uses \code{git2r}.
#'
#' @param pkg_files character vector of files to add.
#'
#' @return List of files committed
#' @export
#'
add_to_drat <- function(pkg_files, drat_repo) {

  # Pull drat repo
  git2r::pull(drat_repo, credentials = git2r::cred_ssh_key())
  
  # Insert all the versions
  invisible(lapply(pkg_files, drat::insertPackage, repodir = file.path(drat_repo, "docs")))
  
  # Cleanup
  drat::archivePackages(file.path(drat_repo, "docs"))
  
  # Stage all
  git2r::add(drat_repo, path = paste0(drat_repo, "/*"))
  
  # Store the status
  git_status <- git2r::status(drat_repo)
  
  # Commit
  commit_msg <- paste0("Added packages to drat\n\n",
                       paste(paste(" -", basename(pkg_files)), collapse = "\n"))
  
  git2r::commit(drat_repo, message = commit_msg)
  
  # Push
  git2r::push(drat_loc, credentials = git2r::cred_ssh_key())
  
}
