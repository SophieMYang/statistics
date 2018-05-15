###############################################################################
# x_me desired max margin error
# x_p  population proportion p of success if available, or sample proportion p.
# x_pct confidence interval
###############################################################################
p_1_proportion_me_n <- function(x_me,x_p=.5,x_pct=95) {

    alpha  <- 1 - x_pct/100
    p_star <- 1 - alpha/2
    z_star <- qnorm( p_star)                # critical value associated with alpha

    x_me_n <- z_star^2 * x_p * (1 - x_p)/x_me^2
    if (x_me_n - floor(x_me_n) > 0 ) {
        x_me_n <- floor(x_me_n) + 1
    }

    df <- as.data.frame(cbind(x_me,x_p,x_pct
                             ,alpha,p_star,z_star,x_me_n)
                             )
    return(df)
}



