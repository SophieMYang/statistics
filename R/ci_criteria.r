ci_criteria <- function(x_independent_yn,x_n_lt_10_pct,x_skewed_yn,x_n) {

    test_independence1 <- ifelse(toupper(x_independent_yn) != 'Y',1,0)
    test_independence2 <- ifelse(toupper(x_n_lt_10_pct)    != 'Y',1,0)
    test_skew          <- ifelse(toupper(x_skewed_yn)        == 'Y' & x_n < 30,1,0)
    if (test_independence1 + test_independence2 + test_skew > 1) {
        test_criteria <- paste0('Test conditions not met, either samples are not independent or a skewed distribution.  '
                               ,ifelse(toupper(x_independent_yn) != 'Y','-  Samples are not independent.\n\n','')
                               ,ifelse(toupper(x_n_lt_10_pct)    != 'Y','-  Sample size possibly not independent, n > 10%.\n\n','')
                               ,ifelse(toupper(x_skewed_yn) == 'Y' & x_n < 30, paste0('Sample skewed and sample size ',x_n,' < 30.'),'')
                               )
    } else {
        test_criteria <- paste0("To help ensure that the sampling distribution is nearly normal "
                                ,"and the estimate of SE is sufficiently accurate:\n\n"
                                ,"-  The sample observations are known to be independent\n"
                                ,"     *  through random sampling/assigment "
                                ,"     *  if sampling without replacement,",x_n," less than 10% of the population\n\n"

                                ,"-  ",ifelse(toupper(x_skewed_yn) == 'N'
                                              ,'The sample distribution is not skewed.'
                                              ,paste0('The sample distribution is skewed, but the sample size ',x_n,' > 30.  '
                                                     ,'We assume that the sampling distribution from samples of size ',x_n
                                                     ,' will be nearly normal.\n\n'
                                                     ,'With the required conditions met, we can calculate the associated confidence interval.'
                                                     )

                                )
        )
    }
    return (test_criteria)
}
