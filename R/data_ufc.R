data_ufc <- function() {
	data("UFClefties")

	DT <- data.table(UFClefties)

	DT[, hand_1 := c('L', 'R')[fighter1.lefty + 1]]
	DT[, hand_2 := c('L', 'R')[fighter2.lefty + 1]]
	DT[, hand_pair := factor(paste(hand_1, hand_2, sep = '-'))]

	DT[, .(n_fight = .N, n_win = sum(fighter1.win)), by = hand_pair]
}
