data_marriage <- function() {
	d <- sim_happiness(seed = 1977, N_years = 1000)
	d2 <- d[d$age > 17,]
	d2$A <- (d2$age - 18) / (65 - 18)
	d2$mid <- d2$married + 1
	return(d2)
}
