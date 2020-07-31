save_rfunc  <- function(f) {
    .Call("store_rfun", f, PACKAGE = "ftest")
    invisible(TRUE)
}
