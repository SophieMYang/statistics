ci_proportion_text <- function(Question,stmt_subject_verb_phrase,stmt_direct_object
                               ,x_pct, x_min, x_max, x_n,x_pe) {

    x_min_fmt <- round(as.numeric(x_min),2)
    x_max_fmt <- round(as.numeric(x_max),2)
    s1<-paste0('1.  We are ',x_pct,'% confident that the true proportion of ',stmt_subject_verb_phrase
               ,' is between ',x_min_fmt,' and ',x_max_fmt
               ,'.')

    text <- paste0(Question,'\n\n',s1)
    return(text)
}
