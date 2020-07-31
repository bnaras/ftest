
dfun <- function(y, z, w) {
    w  <- w / sum(w)
    sum((y - z)^2 * w / sum(w))
}

ftest  <- function(dfun, y, z, w) {
    save_rfunc(dfun)
    u <- .Fortran("frcall",
                  length(y),
                  as.double(y),
                  as.double(z),
                  as.double(w),
                  result = as.double(0), PACKAGE = "ftest")
    u$result
}
