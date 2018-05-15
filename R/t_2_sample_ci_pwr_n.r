t_2_sample_ci_pwr_n<- function(x_mu_alt,x_sigma_alt,x_n_alt,x_pwr_alt
                              ,x_mu_null,x_sigma_null, x_n_null,x_pct
                              ) {

    # SE of differences between 2 independent means
    SE_2_means <- sqrt( x_sigma_alt^2/x_n_alt + x_sigma_null^2/x_n_null )
    #
    # compute confidence interval and rejection area around the null hypothesis
    #
    alpha  <- 1 - x_pct/100
    p_star <- alpha/2
    z_star <- abs( qnorm(p_star, sd = x_sigma_null ) )

    ci_lb  <- x_mu_null - z_star * SE_2_means
    ci_ub  <- x_mu_null + z_star * SE_2_means
    ci     <- paste(x_mu_null,'+-',round(z_star * SE_2_means,2))
    #
    # calculate z_score of alternative hypothesis in the rejection
    # zone of the null hypothesis
    #
    z_alt_value   <- (z_star - x_mu_alt)/SE_2_means
    pwr_alt_value <- pnorm(z_alt_value,x_sigma_alt)


    df <- as.data.frame(cbind(x_mu_alt,x_sigma_alt,x_n_alt,x_pwr_alt
                              ,x_mu_null,x_sigma_null, x_n_null,x_pct
                              ,z_alt_value,pwr_alt_value
                             )
                       )


    return( df)
}
