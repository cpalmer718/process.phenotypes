% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/markdown_helper_functions.R
\name{report.factor.summary}
\alias{report.factor.summary}
\title{Helper function to report summary information about uncertain
values in expected categorical variables}
\arguments{
\item{variable.entry}{List entry in dataset yaml for this variable.}

\item{name}{Character vector of harmonized name of variable in yaml.}

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
This function has hybrid functionality. It was originally
intended to report entries of factor variables that do not match
defined levels/shared model data. Later on, functionality was added
to try to \emph{ad hoc} harmonize self-reported ancestry labels, and at
that point this function was expanded to provide a detailed summary
of resolution status for such ancestry variables as well.
}
