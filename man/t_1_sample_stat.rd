\name{t_1_sample_stat}
\alias{t_1_sample_stat}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
t value associated with 1 sample mean and null mean values
}
\description{
Calculates the standardized t-value associated with 1 sample mean, sample sigma, sample size n, and a null mean value.
}
\usage{
t_1_sample_stat(x_mu_alt,x_sigma_alt,x_n_alt,x_mu_null)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x_mu_alt}{sample mean}
  \item{x_sigma_alt}{sample sigma1 (standard deviation or sample error)}
  \item{x_n_alt}{sample size}
  \item{x_mu_null}{null mean}
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

t_1_sample_stat(x_mu_alt=52.1,x_sigma_alt=45.1,x_n_alt=22,x_mu_null=30)
## The function is currently defined as
function (x)
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
