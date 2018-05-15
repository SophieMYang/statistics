ci_text <- ci_text <- function(Question,stmt_subject_verb_phrase,stmt_direct_object
                               ,x_pct, x_min, x_max, x_n,x_pe) {

    x_min_fmt <- round(as.numeric(x_min),2)
    x_max_fmt <- round(as.numeric(x_max),2)
    s1<-paste0('1.  We are ',x_pct,'% confident that, on average, ',stmt_subject_verb_phrase
               ,x_min_fmt,' to ',x_max_fmt,stmt_direct_object
               ,'.')

    s2<-paste0('2.  ',x_pct,'% of random samples from the population'
               ,' of size ',x_n
               ,' will yield confidence intervals that captures the true population ', x_pe
               ,' of ',stmt_direct_object,'.' )

    s3<-paste0('3.  ',100 - x_pct,'% of random samples from the population'
               ,' of size ',x_n
               ,' will yield confidence intervals that do not capture the true population '
               , x_pe,' of ',stmt_direct_object,'.' )

    text <- paste0(Question,'\n\n',s1,'\n\n',s2,'\n\n',s3)
    return(text)
}
