ci <- function(x_mu,x_sigma,x_n,x_pct){
    # Compute the critical value as a z-score, z*
    # 1.  Compute alpha (α): α = 1 - (confidence level / 100)
    # 2.  Find the critical probability (p*): p* = 1 - α/2
    # 3.  To express the critical value as a z-score,
    #     find the z-score having a cumulative probability equal to the critical probability (p*).
    alpha <- 1 - x_pct/100
    p_star <- 1 - alpha/2
    z_star <- qnorm( p_star)
    SE <- x_sigma/sqrt(x_n)
    ME <- z_star * SE
    int_lb <- x_mu - ME
    int_ub <- x_mu + ME
    conf_int <- paste(x_mu,'+-',ME)
    df <- cbind(x_pct,z_star,int_lb,int_ub,SE,ME,conf_int)
    return( df)
}
