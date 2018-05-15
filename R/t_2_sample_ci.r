t_2_sample_ci <- function(x_mu1,x_sigma1,x_n1,x_mu2,x_sigma2,x_n2,x_pct){
    #
    # estimating the difference between independent means
    #
    # PE_2_means +- t_star * SE_2_means

    PE_2_means <- (x_mu1 - x_mu2)
    SE_2_means <- sqrt( x_sigma1^2/x_n1 + x_sigma2^2/x_n2 )  # SE of differences between 2 independent means
    df_2_means <- min(x_n1 -1, x_n2 - 1)                     # conservative estimate

    alpha  <- 1 - x_pct/100
    p_star <- alpha/2
    t_star <- abs( qt( p_star, df = df_2_means ) )

    ci_lb  <- PE_2_means - t_star * SE_2_means
    ci_ub  <- PE_2_means + t_star * SE_2_means
    ci     <- paste(PE_2_means,'+-',round(t_star * SE_2_means,2))
    #
    # calculate t_statistic of population mu's
    #    H_0: mu1 - mu2 = 0
    #    H_1: mu1 - mu2 <> 0
    #
    t_value    <- abs(PE_2_means/SE_2_means)
    p_value    <- pt(t_value,df = df_2_means, lower.tail = FALSE) # probability in one tails
    p_value2   <- 2 * p_value  # probability in both tails
    reject_H_0 <- p_value < alpha

    df <- as.data.frame(cbind(x_mu1,x_sigma1,x_n1,x_mu2,x_sigma2,x_n2,x_pct
                             ,alpha,p_star,t_star,SE_2_means,ci_lb,ci_ub
                             )
                       )

    df$ci         <- ci
    df$t_value    <- t_value
    df$p_value    <- p_value
    df$p_value2   <- p_value2
    df$reject_H_0 <- reject_H_0

    return( df)
}
