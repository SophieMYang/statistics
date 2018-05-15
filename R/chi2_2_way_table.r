chi2_2_way <- function(way1_obs,way2_obs,x_pct=95) {
    tot_obs  <- sum(way1_obs) + sum(way2_obs)  # total observations = 10000
    way1_tot <- sum(way1_obs)                  # total way 1 observations = 7078
    way2_tot <- sum(way2_obs)                  # total way 2 observations = 2922
    bin_tot  <- way1_obs + way2_obs            # bin totals = c(5000,2500,2500)
    way1_evf <- way1_tot/tot_obs               # way1 expected value proportion = .7078
    way2_evf <- way2_tot/tot_obs               # way2 expected value proportion = .2922
    way1_exp_values <- way1_evf * bin_tot      # way 1 expected values 3539.0 1769.5 1769.5
    way2_exp_values <- way2_evf * bin_tot      # way 2 expected values 1461.0  730.5  730.5

    z1_bin_val2 <- (way1_obs - way1_exp_values)^2 / way1_exp_values # pwr(Z1,2) value/bin
    z2_bin_val2 <- (way2_obs - way2_exp_values)^2 / way2_exp_values # pwr(Z2,2) value/bin
    chi2_value <- sum(z1_bin_val2 + z2_bin_val2)
    df <- length(way1_obs) - 1         # what happens if there are more than way2_obs, wayn_obs?
    p_value <- pchisq(chi2_value,df=df,lower.tail = FALSE)
    df <- as.data.frame(cbind(way1_obs,way2_obs,x_pct
                             ,tot_obs,way1_tot,way2_tot,bin_tot,way1_evf,way2_evf
                             ,way1_exp_values,way2_exp_values
                             ,z1_bin_val2,z2_bin_val2
                             ,chi2_value,p_value
                             )
                       )
    return(df)
}
