#
#
t_2sample_stat <- function(x_mu_alt,x_sigma_alt,x_n_alt,x_mu_null,x_sigma_null,x_n_null) {
    PE_diff_mu   <- (x_mu_alt - x_mu_null)
    SE_diff_mu   <- sqrt(x_sigma_alt^2/x_n_alt + x_sigma_null^2/x_n_null)
    df_min_ns    <- min(x_n_alt -1, x_n_null - 1)  # conservative estimate
    t_value      <- PE_diff_mu/SE_diff_mu
    t_value
}
