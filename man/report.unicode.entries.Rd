% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/markdown_helper_functions.R
\name{report.unicode.entries}
\alias{report.unicode.entries}
\title{Helper function to report summary information about Unicode
characters that are not removed by upstream cleaning}
\arguments{
\item{variable.entry}{List entry in dataset yaml for this variable.}

\item{suppress.reporting}{Logical controlling whether variable report data
should be suppressed.}
}
\value{
Formatted kable for rendering, or NULL if reporting suppressed.
}
\description{
This function exclusively functions to emit formatted information
in the phenotype Rmarkdown report. It has been
parametrized out in order to:
\itemize{
\item clean up the report proper;
\item sanitize some of the required hybrid syntax from working with
R content in markdown; and
\item expose the results of this function to testthat
}

You should never need to call this function for any reason.
}
\details{
Unicode characters often sneak by the \emph{ad hoc} conversion
logic used in this package. The linking between Unicode character
and desired ASCII representation has been exposed to config space.
This reporting function includes tracking information about the
observed Unicode character, in the hopes that the user can expand
the mapping table to convert such characters into compliant values.
}
