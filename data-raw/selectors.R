## version 1
## google text ----
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
    results   = c("div.SoaBEf","xml"),
    title     = c("div.mCBkyc","text"),
    link      = c("a","link"),
    text      = c("div.CEMjEf","text"),
    image     = c("div.FAkayc img","src"),
    published = c("div.OSrXXb.ZE0LJd.YsWzw","text"),
    page      = c("td.YyVfkd","text")
)

# google images ----
google_images = list(
    results   = c("div.isv-r.PNCib.MSM1fd.BUooTd","xml"),
    title     = c("h3","text"),
    link      = c("a.VFACy","link"),
    text      = c("div.dmeZbb","text"),
    image     = c("div.bRMDJf > img","src")
)

## duckduckgo text ----
duckduckgo_text = list(
    results   = c("article[id|='r1']","xml"),
    title     = c("h2","text"),
    link      = c("h2 > a","link"),
    text      = c("div:nth-child(3) span:last-child","text")
)

## duckduckgo images ----
duckduckgo_images = list(
    results   = c("div.tile","xml"),
    title     = c("span.tile--img__title","text"),
    link      = c("a.tile--img__sub","link"),
    image     = c("img.tile--img__img","src")
)

## duckduckgo news ----
duckduckgo_news = list(
    results   = c("div.result__body","xml"),
    title     = c("h2.result__title","text"),
    link      = c("a.result__a","link"),
    text      = c("div.result__snippet","text"),
    source    = c("a.result__url","text"),
    published = c("span.result__timestamp","text")
)

## yahoo text-----
yahoo_text = list(
    results = c("li > div.dd.algo","xml"),
    title   = c("h3.title","text"),
    link    = c("h3.title > a","link"),
    text    = c("div.compText.aAbs","text"),
    page    = c("div.pages > strong","text")
)
## yahoo news-----
yahoo_news = list(
    results   = c("li > div.dd.NewsArticle","xml"),
    title     = c("h4.s-title","text"),
    link      = c("h4.s-title > a","link"),
    text      = c("p.s-desc","text"),
    image     = c("a img","src"),
    page      = c("div.pages > strong","text"),
    published = c("span.fc-2nd.s-time.mr-8","text")
)

## yahoo images-----
yahoo_images = list(
    results   = c("li[id^='resitem']","xml"),
    title     = c("a.img","label"),
    link      = c("a","link"),
    image     = c("a.img:first-child > img","src")
)


selectors_v1 <- list(
    "google text" = google_text,
    "google news" = google_news,
    "google images" = google_images,
    "duckduckgo text" = duckduckgo_text,
    "duckduckgo news" = duckduckgo_news,
    "duckduckgo images" = duckduckgo_images,
    "yahoo text" = yahoo_text,
    "yahoo news" = yahoo_news,
    "yahoo images" =yahoo_images
)

attr(selectors_v1, "class") <- "webbot_selectors"

selectors_library <- fastmap::fastmap()
selectors_library$set("ver1", selectors_v1)
selectors_versions <- data.frame(version = c("ver1"), snapshot_date = as.Date("2023-03-17"))

usethis::use_data(selectors_library, selectors_versions, internal = TRUE, overwrite = TRUE)

