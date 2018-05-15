# Shading from x = -1 to x = 1 (within one std deviation):

dnorm_1_sd <- function(x){
    norm_1_std <- dnorm(x)
    # Have NA values outside interval x in [-1, 1]:
    norm_1_std[x <= -1 | x >= 1] <- NA
    return(norm_1_std)
}
# Shading from x = -2 to x = 2 (within two std deviation):

dnorm_2_sd <- function(x){
    norm_2_std <- dnorm(x)
    # Have NA values outside interval x in [-2, 2]:
    norm_2_std[x <= -2 | x >= 2] <- NA
    return(norm_2_std)
}

# Shading from x = -3 to x = 3 (within two std deviation):

dnorm_3_sd <- function(x){
    norm_3_std <- dnorm(x)
    # Have NA values outside interval x in [-3, 3]:
    norm_3_std[x <= -3 | x >= 3] <- NA
    return(norm_3_std)
}

dnorm_tail_sd <- function(x) {
    norm_tail_std <- dnorm(x)
    norm_tail_std[x > -2.3 & x < 2.3] <- NA
    return(norm_tail_std)
}
