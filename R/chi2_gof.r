# x_bin_n    <- c(71,30,25)        # observed sample bin sizes
# exp_bin_n  <- c(75.6,31.5,18.9)  # expected bin sizes
#
# x_bin_n exp_bin_n  chi_bins chi2_value df   p_value chi2_bin_cond chi2_conditon
# 1     205    198.00 0.2474747    5.88961  3 0.1171062             1             1
# 2      26     19.25 2.3668831    5.88961  3 0.1171062             1             1
# 3      25     33.00 1.9393939    5.88961  3 0.1171062             1             1
# 4      19     24.75 1.3358586    5.88961  3 0.1171062             1             1

chi2_gof <- function(x_bin_n, exp_bin_n) {

    chi_bins   <- (x_bin_n - exp_bin_n)^2/exp_bin_n
    chi2_value <- sum(chi_bins)
    df         <- length(x_bin_n) - 1       # degrees of freedom
    p_value    <- pchisq(chi2_value, df, lower.tail = FALSE)
    #
    # Check sample size conditions necessary to reliably use chisq distribution
    # 1.  Independence. Each case that contributes a count to the table must be
    #     independent of all the other cases in the table.
    # 2.  All bins must have a sample size >= 5
    chi2_bin_cond <- exp_bin_n >= 5
    chi2_conditon <- sum(exp_bin_n >= 5) == length(exp_bin_n)
    df <- as.data.frame(cbind(x_bin_n,exp_bin_n
                       ,chi_bins,chi2_value,df,p_value
                       ,chi2_bin_cond,chi2_conditon
                       )
                 )
    return(df)
}
