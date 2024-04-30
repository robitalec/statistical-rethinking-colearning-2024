# Packages ----------------------------------------------------------------
# Alec L. Robitaille


# Installs ----------------------------------------------------------------
# Sys.setenv(DOWNLOAD_STATIC_LIBV8 = 1)
# install.packages("V8")
# install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
# devtools::install_github("rmcelreath/rethinking")
# remotes::install_github('robitalec/zarg')
# -------------------------------------------------------------------------

library(targets)
library(tarchetypes)
library(qs)

library(conflicted)
conflict_prefer_all('brms', quiet = TRUE)
conflict_prefer_all('tidybayes', quiet = TRUE)
conflict_prefer_all('posterior', quiet = TRUE)
conflict_prefer_all('emmeans', quiet = TRUE)

library(data.table)
library(stringi)

library(devtools)

library(ggdag)
library(dagitty)

library(scico)
library(ggdist)
library(patchwork)
library(ggplot2)
theme_set(theme_bw())
library(latex2exp)

library(knitr)

library(rstan)
library(zarg)
library(cmdstanr)
library(rethinking)
library(brms)
library(tidybayes)
library(bayesplot)
library(emmeans)
library(mice)
library(modelr)

library(spatsoc)

library(janitor)
