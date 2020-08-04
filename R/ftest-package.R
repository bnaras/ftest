#' ftest is a package demonstrating how to call an R function from Fortran
#'
#' A complete example is provided.
#'
#' @name ftest-package
#' @docType package
#' @author Balasubramanian Narasimhan
#' Maintainer: Balasubramanian Narasimhan<naras@stat.stanford.edu>
#' @keywords package
#' @examples
#'
#' ## Suppose we wish to call `r_fun` from Fortran
#'
#' r_fun <- function(y, z, w) {
#'    w  <- w / sum(w)
#'    sum((y - z)^2 * w / sum(w))
#' }
#'
#' y = 1:10; z = 11:20; w = rep(1, 10);
#' r_fun(y = y, z = z, w = w) # 100!
#'
#' ## Write the r_from_f function as below.
#'
#' r_from_f  <- function(r_fun, y, z, w) {
#'    ## save the R function to call in C ; fcallr knows to look for it there.
#'    save_rfunc(r_fun)
#'    u <- .Fortran("fcallr",
#'                  length(y),
#'                  as.double(y),
#'                  as.double(z),
#'                  as.double(w),
#'                  result = as.double(0), PACKAGE = "ftest")
#'    u$result
#'}
#'
#' stopifnot(r_from_f(r_fun, y, z, w) == r_fun(y, z, w))
#'
#' r_from_f(r_fun, y, z, w)
#'
NULL



