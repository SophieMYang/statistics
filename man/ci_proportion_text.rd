\name{ci_proportion_text}
\alias{ci_proportion_text}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
ci_proportion_text
}
\description{
Confidence interval text description.
}
\usage{Use in an RMD in-line block to print a description of the confidence interval.
ci_proportion_text(Question,x_pct, x_min, x_max, x_n,x_pe, x_subject)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Question}{Research question associated with the confidence interval.}
  \item{x_pct}{Confidence interval percent.}
  \item{x_min}{Confidence interval minimum value associated with x_pct.}
  \item{x_max}{Confidence interval maximum value associated with x_pct.}
  \item{x_pe}{Confidence point estimate, typically the mean.}
  \item{x_phrase}{Confidence interval confirmation phrase.}
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
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

The General Social Survey asks: For how many days during the past 30 days was your mental health,
which includes stress, depression, and problems with emotions, not good?
Based on responses from 1,151 US residents, the survey reported a 95% confidence interval of
3.40 to 4.24 days in 2010.

`r ci_proportion_text('How many days during the past 30 days was your mental health not good?'
          ,95,3.4,4.24,1151,'mean',' bad mental health days per month')`

## The function is currently defined as
function (x)
{
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
