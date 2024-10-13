#' Image data uri to file
#'
#' Convert a data uri to an image in the correct format and save it to a file.
#'
#' @param data_uri charachter, base64 image string as returned by [parse_search_results]
#' @param slug character, name of file to export image to. WITHOUT extension
#'
#' @return nothing, called for side effects
#' @export
#' @examples
#' \dontrun{
#' data_uri <- paste0(
#'     "data:image/png;base64,",
#'     base64enc::base64encode(system.file("logo.png", package = "webbotparseR"))
#' )
#' base64_to_img(data_uri, "logo")
#' }
base64_to_img <- function(data_uri, slug) {
    img_type <- sub("data:image/([a-zA-Z]+);base64,.*", "\\1", data_uri)
    img64 <- sub("data:image/[a-zA-Z]+;base64,", "", data_uri)
    img_file <- paste0(slug, ".", img_type)
    conn <- file(img_file, "wb")
    base64enc::base64decode(what = img64, output = conn)
    close(conn)
    invisible(img64)
}
