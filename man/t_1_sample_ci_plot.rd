\name{t_1_sample_ci_plot}
\alias{t_1_sample_ci_plot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
t Confidence Interval for 2 different independent means.
}
\description{
Calculates the sample confidence level range based on the sample mean, sample standard error, sample size, and desired confidence percentage for a t distribution.
}
\usage{
t_1_sample_ci_plot(x_mu1,x_sigma1,x_n1,x_mu2,x_sigma2,x_n2,x_pct)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x_mu1}{sample mean1}
  \item{x_sigma1}{sample sigma1 (standard deviation or sample error)}
  \item{x_n1}{sample size1}
  \item{x_mu2}{sample mean2}
  \item{x_sigma2}{sample sigma2 (standard deviation or sample error)}
  \item{x_n2}{sample size2}
  \item{x_pct}{sample confidence percent}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

t_1_sample_ci_plot(0,1,30,c(90,95,99))
## The function is currently defined as
function (x)
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
