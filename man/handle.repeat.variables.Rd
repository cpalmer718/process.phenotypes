% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parse_surveycto.R
\name{handle.repeat.variables}
\alias{handle.repeat.variables}
\title{Create variable annotations for repeat variable blocks}
\usage{
handle.repeat.variables(
  out.yaml,
  cur.varname,
  name.value,
  label.value,
  survey,
  dataset.tag,
  responses,
  choice.list,
  i
)
}
\arguments{
\item{out.yaml}{List containing partially constructed variable configuration
data.}

\item{cur.varname}{Character vector of constructed name of repeat start variable.}

\item{name.value}{Character vector of name column entry for repeat start variable.}

\item{label.value}{Character vector of label column entry for repeat start variable.}

\item{survey}{Data frame containing survey tab from SurveyCTO configuration form file.}

\item{dataset.tag}{Character vector of tag for current dataset.}

\item{responses}{Character vector of column names of completed questionnaire wide format csv.}

\item{choice.list}{List of configured shared model data for form definition, based
on the form file choices tab.}

\item{i}{Integer index of repeat start variable in survey configuration table.}
}
\value{
List; first entry \code{out.yaml} a modified version of input yaml configuration
with repeat variable block data added; second entry \code{i} incremented global counter
reflecting the number of variables added in the repeat.
}
\description{
SurveyCTO form definitions support what we term "repeat blocks":
delimited sets of variables that are repeatedly prompted to users
until the user passes and moves on to the next set of variables.
This function determines how many responses were maximally observed
in the current SurveyCTO wide csv export, and creates variable configuration
entries as necessary.
}
\details{
These variables are fundamentally different than what was originally
envisioned for process.phenotypes, and so there is substantial logic
involved in emitting compatible configuration data for them.

The ordering of repeat blocks is as follows: if the form definition
contains a \verb{begin repeat} statement, a definition for variables \code{var}
and \code{var2}, and an \verb{end repeat} statement, the output csv will contain,
for however many repeat instances were maximally present in the response
set, \code{var1_1}, \code{var2_1}, \code{var1_2}, \code{var2_2}, etc. Configuration blocks
are thus added to the dataset configuration file to match this ordering.
The standard name convention \code{TAG#####} is extended as \code{TAG#####_1}, etc.
The hope with this naming is that, with fixed width numeric tags and delimiters,
it should be possible to easily query the entire set of repeat responses to
a given question as something like \code{data[, grepl("TAG#####_", colnames(data))]}.

We don't have a good explanation for this at this point, but seemingly
sometimes repeat variables are led by a single variable named "{repeatname}_count",
based on the name of the repeat block in the SurveyCTO configuration form data.
We don't know exactly what in the form data predicts the presence or absence
of this column. As such, this function scans the response data for such a column
in the predicted location and adds a configuration entry if it is detected.

Repeat blocks may be entirely absent from response data, when the repeat
variables are optional and no one has yet opted to respond even one time.
This ultimately means that the run of \code{parse.surveycto} will correctly
exclude that repeat block from configuration, but future exports for the
questionnaire from SurveyCTO will gain a repeat block that was not initially
present. This is, as they say, a real bummer. The variable(s) can be added
to the existing configuration file, though using the variable name nomenclature
assumed by the parse.surveycto processing chain, it ruins the aesthetics
by injecting higher numbered variable tags into the middle of the variable
configuration block.

Manually updating repeat blocks to reflect new exports from SurveyCTO
is tedious and error-prone. If you have to do it, please look into
the utility function expand.surveycto.config and see if it can help you.
}
\examples{
config.data <- list(variables = list(HW00001 = list(
  name = "SubmissionDate",
  type = "string"
)))
cur.varname <- "HW00002"
name.value <- "var2"
label.value <- "description of var2"
survey <- data.frame(
  type = c("begin repeat", "text", "text", "end repeat"),
  name = c("repeat1", "var2", "var3", ""),
  label = c("", "description of var2", "description of var3", "")
)
dataset.tag <- "HW"
responses <- c("SubmissionDate", "var2_1", "var3_1")
choice.data <- data.frame(models = list(model1 = list(
  type = "categorical",
  levels = list(
    "1" = list(
      name = "answer 1",
      alternate_patterns = c("1")
    ),
    "2" = list(
      name = "answer 2",
      alternate_patterns = c("2")
    )
  )
)))
i <- 2
results <- process.phenotypes:::handle.repeat.variables(
  config.data, cur.varname, name.value,
  label.value, survey, dataset.tag,
  responses, choice.data, i
)
}
\seealso{
expand.surveycto.config
}
