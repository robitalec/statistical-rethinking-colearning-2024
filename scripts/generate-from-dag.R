library(dagitty)
library(ggplot2)
library(patchwork)
library(equatiomatic)
library(latex2exp)

g <- dagitty(
	'dag{
		y -> z [beta=0.2]
		x <- y [beta=0.3]
		x <- z [beta=-0.6]
	}'
)

plot(g)

n <- 100
DT <- simulateSEM(g, N = n)


plot_lm_with_eq <- function(DT, x, y) {
	m <- lm(reformulate(x, response = y), data = DT)
	eq <- extract_eq(m, use_coefs = TRUE, raw_tex = TRUE, ital_vars = TRUE)

	ggplot(DT, aes(.data[[x]], .data[[y]])) +
		geom_point() +
		geom_smooth(method = 'lm') +
		labs(title = TeX(eq))
}


plot_lm_with_eq(DT, 'x', 'y') /
	plot_lm_with_eq(DT, 'y', 'z') /
	plot_lm_with_eq(DT, 'x', 'z')
