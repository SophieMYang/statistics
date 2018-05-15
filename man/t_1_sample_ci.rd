\name{t_1_sample_ci}
\alias{t_1_sample_ci}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
t distribution Confidence Interval for a single sample observation.
}
\description{
Calculates the sample confidence level range based on the sample mean, sample standard error, sample size, and desired confidence percentage for a t distribution.
}
\usage{
t_1_sample_ci(x_mu,x_sigma,x_n,x_pct)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x_mu}{sample mean1}
  \item{x_sigma}{sample sigma (standard deviation or sample error)}
  \item{x_n}{sample size}
  \item{x_pct}{confidence level percent}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
Returns a dataframe ci_df, confidence interval dataframe, of derived values.

  \item{ci_df[x_pct]}{Confidence interval percentage.}
  \item{ci_df[alpha]}{Associated Confidence interval alpha value, 1 - x_pct/100}
  \item{ci_df[p_star]}{Associated p_star value in a two sided tail, alpha/2}
  \item{ci_df[t_star]}{Associated Confidence interval alpha value, qt( p_star, df = x_df)}
  \item{ci_df[SE]}{Associated Confidence interval SE}
  \item{ci_df[ci_lb]}{Associated Confidence interval lower bound}
  \item{ci_df[ci_ub]}{Associated Confidence interval upper bound}
  \item{ci_df[ci]}{Associated Confidence interval x_mu +- SE}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
Coursera Inferntial Statistics, Week-3, Inference for numerical values, Inference for a mean - slide 6
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

t_1_sample_ci(52.1,45.1,22,95)
## The function is currently defined as
function (x)
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
