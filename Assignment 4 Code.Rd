library(ggplot2)
library(dplyr)
library(ggpubr)
Orchard <- read.csv(file.choose())
plot_theme <- theme_minimal() +
	theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
		panel.background = element_blank(), axis.line = element_line(colour = "black"))
plot1 <- ggplot(Orchard, aes(Collection.Date, E)) +
	ylab("Transpiration (E) (mol m^-2 s^-1)") +
	geom_boxplot(aes(colour = Subspecies)) + 
	plot_theme

plot2 <- ggplot(Orchard, aes(Collection.Date, A)) +
	ylab("Photosynthetic Rate (A) (umol m^-2 s^-1)") +
		geom_boxplot(aes(colour = Subspecies)) +
		plot_theme

panel_plot <- ggarrange(plot1, plot2, 
			ncol = 2, 
			nrow = 1,
			widths = 1,
			heights = 1, 
			common.legend = FALSE,
			legend = 'bottom')

