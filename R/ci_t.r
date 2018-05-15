ci_t <- function(x_mu,x_sigma,x_n,x_pct,x_mu_0=x_mu){
    # Compute the critical value as a t-score, t*
    # 1.  Compute alpha (α): α = 1 - (confidence level / 100)
    # 2.  Find the critical probability (p*): p* = 1 - α/2
    # 3.  To express the critical value as a t-score,
    #     find the t-score having a cumulative probability equal to the critical probability (p*),
    #     the lower tail of the distribution.
    alpha <- 1 - x_pct/100
    p_star <- 1 - alpha/2
    t_star <- qt( p_star, df = x_n - 1, lower.tail = TRUE)
    SE <- x_sigma/sqrt(x_n)
    ME <- t_star * SE
    int_lb <- x_mu - ME
    int_ub <- x_mu + ME
    conf_int <- paste(x_mu,'+-',ME)
    #
    # calculate t_statistic
    #
    t_stat <- abs((x_mu - x_mu_0)/SE)
    p_t <- pt(t_stat,df = x_n - 1)
    p_value <- (1 - p_t) * 2  # probability in both tails
    reject_H_0 <- p_value < alpha

    df <- cbind(x_pct,t_star,int_lb,int_ub,SE,ME,conf_int,t_stat,p_t,p_value,reject_H_0)
    return( df)
}
