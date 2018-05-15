
#########################################################################
# ci_df format
# x_mu1 x_sigma1 x_n1 x_mu2 x_sigma2 x_n2 x_pct alpha p_star   t_star
# 1  52.1     45.1   22  27.1     26.4   22    95  0.05  0.025 2.079614
# SE_2_means    ci_lb   ci_ub          ci  t_value    p_value reject_H_0
# 1   11.14159 1.829798 48.1702 25 +- 23.17 2.243845 0.03575082       TRUE
##########################################################################
t_2_sample_ci_plot <- function(ci_df) {
    x_n1 <- as.numeric(ci_df['x_n1'])
    x_n2 <- as.numeric(ci_df['x_n2'])
    pct  <- as.numeric(ci_df['x_pct'])
    df_mn <- min(x_n1,x_n2) - 1
    alpha <- 1 - pct/100
    t_star <- abs(qt(alpha/2,df_mn))
    p_star <- pt(-1 * t_star,df_mn)
    t_value <- as.numeric(ci_df['t_value'])
    p_value <- as.numeric(ci_df['p_value'])

    tails <- function(x) {
        norm_tail_std <- dt(x,df=df_mn)
        norm_tail_std[x > -1 * t_star & x < t_star] <- NA
        return(norm_tail_std)
    }
    center <- function(x) {
        middle <- dt(x,df=df_mn)
        middle[x < -1 * t_star & x > t_star] <- NA
        return(middle)
    }

    xvalues <- data.frame(x = c(-3, 3))
    plot <- ggplot(xvalues, aes(x = xvalues))

    plot + stat_function(fun = dt, args = list(df=df_mn))  +
    stat_function(fun = center,geom = "area", fill = "red", alpha = .5) +
    stat_function(fun = tails, geom = "area", fill = "green", alpha = 1.0) +
#
    geom_segment(aes(x=-t_star,y=0,xend=-t_star,yend=.35)) +
    geom_segment(aes(x= t_star,y=0,xend= t_star,yend=.35)) +
    geom_text(x = 0, y = .3, size = 4, label = paste0("pct = ",round(pct,4))) +


    geom_text(x = -t_star, y = 0.38, size = 4
             ,label= paste0("alpha=(100 - pct)/100"
                          ,"\np* = alpha/2"
                          ,"\nt* = | qt(p*,df) |")
        ) +
    geom_text(x =  t_star, y = 0.38, size = 4
             ,label= paste0("alpha= ",alpha
                           ,"\np* = ",p_star
                           ,"\nt* = ",round(t_star,3)
                           )
    ) +

    geom_segment(aes(x= t_value,y=0,xend= t_value,yend=.20)) +
    geom_text(x = t_value, y=.22, size = 4
             ,label = paste0("p = ",round(p_value,3)
                            ,"\nt = ",round(t_value,3))) +

    geom_segment(aes(x = -t_value,y=0,xend= -t_value,yend=.20)) +
    annotate("text", x = -t_value, y = 0.24, parse = TRUE, size = 4, fontface ="bold"
             ,label= paste0("t == frac({x[1] - x[2]},sqrt(frac(s[1]^2,n[1]) + frac(s[1]^2,n[2])))"
                           )
             ) +
    geom_text(x = -t_value,y=.21,size = 4,label = "p = pt(t,df)") +

    xlim(c(-4, 4)) +
    xlab('t')
}
