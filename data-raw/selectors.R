# google text ----
google_text = list(
    results = c("div.g > div","xml"),
    title   = c("div.yuRUbf > a > h3","text"),
    link    = c("div.yuRUbf > a","link"),
    text    = c("div.VwiC3b","text"),
    image   = c("div.Z26q7c img","src"),
    page    = c("td.YyVfkd","text")
)

# google news ----
google_news = list(
    results   = c("div.SoaBEf","text"),
    title     = c("div.mCBkyc","text"),
    link      = c("a","link"),
    text      = c("div.CEMjEf","text"),
    image     = c("div.FAkayc img","src"),
    published = c("div.OSrXXb.ZE0LJd.YsWzw","text"),
    page      = c("td.YyVfkd","text")
)

# google images ----
google_images = list(
    results   = c("div.isv-r.PNCib.MSM1fd.BUooTd","text"),
    title     = c("h3","text"),
    link      = c("a.VFACy","link"),
    text      = c("div.dmeZbb","text"),
    image     = c("div.bRMDJf > img","src")
)

selectors <- list(
    "google text" = google_text,
    "google news" = google_news,
    "google images" = google_images
)



usethis::use_data(selectors, internal = TRUE,overwrite = TRUE)

