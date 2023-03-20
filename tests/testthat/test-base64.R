test_that("base64 convertion", {
    skip_on_cran()
    temp <- tempdir()
    fname <- paste0(temp,"/black")
    data_uri <- "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPAAAADwAQAAAAAWLtQ/AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QAAd2KE6QAAAAHdElNRQfnAg8ADjRaARuXAAAAHklEQVRYw+3BAQ0AAADCoPdPbQ8HFAAAAAAAAMCnAR0QAAH6UAaEAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIzLTAyLTE1VDAwOjE0OjUyKzAwOjAwq7W74QAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMy0wMi0xNVQwMDoxNDo1MiswMDowMNroA10AAAAASUVORK5CYII="
    expect_no_error(base64_to_img(data_uri,fname))
    expect_true(file.exists(paste0(fname,".png")))
})
