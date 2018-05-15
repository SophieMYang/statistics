
t_1_sample_ci_plot <- function(ci_df) {
#########################################################################################
#    t_1_sample_ci(52.1,45.1,22,95)
#    x_mu x_sigma x_n x_pct alpha p_star   t_star       SE    ci_lb    ci_ub         ci
#    52.1    45.1  22    95  0.05  0.975 2.079614 9.615352 32.10378 72.09622 52.1+-9.62
#########################################################################################
    x_df    <- as.numeric(ci_df['x_n_alt']) - 1   # sample size degrees of freedom
    alpha   <- as.numeric(ci_df['alpha'])
    t_star  <- as.numeric(ci_df['t_star'])
    p_star <- pt(-1*t_star,x_df)
    t_value <- round(as.numeric(ci_df['t_value']),2)
    p_value <-  round(as.numeric(ci_df['p_value']),2)
    pct     <- (1 - 2*p_star) * 100
    ci      <- ci_df['ci']
    x_mu_null <- 0


    tails <- function(x) {
        norm_tail_std <- dt(x,df=x_df)
        norm_tail_std[x > -1 * t_star & x < t_star] <- NA
        return(norm_tail_std)
    }
    center <- function(x) {
        middle <- dt(x,df=x_df)
        middle[x < -1 * t_star & x > t_star] <- NA
        return(middle)
    }

    xvalues <- data.frame(x = c(-3, 3))

    p <- ggplot(xvalues, aes(x = xvalues))

    # Summary plot for normal distribution (Version Three)

    xvalues <- data.frame(x = c(-3, 3))
    p <- ggplot(xvalues, aes(x = xvalues))

    p + stat_function(fun = dt, args = list(df=x_df))  +
    stat_function(fun = center,geom = "area", fill = "red", alpha = .5) +
    stat_function(fun = tails, geom = "area", fill = "green", alpha = 1.0) +

    geom_vline(xintercept = -1 * t_star) +
    geom_vline(xintercept = t_star) +

        geom_segment(aes(x=t_value,y=0,xend=t_value,yend=.2)) +
        geom_text(x = t_star, y = 0.2, size = 4
                  ,label=paste0('t =',t_value
                               ,'\np-value=',p_value
                               )
                  ) +


    geom_text(x = -t_star, y = 0.38, size = 4
             ,label= paste0("alpha=(100 - pct)/100"
                           ,"\np* = alpha/2"
                           ,"\nt* = | qt(p*,df) |")
             ) +

    geom_text(x = 0, y = .3, size = 4, label = paste0("pct = ",round(pct,4))) +

    geom_text(x = t_star, y = 0.38, size = 4
             ,label=paste0('alpha=',alpha
             ,'\np*=',round(p_star,4)
             ,'\nt*=',round(t_star ,4)
             )
              ) +


    geom_text(x = -3.5, y = 0.01, size = 4, label = paste0('p*',round(p_star,4)) ) +
    geom_text(x =  3.5, y = 0.01, size = 4, label = paste0('p*',round(p_star,4)) ) +
    xlim(c(-4, 4)) +
    xlab(expression(t==frac(x- bar(x),frac(s,sqrt(n))) )) +
        labs(caption = paste0('confidence level=',ci))


    # if(x_mu_null != 0) {
    # p + geom_segment(aes(x=t_value,y=0,xend=t_value,yend=.2)) +
    #     geom_text(x = t_star, y = 0.2, size = 4
    #               ,label=paste0('t =',t_value
    #                             ,'\np-value=',p_value
    #               )
    #     )
    # }
    # p



}
