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
)


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
	zar_brms(
		h02_q03,
		formula = diff_height | trunc(lb = 0) ~ occasion_factor,
		data = prep_Oxboys,
		prior = c(
			prior(normal(5, 2), Intercept),
			prior(normal(3, 1), b),
			prior(exponential(1), sigma)
		)
	)

)



# Homework 03 -------------------------------------------------------------
targets_h03 <- c(
	tar_target(
		scaled_foxes,
		data_foxes(scale = TRUE)
	),
	zar_brms(
		h03_q01,
		formula = scale_avgfood ~ scale_area,
		data = scaled_foxes,
		prior = c(
			prior(normal(0, 0.2), Intercept),
			prior(normal(0, 0.5), b),
			prior(exponential(1), sigma)
		)
	),
	zar_brms(
		h03_q02,
		formula = scale_weight ~ scale_avgfood,
		data = scaled_foxes,
		prior = c(
			prior(normal(0, 0.2), Intercept),
			prior(normal(0, 0.5), b),
			prior(exponential(1), sigma)
		)
	),
	zar_brms(
		h03_q03,
		formula = scale_weight ~ scale_avgfood + scale_groupsize,
		data = scaled_foxes,
		prior = c(
			prior(normal(0, 0.2), Intercept),
			prior(normal(0, 0.5), b),
			prior(exponential(1), sigma)
		)
	)
)



# Homework 04 -------------------------------------------------------------
targets_h04 <- c(
	tar_target(
		marriage,
		data_marriage()
	),
	zar_brms(
		h04_q01_m6_9,
		formula = happiness ~ factor(mid) + A,
		data = marriage,
		prior = c(
			prior(normal(0, 1), Intercept),
			prior(normal(0, 2), b),
			prior(exponential(1), sigma)
		)
	),
	zar_brms(
		h04_q01_m6_10,
		formula = happiness ~ A,
		data = marriage,
		prior = c(
			prior(normal(0, 1), Intercept),
			prior(normal(0, 2), b),
			prior(exponential(1), sigma)
		)
	),
	zar_brms(
		h04_q02_m_1,
		formula = scale_weight ~ scale_area,
		data = scaled_foxes,
		prior = c(
			prior(normal(0, 0.2), Intercept),
			prior(normal(0, 0.5), b),
			prior(exponential(1), sigma)
		)
	),
	# m_2 = h03_q02,
	zar_brms(
		h04_q02_m_3,
		formula = scale_weight ~ scale_groupsize,
		data = scaled_foxes,
		prior = c(
			prior(normal(0, 0.2), Intercept),
			prior(normal(0, 0.5), b),
			prior(exponential(1), sigma)
		)
	),
	zar_brms(
		h04_q02_m_4,
		formula = scale_weight ~ scale_area + scale_avgfood,
		data = scaled_foxes,
		prior = c(
			prior(normal(0, 0.2), Intercept),
			prior(normal(0, 0.5), b),
			prior(exponential(1), sigma)
		)
	),
	zar_brms(
		h04_q02_m_5,
		formula = scale_weight ~ scale_area + scale_groupsize,
		data = scaled_foxes,
		prior = c(
			prior(normal(0, 0.2), Intercept),
			prior(normal(0, 0.5), b),
			prior(exponential(1), sigma)
		)
	),
	#m_6 = h03_q03,
	zar_brms(
		h04_q02_m_7,
		formula = scale_weight ~ scale_area + scale_avgfood + groupsize,
		data = scaled_foxes,
		prior = c(
			prior(normal(0, 0.2), Intercept),
			prior(normal(0, 0.5), b),
			prior(exponential(1), sigma)
		)
	),
	tar_target(
		dino,
		data_dinosaurs()
	),
	zar_brms(
		h04_q03_m_lin_Massos,
		formula = mass ~ age,
		data = dino[grepl('Massos', species_factor)],
		prior = c(
			prior(normal(125, 10), Intercept),
			prior(normal(20, 5), b),
			prior(exponential(1), sigma)
		)
	),
	zar_brms(
		h04_q03_m_exp_Massos,
		formula = bf(mass ~ a * b  ^ (c * age + d),
								 a + b + c + d ~ 1,
								 nl = TRUE),
		data = dino[grepl('Massos', species_factor)],
		prior = c(
			prior(normal(0, 20), nlpar = 'a'),
			prior(normal(0, 20), nlpar = 'b'),
			prior(normal(0, 20), nlpar = 'c', lb = 0),
			prior(normal(0, 20), nlpar = 'd'),
			prior(exponential(1), sigma)
		)
	),
	zar_brms(
		h04_q03_m_wei_Massos,
		formula = bf(mass ~ a * (1 - exp(-(age / theta) ^ w)),
								 a + theta + w ~ 1,
								 nl = TRUE),
		data = dino[grepl('Massos', species_factor)],
		prior = c(
			prior(normal(0, 200), nlpar = 'a', lb = 0),
			prior(normal(0, 200), nlpar = 'theta', lb = 0),
			prior(normal(0, 200), nlpar = 'w', lb = 0),
			prior(exponential(1), sigma)
		)
	)
)


