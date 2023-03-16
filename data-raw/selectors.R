# google text ----
google_text = list(
    results = c("div.g > div","xml"),
    title   = c("div.yuRUbf > a > h3","text"),
    link    = c("div.yuRUbf > a","link"),
    text    = c("div.VwiC3b","text"),
    image   = c("div.Z26q7c img","text")
)

# google news ----
google_news = list(
    results   = c("div.SoaBEf","text"),
    title     = c("div.mCBkyc","text"),
    link      = c("a","link"),
    text      = c("div.CEMjEf","text"),
    image     = c("div.FAkayc img","text"),
    published = c("div.OSrXXb","text")
)

selectors <- list(
    "google text" = google_text,
    "google news" = google_news
)

usethis::use_data(selectors, internal = TRUE,overwrite = TRUE)

