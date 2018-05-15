t_1_sample_ci <- function(x_mu_alt,x_sigma_alt,x_n_alt,x_pct_alt,x_mu_null=0) {
    alpha  <- 1 - x_pct_alt/100
    p_star <- 1 - alpha/2

    x_df   <- x_n_alt - 1
    t_star <- qt( p_star, df = x_df, lower.tail = TRUE)

    SE         <- x_sigma_alt/sqrt(x_n_alt)
    ci_lb      <- x_mu_alt - t_star * SE
    ci_ub      <- x_mu_alt + t_star * SE
    ci         <- paste0(x_mu_alt,'+-',format(SE,digits=log(SE,10)+3))
    t_value    <- (x_mu_alt - x_mu_null)/SE
    p_value    <- 2 * pt(-abs(t_value),df = x_df, lower.tail = TRUE)
    reject_H_0 <- p_value < alpha
#   The following returns all factors
#    df <- as.data.frame(cbind(x_pct,alpha,t_star,SE,ci_lb,ci_ub,ci))
#   Replace previous line with the next 3
    df <- as.data.frame(cbind(x_mu_alt,x_sigma_alt,x_n_alt,x_pct_alt
                             ,alpha,p_star,t_star,SE,ci_lb,ci_ub)
                             )
    df$ci         <- ci
    df$t_value    <- t_value
    df$p_value    <- p_value
    df$reject_H_0 <- reject_H_0
    return(df)
}
