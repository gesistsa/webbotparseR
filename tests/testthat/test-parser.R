test_that("google text latest selector", {
  expect_no_error(output <- parse_search_results("../testdata/google_text.html",engine = "google text"))
  expect_s3_class(output,"tbl_df")
})

test_that("google news latest selector", {
    expect_no_error(output <- parse_search_results("../testdata/google_news.html",engine = "google news"))
    expect_s3_class(output,"tbl_df")
})

test_that("ddg text latest selector", {
    expect_no_error(output <- parse_search_results("../testdata/ddg_text.html",engine = "duckduckgo text"))
    expect_s3_class(output,"tbl_df")
})

test_that("ddg news latest selector", {
    expect_no_error(output <- parse_search_results("../testdata/ddg_news.html",engine = "duckduckgo text"))
    expect_s3_class(output,"tbl_df")
})

test_that("metadata reading",{
    expect_no_error(meta <- parse_metadata(".../testdata/www.google.com_query_text_2023-03-16_08_16_11.html"))
    expect_equal(meta$search_engine,"www.google.com")
    expect_equal(meta$type,"text")
    expect_equal(meta$query,"query")
    expect_equal(as.Date(meta$date),as.Date("2023-03-16"))
})
