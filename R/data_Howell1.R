data_Howell <- function() {
	if (!'rethinking' %in% .packages()) {
		stop('please load the rethinking package')
	}
	if (!'data.table' %in% .packages()) {
		stop('please load the data.table package')
	}

	data(Howell1)
	DT <- data.table::data.table(Howell1)
	DT[, sex := .GRP, by = male]

	DT[, scale_height := scale(height)]
	DT[, scale_weight := scale(weight)]

	DT[, scale_height_div_mean := height / mean(height)]
	DT[, scale_weight_div_mean := weight / mean(weight)]

	return(DT)
}
