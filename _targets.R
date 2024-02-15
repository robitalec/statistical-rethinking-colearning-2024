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
# Homework 02 -------------------------------------------------------------
targets_h02 <- c(
	tar_target(
		Howell_lte_13,
		data_Howell()[age <= 13]
	),
	zar_brms(
		h02_q02,
		formula = weight ~ age,
		data = Howell_lte_13,
		prior = c(
			prior(normal(22.5, 0.5), Intercept),
			prior(normal(3, 0.5), b),
			prior(exponential(1), sigma)
		)
	),
	tar_target(
		prep_Oxboys,
		data_Oxboys()
	),
	)
)


# Targets: all ------------------------------------------------------------
# Automatically grab all the "targets_*" lists above
lapply(grep('targets', ls(), value = TRUE), get)
