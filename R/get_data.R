#' Build a Medicare dataset resource request URL
#'
#' @param dataset_id Socrata dataset identifier
#' @return Full API URL for dataset request
build_url <- function(dataset_id) {
  url_stem <- "https://data.medicare.gov/resource/"
  paste0(url_stem, dataset_id)
}

#' Retrieve Medicare dataset
#'
#' @param dataset_id Socrata dataset identifier
#' @param app_token Optional Socrata application token
#' @return R data frame with dataset
get_data <- function(dataset_id, app_token = NULL) {
  if (!is.null(app_token)) {
    RSocrata::read.socrata(build_url(dataset_id), app_token)
  } else {
    RSocrata::read.socrata(build_url(dataset_id))
  }
}

#' Set the user's Socrata API token
#'
#' @param api_key character string represnting the user's Socrata app token.
#'
#' @examples
#' \dontrun{set_api_key("yourkey")}
set_api_key <- function(api_key) {
  Sys.setenv(SOCRATA_API_TOKEN = api_key)
}
