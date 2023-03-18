test_that("google text latest selector", {
  expect_no_error(output <- parse_search_results("../testdata/www.google.com_query_news_2023-03-16_08_15_05.html",engine = "google text"))
  expect_s3_class(output,"tbl_df")
})

test_that("google news latest selector", {
    expect_no_error(output <- parse_search_results("../testdata/www.google.com_query_news_2023-03-16_08_15_05.html",engine = "google news"))
    expect_s3_class(output,"tbl_df")
})

test_that("ddg text latest selector", {
    expect_no_error(output <- parse_search_results("../testdata/duckduckgo.com_query_text_2023-03-16_09_17_19.html",engine = "duckduckgo text"))
    expect_s3_class(output,"tbl_df")
})

test_that("ddg news latest selector", {
    expect_no_error(output <- parse_search_results("../testdata/duckduckgo.com_query_news_2023-03-16_09_15_05.html",engine = "duckduckgo text"))
    expect_s3_class(output,"tbl_df")
})

test_that("metadata reading",{
    expect_no_error(meta <- parse_metadata(".../testdata/www.google.com_query_text_2023-03-16_08_16_11.html"))
    expect_equal(meta$search_engine,"www.google.com")
    expect_equal(meta$type,"text")
    expect_equal(meta$query,"query")
    expect_equal(as.Date(meta$date),as.Date("2023-03-16"))
})

test_that("folder parsing",{
    expect_no_error(output <- parse_search_results("../testdata", engine = "google text"))
    expect_error(parse_search_results("../testdata/", engine = "google images"))
    expect_error(parse_search_results("void", engine = "google text"))
})
