% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/derived_variable_helpers.R
\name{derive.rank.normal.transform}
\alias{derive.rank.normal.transform}
\title{Apply inverse/rank normal transformation to numeric variable}
\usage{
derive.rank.normal.transform(
  variable,
  offset = 0.5,
  stratification.vars = list(),
  include.subjects = NA,
  primary.call = TRUE
)
}
\arguments{
\item{variable}{Numeric vector to be transformed.
This function is intended to be called from the \code{derived} variable
block of a dataset configuration file, in which case the mapping keys
under \code{variables} and \code{derived} (e.g. HW00001) can be called directly.}

\item{offset}{Numeric small decimal offset for transform
adjustment. Generally should be [0.3, 0.5].}

\item{stratification.vars}{List of input variables from package's
representation of the input phenotype data to be used
as factors for stratifying data before applying inverse
normal transform. The most common variable specified here
would be binary genetic sex, as applicable and with appropriate caveats.}

\item{include.subjects}{Logical vector or NA. If an indicator vector,
this indicates which subjects should be considered for current transformation.
This parameter is part of recursive transformation, and generally
should not be called by the user. NA indicates all subjects should
be considered in the current transformation.}

\item{primary.call}{Logical indicating whether this is the top-level
call of this function. Do not set or change this, unless you want really
awful behavior.}
}
\description{
Transforms a numeric vector to a normally distributed variable
with certain configurable settings.
}
\details{
The outcome of this transformation is guaranteed to be normal,
but may not behave as you want it to. Parametric information
about the variable is lost. Ties are resolved by random resolution,
which has desirable statistical properties but which breaks down
(as do all methods) as the number of ties increases relative to
the sample size. Multiple transformations result in different
variables, with the extent of the differences again dependent
on the number of ties.

We really seek to emphasize here: the presence of an abundance
of ties will cause this function to have extremely undesirable
properties. Please use this with caution.

The corresponding unit test is only probabilistically passing,
as it uses the Shapiro p-value to determine success. Rerunning
the test even a single time should generally do the trick. We
may reduce the stringency of the test p-value cutoff to prevent
sporadic issues.

This function was originally intended for use in the derived
variable block of the input configuration file. In practice,
you may find that the intention is to merge your cleaned phenotype
data with other sources. Depending on the context, it may or
may not be appropriate to wait to apply the inverse normal transform
until after the merge operation is complete. Due to the complexity
of making sure variables are actually compatible with one another,
merging is not directly supported in this library. However,
the shared models system was created with the intention of
making data merging possible when appropriate, and should
be favored if possible.
}
\examples{
numeric.data <- runif(1000, 0, 1)
strat <- sample(c("yes", "no"), 1000, replace = TRUE)
phenotype.data <- data.frame(
  HW00001 = numeric.data,
  HW00002 = factor(strat)
)
der.var <- derive.rank.normal.transform(phenotype.data$HW00001,
  stratification = list(phenotype.data$HW00002)
)
## this function is designed as a utility to be
## deployed in the dependency block of a user configuration
## file. it requires the bindings of the phenotype data
## matrix to be available in the current context
\dontrun{
derive.rank.normal.transform(HW00001, stratification = list(HW00002))
}
}
