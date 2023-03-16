.parse_search_results <- function(doc,selector){
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
