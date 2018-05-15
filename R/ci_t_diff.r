ci_t_diff <- function(x_mu1,x_sigma1,x_n1,x_mu2,x_sigma2,x_n2,x_pct){
    #
    # estimating the difference between independent means
    #
    # PE_diff_mu +- t_star * SE_diff_mu

    PE_diff_mu   <- (x_mu1 - x_mu2)
    SE_diff_mu   <- sqrt(x_sigma1^2/x_n1 + x_sigma2^2/x_n2)
    df_min_ns    <- min(x_n1 -1, x_n2 - 1)  # conservative estimate

    alpha  <- 1 - x_pct/100
    p_star <- 1 - alpha/2
    t_star <- qt( p_star, df = df_min_ns, lower.tail = TRUE)
    ME <- t_star * SE_diff_mu
    int_lb <- PE_diff_mu - ME
    int_ub <- PE_diff_mu + ME
    conf_int <- paste(PE_diff_mu,'+-',ME)
    #
    # calculate t_statistic of population mu's
    #    H_0: mu1 - mu2 = 0
    #    H_1: mu1 - mu2 <> 0
    #
    t_stat <- PE_diff_mu/SE_diff_mu
    p_t <- pt(t_stat,df = df_min_ns)
    p_value <- (1 - p_t) * 2  # probability in both tails
    reject_H_0 <- p_value < alpha

    df <- cbind(x_pct,t_star,int_lb,int_ub,SE_diff_mu,ME,conf_int,t_stat,p_t,p_value,reject_H_0)
    return( df)
}
