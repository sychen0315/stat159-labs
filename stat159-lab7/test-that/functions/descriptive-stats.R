descriptive_stats <- function(x,na.rm=FALSE){
  c(median(x,na.rm=na.rm),mean(x,na.rm=na.rm),range(x,na.rm=na.rm),
    IQR(x,na.rm=na.rm),sd(x,na.rm=na.rm),sum(is.na(x)))
}
