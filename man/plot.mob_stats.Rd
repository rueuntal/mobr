% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mobr_boxplots.R
\name{plot.mob_stats}
\alias{plot.mob_stats}
\title{Plot sample-level and group-level biodiversity statistics for a MoB analysis}
\usage{
\method{plot}{mob_stats}(mob_stats, index = c("N", "S", "S_rare", "S_asymp",
  "ENS_PIE"), multi_panel = FALSE, col = c("#2B83BA", "#FFC000"), ...)
}
\arguments{
\item{mob_stats}{a \code{mob_stats} object that has the samples and 
treatment level statistics}

\item{index}{The biodiversity statistics that should be plotted.
See \code{\link{get_mob_stats}} for information on the indices. By default there
is one figure for each index, with panels for sample-level and group-level results
as well as for beta-diversity when applicable.}

\item{multi_panel}{A logical variable. If \code{multi_panel = TRUE} then a 
multipanel plot is produced, which shows observed, rarefied, and asymptotic 
species richness and ENS_PIE at the sample-level and the group-level.
This set of variables conveys a comprehensive picture of the underlying 
biodiversity changes.}

\item{col}{a vector of colors for the two groups (control and treatment), set
to NA if no color is preferred}

\item{...}{additional arguments to provide to boxplot, points, and confidence
interval functions}
}
\description{
Plots a \code{mob_stats} object which is produced by the 
function \code{get_mob_stats}. The p-value for each statistic
is displayed in the plot title if applicable.
}
\details{
The user may specify which results to plot or simply to plot 
all the results.
}
\examples{
data(inv_comm)
data(inv_plot_attr)
inv_mob_in = make_mob_in(inv_comm, inv_plot_attr)
# without bootstrap CI for group scale
inv_stats = get_mob_stats(inv_mob_in, group_var = "group",
 ref_group = "uninvaded", n_perm = 20)
plot(inv_stats) 

windows(15,20)
plot(inv_stats, multi_panel = T)
# with bootstrap CI for group scale
inv_stats_boot = get_mob_stats(inv_mob_in, group_var = "group",
 ref_group = "uninvaded", n_perm = 20, boot_groups=T)
plot(inv_stats_boot)
}
\author{
Felix May, Xiao Xiao, and Dan McGlinn
}