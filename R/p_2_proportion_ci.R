# x_p1 population proportion 1 if known otherwise the sample proportion
# x_n1 sample size 1
# x_p2 population proportion 2 if known otherwise the sample proportion
# x_n2 sample size 2
# x_pct confidence interval
# X_p pooled proportion of
p_2_proportion_ci <- function(x_p1,x_n1,x_p2,x_n2,x_pct=95,xp_pool=0,xp_null=0){

    alpha  <- 1 - x_pct/100
    p_star <- 1 - alpha/2
    z_star <- qnorm( p_star)                # critical value associated with alpha

    if(xp_pool == 0) {
        SE_p1 = (x_p1 * (1 - x_p1))/x_n1
        SE_p2 = (x_p2 * (1 - x_p2))/x_n2
    } else {
        SE_p1 = (xp_pool * (1 - xp_pool))/x_n1
        SE_p2 = (xp_pool * (1 - xp_pool))/x_n2
    }
    SE_diff_ps = sqrt(SE_p1 + SE_p2)

    x_pe = x_p1 - x_p2
    ci_lb      <- x_pe - z_star * SE_diff_ps
    ci_ub      <- x_pe + z_star * SE_diff_ps
    ci         <- paste0(x_pe,'+-',format(SE_diff_ps,digits=log(SE_diff_ps,10)+3))
    z_value    <- (x_pe - xp_null)/SE_diff_ps
    p_value    <- pnorm(-1*abs(z_value))
    p_value2   <- p_value * 2
    reject_H_0 <- p_value < alpha

    df <- as.data.frame(cbind(x_pe,x_p1,x_n1,x_p2,x_pct
                              ,alpha,p_star,z_star,SE_diff_ps,ci_lb,ci_ub)
    )
    df$ci           <- ci
    df$z_value      <- z_value
    df$p_value      <- p_value
    df$p_value2     <- p_value2
#    df$pq_condition <- pq_condition
    df$reject_H_0   <- reject_H_0
    return(df)
}
