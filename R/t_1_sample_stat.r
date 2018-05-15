#
# Computes the t-statistic for 1 sample
t_1_sample_stat <- function(x_mu_alt,x_sigma_alt,x_n_alt,x_mu_null) {
    PE_diff_mu   <- (x_mu_alt - x_mu_null)
    SE_diff_mu   <- x_sigma_alt/sqrt(x_n_alt)
    t_value      <- PE_diff_mu/SE_diff_mu
    t_value
}
