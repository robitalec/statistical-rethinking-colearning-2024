#' Globe Tossing: count the number of ways to produce the sample
#'
#' @param w number of water observations
#' @param l number of land observations
#' @param seq_prop seq of possible proportions
#'
#' @return
#' @export
#'
#' @examples
globe_toss_n_ways <- function(w, l, seq_prop) {
	ways_formula <- function(w, l, prop) {
		(prop * 4) ^ w  * ((1 - prop) * 4) ^ l
	}

	vapply(seq_prop, function(p) {
		ways_formula(w, l, p)
	},  FUN.VALUE = 42)
}
