#' Parse search engine results
#'
#' @param path character. either a path to a file that contains search results or a path to a directory containing search engine result files
#' @param engine character.
#' @return a tibble of parsed search engine results
#' @export
parse_search_results <- function(path,engine) {
    if(file.exists(path)){
        engine <- match.arg(engine,names(selectors))
        doc <- rvest::read_html(path)
        metadata <- parse_metadata(path)
        output <- .parse_search_page(doc,engine)
        output <- tibble::add_column(output,metadata)

    } else if(dir.exists(path)){
        files <- list.files(path,full.names = TRUE,pattern = "html")
        metadata_list <- lapply(files,parse_metadata)
    }
    output
}

.parse_search_page <- function(doc,engine){
    selector <- selectors[[engine]]
    results_selector <- selector[["results"]][1]
    if(is.null(results_selector)){
        stop("no search result selector found.")
    }
    if("page"%in%names(selector)){
        page_selector <- selector[["page"]][1]
        selector[["page"]] <- NULL
        page <- .parse_elements(rvest::html_elements(doc,page_selector),"text")
    } else{
        page <- NA
    }
    selector[["results"]] <- NULL
    output <- vector("list",length = (length(selector)))
    names(output) <- names(selector)
    results <- rvest::html_elements(doc, results_selector)
    for(i in seq_along(selector)){
        nodes <- sapply(results,.html_elements_na,css=selector[[i]][1])
        output[[i]] <- sapply(nodes,.parse_elements,type = selector[[i]][2])
    }
    output[["page"]] <- page
    output[["position"]] <- seq_along(output[[1]])
    tibble::as_tibble(output)
}

.parse_elements <- function(elem,type="text"){
    if(is.na(elem)){
        return(NA)
    }
    switch (type,
        "text" = rvest::html_text(elem),
        "link" = rvest::html_attr(elem,"href"),
        "src"  = rvest::html_attr(elem,"src"),
    )
}

.html_elements_na <- function(x,css){
    res <- rvest::html_elements(x,css)
    if(length(res)!=0){
        return(res)
    } else{
        return(NA)
    }
}

#' Parse metadata from search engine results
#'
#' @param path character. a path to a file that contains search results
#' @return a tibble of parsed search engine results
#' @export
parse_metadata <- function(path){
    file <- .remove_file_extension(basename(path))
    split_file <- strsplit(file,"_")[[1]]
    search_engine <- split_file[1]
    query <- split_file[2]
    type <- split_file[3]
    date <- as.POSIXct(paste(split_file[4:7],collapse = " "),format="%Y-%m-%d %H %M %OS")
    tibble::tibble(search_engine,type,query,date)
}

.remove_file_extension <- function(file){
    sub(pattern = "(.*)\\..*$", replacement = "\\1", file)
}
