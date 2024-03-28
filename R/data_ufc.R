data_ufc <- function() {
	data("UFClefties")

	DT <- data.table(UFClefties)

	DT[, .(n_fight = .N, n_win = sum(fighter1.win)),
		 by = .(id = factor(fighter1), is_lefty = factor(fighter1.lefty))]

}
