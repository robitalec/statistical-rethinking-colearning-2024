data_Oxboys <- function() {
	if (!'rethinking' %in% .packages()) {
		stop('please load the rethinking package')
	}
	if (!'data.table' %in% .packages()) {
		stop('please load the data.table package')
	}

	data("Oxboys")
	DT <- data.table::data.table(Oxboys)

	DT[, diff_height := height - shift(height), by = Subject]

	DT[, occasion_factor := factor(Occasion)]

	return(DT)
}
