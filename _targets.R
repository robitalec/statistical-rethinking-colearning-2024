# === Targets -------------------------------------------------------------
# Alec L. Robitaille



# Source ------------------------------------------------------------------
targets::tar_source('R')


# Options -----------------------------------------------------------------
# Targets
tar_option_set(format = 'qs')

# Stan
options(mc.cores = 2,
				scipen = 999,
				digits = 2)


# Quarto ------------------------------------------------------------------
targets_quarto <- c(
	tar_quarto(site, path = '.')
# Homework 01 -------------------------------------------------------------
targets_h01 <- c(
	tar_target(
		Howell_lte_13,
		data_Howell()[age <= 13][, age_factor := factor(round(age))]
	),
	zar_brms(
		h01_q02,
		formula = weight ~ age_factor,
		data = Howell_lte_13,
		prior = c(
			prior(normal(5, 0.5), Intercept),
			prior(normal(2, 1), b),
			prior(exponential(1), sigma)
		)
	)
)


# Targets: all ------------------------------------------------------------
# Automatically grab all the "targets_*" lists above
lapply(grep('targets', ls(), value = TRUE), get)
