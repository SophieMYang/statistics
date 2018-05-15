###############################################################################
# xp sample proportion of success p value; alternative hypothesis value
# n
# x_pct confidence interval
# Xp population proportion of success p.  Use H0 value when performing a hypothesis test
# xp_null null hypothesis value.
# x_me : if > 0; calculate a sample size to achieve this margin of error level
###############################################################################
p_1_proportion_ci <- function(xp,xn,x_pct=95,Xp=xp,xp_null=0) {

    alpha  <- 1 - x_pct/100
    p_star <- 1 - alpha/2
    z_star <- qnorm( p_star)                # critical value associated with alpha

    SE_xp <- sqrt(Xp*(1-Xp)/xn)                # Sampling distribution Standard Error

    ci_lb      <- xp - z_star * SE_xp
    ci_ub      <- xp + z_star * SE_xp
    ci         <- paste0(xp,'+-',format(SE_xp,digits=log(SE_xp,10)+3))
    z_value    <- (xp - xp_null)/SE_xp
    p_value    <- pnorm(-1*abs(z_value))
    pq_condition <- xn*Xp >=10 & (1-Xp)*xn >= 10 # success failure condition
    reject_H_0 <- p_value < alpha

    df <- as.data.frame(cbind(xp,xn,x_pct,Xp
                             ,alpha,p_star,z_star,SE_xp,ci_lb,ci_ub)
                             )
    df$ci           <- ci
    df$z_value      <- z_value
    df$p_value      <- p_value
    df$pq_condition <- pq_condition
    df$reject_H_0   <- reject_H_0
    return(df)
}



