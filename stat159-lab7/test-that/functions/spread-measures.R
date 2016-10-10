spread_measures <- function(x) {
  c(range(x),IQR(x), sd(x))
}