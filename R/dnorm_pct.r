# Shading from x = -pct to x = pct
# Return the middle 95% middle of normal distribution
qnorm_95_pct_cntr<- function(x){
    norm_095_pct_cntr <- dnorm(x)
    # Have NA values outside interval x in [-1, 1]:
    norm_1_std[x > qnorm(.025) & x < qnorn(.025)] <- NA
    return(norm_1_std)
}

qnorm_025_pct_tails <- function(x){
    norm_1_std <- dnorm(x)
    # Have NA values outside interval x in [-1, 1]:
    norm_5_pct_tail[x <= qnorm(.025) | x >= abs(qnorm(.025))] <- NA
    return(norm_5_pct_tail)
}
# Shading from x = -2 to x = 2 (within two std deviation):

dnorm_001_pct <- function(x){
    norm_2_std <- dnorm(x)
    # Have NA values outside interval x in [-2, 2]:
    norm_2_std[x <= -2 | x >= 2] <- NA
    return(norm_2_std)
}

# Shading from x = -3 to x = 3 (within two std deviation):

dnorm_0005_sd <- function(x){
    norm_3_std <- dnorm(x)
    # Have NA values outside interval x in [-3, 3]:
    norm_3_std[x <= -3 | x >= 3] <- NA
    return(norm_3_std)
}
