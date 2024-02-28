reverse_scale <- function(x, scale_attr) {
	x * scale_attr$`scaled:scale` + scale_attr$`scaled:center`
}
