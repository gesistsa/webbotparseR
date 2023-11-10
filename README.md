
<!-- README.md is generated from README.Rmd. Please edit that file -->

# webbotparseR <img src="man/figures/logo.png" align="right" height="139" />

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/schochastics/webbotparseR/branch/main/graph/badge.svg)](https://app.codecov.io/gh/gesistsa/webbotparseR?branch=main)
[![R-CMD-check](https://github.com/schochastics/webbotparseR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/gesistsa/webbotparseR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

webbotparseR allows to parse search engine results that where scraped
with the [WebBot](https://github.com/gesiscss/WebBot) browser extension.
A similar python library is [also
available](https://github.com/gesiscss/WebBot-tutorials).

## Installation

You can install the development version of webbotparseR like so:

``` r
remotes::install_github("schochastics/webbotparseR")
```

The package contains an example html from a google search on climate
change.

``` r
library(webbotparseR)
ex_file <- system.file("www.google.com_climatechange_text_2023-03-16_08_16_11.html", package = "webbotparseR")
```

Such search results can be parsed via the function
`parse_search_results()`. The parameter `engine` is used to specify the
search engine and the search type.

``` r
output <- parse_search_results(path = ex_file, engine = "google text")
output
#> # A tibble: 10 × 10
#>    title              link  text  image page  position search_engine type  query
#>    <chr>              <chr> <chr> <chr> <chr>    <int> <chr>         <chr> <chr>
#>  1 What Is Climate C… http… Clim… data… 1            1 www.google.c… text  clim…
#>  2 Home – Climate Ch… http… Vita… data… 1            2 www.google.c… text  clim…
#>  3 Vital Signs of th… http… “Cli… data… 1            3 www.google.c… text  clim…
#>  4 Climate change - … http… In c… data… 1            4 www.google.c… text  clim…
#>  5 IPCC — Intergover… http… The … data… 1            5 www.google.c… text  clim…
#>  6 Climate Change | … http… Comp… data… 1            6 www.google.c… text  clim…
#>  7 Climate change: e… http… Clim… <NA>  1            7 www.google.c… text  clim…
#>  8 UNFCCC             http… What… data… 1            8 www.google.c… text  clim…
#>  9 Climate Change - … http… Clim… data… 1            9 www.google.c… text  clim…
#> 10 Causes of climate… http… This… data… 1           10 www.google.c… text  clim…
#> # ℹ 1 more variable: date <dttm>
```

Note that images are always returned base64 encoded.

``` r
output$image[1]
#> [1] "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAAABnRSTlMAAAAAAABupgeRAAAAMklEQVR4AWMAgYYG4hEdNJAHGoCIABvBJayhgcYaIAwaakCwydUA52MKYeeSCgZh4gMAXrJ9ASggqqAAAAAASUVORK5CYII="
```

The function `base64_to_img()` can be used to decode the image and save
it in an appropriate format.
