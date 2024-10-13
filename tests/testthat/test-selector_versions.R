test_that(".is_webbot_selectors", {
    expect_true(.is_webbot_selectors(selectors_library$get("ver1")))
    expect_false(.is_webbot_selectors(list(a = c(1, 2, 3))))
})

test_that(".get_selectors", {
    expect_error(.get_selectors("wat"))
    expect_error(.get_selectors("ver1"), NA)
    expect_error(.get_selectors("latest"), NA)
    expect_error(.get_selectors(selectors_library$get("ver1")), NA)
})

test_that(".get_selectors really working with NULL", {
    res <- .get_selectors("ver1")
    expect_equal(res, selectors_library$get("ver1"))
    res <- .get_selectors(selectors_library$get("ver1"))
    expect_equal(res, selectors_library$get("ver1"))
})

test_that(".get_selectors really working not NULL", {
    fake_library <- fastmap::fastmap()
    fake_library$set("ver1", selectors_library$get("ver1"))
    fake_selectors_v2 <- selectors_library$get("ver1")
    fake_selectors_v2$`google images` <- "x"
    fake_library$set("ver2", fake_selectors_v2)
    fake_versions <- data.frame(
        version = c("ver1", "ver2"),
        snapshot_date = c(as.Date("2023-03-17"), as.Date("2047-07-01"))
    )
    res <- .get_selectors("ver1", lib = fake_library, vers = fake_versions)
    expect_equal(res, fake_library$get("ver1"))
    expect_equal(class(res$`google images`), "list")
    res <- .get_selectors("ver2", lib = fake_library, vers = fake_versions)
    expect_equal(res, fake_library$get("ver2"))
    expect_equal(res$`google images`, "x")
    expect_equal(class(res$`google images`), "character")
    res <- .get_selectors("latest", lib = fake_library, vers = fake_versions)
    expect_equal(res, fake_library$get("ver2"))
    expect_equal(res$`google images`, "x")
    expect_equal(class(res$`google images`), "character")
})

test_that("integration", {
    res1 <- parse_search_results("../testdata/www.google.com_query_text_2023-03-16_08_16_05.html", "google text", "ver1")
    res2 <- parse_search_results("../testdata/www.google.com_query_text_2023-03-16_08_16_05.html", "google text", "ver1")
    res3 <- parse_search_results("../testdata/www.google.com_query_text_2023-03-16_08_16_05.html", "google text", selectors_library$get("ver1"))
    expect_equal(res1, res2)
    expect_equal(res2, res3)
    expect_equal(res1, res3)
})
