# x_alt_np Alternate group number of successes, np
# x_alt_nq Alternate group number of non-successes, nq
# x_null_np Null group number of successes, np
# x_null_nq Null group number of non-successes, nq
# x_pct confidence interval
# Calculates confidence interval based off a derived pooled proportion
p_2_nbr_successes_ci <- function(x_alt_np,x_alt_nq,x_null_np,x_null_nq,x_pct=95,xp_null=0){
    # calculate the pooled proportion
    pp <- (x_alt_np + x_null_np)/(x_alt_np+x_alt_nq+x_null_np+x_null_nq)
    pq_condition1 <- pp * (x_alt_np  + x_alt_nq)  > 10 & (1-pp) * (x_alt_np  + x_alt_nq) > 10
    pq_condition2 <- pp * (x_null_np + x_null_nq) > 10 & (1-pp) * (x_null_np + x_null_nq) > 10
    pq_condition  <- pq_condition1 & pq_condition2
    #
    alpha  <- 1 - x_pct/100
    p_star <- 1 - alpha/2
    z_star <- qnorm( p_star)                # critical value associated with alpha

    SE_p1 = (pp * (1 - pp))/(x_alt_np + x_alt_nq)
    SE_p2 = (pp * (1 - pp))/(x_null_np + x_null_nq)
    SE_diff_ps = sqrt(SE_p1 + SE_p2)

    x_pe       <- x_alt_np/(x_alt_np+x_alt_nq) - x_null_np/ (x_null_np+x_null_nq)
    ci_lb      <- x_pe - z_star * SE_diff_ps
    ci_ub      <- x_pe + z_star * SE_diff_ps
    ci         <- paste0(x_pe,'+-',format(SE_diff_ps,digits=log(SE_diff_ps,10)+3))

    z_value    <- (x_pe - xp_null)/SE_diff_ps
    p_value    <- pnorm(-1*abs(z_value))
    reject_H_0 <- p_value < alpha

    df <- as.data.frame(cbind(x_alt_np,x_alt_nq,x_null_np,x_null_nq,x_pct
                              ,pp,alpha,p_star,z_star,SE_diff_ps,x_pe,ci_lb,ci_ub)
    )
    df$ci           <- ci
    df$z_value      <- z_value
    df$p_value      <- p_value
    df$pq_condition <- pq_condition
    df$reject_H_0   <- reject_H_0
    return(df)
}
