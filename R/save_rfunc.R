#' Save the function f for calling from fortran
#' @param f the R function to be called using `.Fortran`
#' @useDynLib ftest
#' @export save_rfunc
save_rfunc  <- function(f) {
    .Call("store_rfun", f, PACKAGE = "ftest")
    invisible(TRUE)
}
