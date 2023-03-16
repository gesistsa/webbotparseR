#' Parse search engine results
#'
#' @param x, either a path to a file that contains search results, a path to a directory containing search engine result files, or a xml_document containing search engine results
#' @param engine character.
#' @param ..., not used
#' @return a tibble of parsed search engine results
#' @export
parse_search_results <- function(x,engine, ...) {
    UseMethod("parse_search_results", object = x,engine)
}

#' @rdname parse_search_results
#' @export
parse_search_results.character <- function(x,engine){
    if(file.exists(x)){
        doc <- rvest::read_html(x)
        .parse_search_results(doc,engine)
    } else if(dir.exists(x)){

    }

}

#' @rdname parse_search_results
#' @export
parse_search_results.xml_document <- function(doc,engine){
    .parse_search_page(doc,engine)
}

.parse_search_page <- function(doc,engine){
    engine <- match.arg(engine,names(selectors))
    selector <- selectors[["engine"]]
    results_selector <- selector[["results"]][1]
    if(is.null(results_selector)){
        stop("no search result selector found.")
    }
    selector[["results"]] <- NULL
    output <- vector("list",length = (length(selector)))
    names(output) <- names(selector)
    results <- rvest::html_nodes(doc, results_selector)
    for(i in seq_along(selector)){
        output[[i]] <- .parse_elements(rvest::html_nodes(results,selector[[i]][[1]]),selector[[i]][[2]])
    }
    output
}

.parse_elements <- function(elem,type="text"){
    switch (type,
        "text" = rvest::html_text(elem),
        "link" = rvest::html_attr(elem,"href")
    )
}
