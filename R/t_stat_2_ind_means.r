statistic <- function(x_mu_null,x_mu_alternative,x_sigma,x_n) {
    SE = x_sigma/sqrt(x_n)
    stat_value <- (x_mu_alternative - x_mu_null)/SE
    return(cbind(SE,stat_value))
}
