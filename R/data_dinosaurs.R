data_dinosaurs <- function() {
	data("Dinosaurs")
	setDT(Dinosaurs)

	Dinosaurs[, scale_age := scale(age)]
	Dinosaurs[, scale_mass := scale(mass)]
	Dinosaurs[, species_factor := factor(species)]

	return(Dinosaurs)
}