# Homework 05 -------------------------------------------------------------
targets_h05 <- c(
	tar_target(
		grants,
		data_grants()
	),
	zar_brms(
		h05_q01,
		formula = awards | trials(applications) ~ gender,
		data = grants,
		family = 'binomial',
		prior = c(
			prior(normal(0, 1), Intercept),
			prior(normal(0, 0.5), b)
		)
	),
	zar_brms(
		h05_q02,
		formula = awards | trials(applications) ~ gender * discipline,
		data = grants,
		family = 'binomial',
		prior = c(
			prior(normal(0, 1), Intercept),
			prior(normal(0, 0.5), b)
		)
	),
	tar_target(
		ufc,
		data_ufc()
	),
	zar_brms(
		h05_q03,
		formula = n_win | trials(n_fight) ~ hand_pair,
		data = ufc,
		family = 'binomial',
		prior = c(
			prior(normal(0, 1), Intercept),
			prior(normal(0, 0.5), b)
		)
	)
)




# Homework 06 -------------------------------------------------------------
targets_h06 <- c(
	tar_target(
		reedfrogs,
		data_reedfrogs()
	),
	zar_brms(
		h06_q01_exp_0pt1,
		formula = surv | trials(density) ~ (1 | tank),
		data = reedfrogs,
		family = 'binomial',
		prior = c(
			prior(normal(0, 1), Intercept),
			prior(exponential(0.1), sd)
		)
	),
	zar_brms(
		h06_q01_exp_1,
		formula = surv | trials(density) ~ (1 | tank),
		data = reedfrogs,
		family = 'binomial',
		prior = c(
			prior(normal(0, 1), Intercept),
			prior(exponential(1), sd)
		)
	),
	zar_brms(
		h06_q01_exp_10,
		formula = surv | trials(density) ~ (1 | tank),
		data = reedfrogs,
		family = 'binomial',
		prior = c(
			prior(normal(0, 1), Intercept),
			prior(exponential(10), sd)
		)
	),
	zar_brms(
		h06_q02,
		formula = surv | trials(density) ~ 1 + pred * size + (1 | tank),
		data = reedfrogs,
		family = 'binomial',
		prior = c(
			prior(normal(0, 1), Intercept),
			prior(normal(0, 1), b),
			prior(exponential(10), sd)
		)
	),
	tar_target(
		trolley,
		data_trolley()
	),
	zar_brms(
		h06_q03_ind_var,
		formula = response ~ action + intention + contact  + (1 | id),
		data = trolley,
		family = 'cumulative',
		prior = c(
			prior(normal(0, 1), Intercept),
			prior(normal(0, 1), b),
			prior(exponential(1), sd)
		),
		cores = 30

	),
	zar_brms(
		h06_q03_no_ind_var,
		formula = response ~ action + intention + contact,
		data = trolley,
		family = 'cumulative',
		prior = c(
			prior(normal(0, 1), Intercept),
			prior(normal(0, 1), b)
		)
	)
)

# Lecture 19 --------------------------------------------------------------
targets_lecture_19 <- c(
	tar_target(
		m_l19_nl_howell,
		brm(
			bf(
				scale_weight_div_mean ~ log(k * 3.1415 * p ^ 2 * scale_height_div_mean ^ 3),
				p ~ 1,
				k ~ 1,
				nl = TRUE),
			prior = c(
				prior(beta(25, 50), nlpar = p, lb = 0, ub = 1),
				prior(exponential(0.5), nlpar = k, lb = 0),
				prior(exponential(1), class = sigma)
			),
			data = data_Howell(),
			family = 'lognormal'
		)
	),
	tar_target(
		m_l19_nl_howell_no_dim,
		brm(
			bf(
				scale_weight_div_mean ~ log(scale_height_div_mean ^ 3)),
			prior = c(
				prior(exponential(1), class = sigma)
			),
			data = data_Howell(),
			family = 'lognormal'
		)
	)
)

# Targets: all ------------------------------------------------------------
# Automatically grab all the "targets_*" lists above
lapply(grep('targets', ls(), value = TRUE), get)
