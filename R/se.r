se_1 <- function(x_sigma,x_n) {
    return(x_sigma/sqrt(x_n))
}

se_2 <- function(x_sigma_1,x_n_1,x_sigma_2,x_n_2) {
    return (sqrt(x_sigma_1^2/x_n_1 + x_sigma_2^2/x_n2))
}
