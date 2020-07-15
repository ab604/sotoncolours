## ----setup, echo = FALSE, message = FALSE-------------------------------------
knitr::opts_chunk$set(fig.width = 7, 
                      echo = FALSE, 
                      warning = FALSE, 
                      message=FALSE)

## ----set-up, echo=TRUE--------------------------------------------------------
library(tidyverse)
library(sotoncolours)
library(dichromat)
library(colorspace)
library(palmerpenguins)
library(raster)
library(patchwork)

## ----install, eval=FALSE, echo=TRUE-------------------------------------------
#  devtools::install_github("ab604/sotoncolours", build_vignettes = TRUE)

## ----colours, echo=TRUE-------------------------------------------------------
# Names of the colours
names(uos_cols())

## ----palettes, echo=TRUE------------------------------------------------------
# See names of all palettes
names(uos_palettes)

## ----palette-colour, echo=TRUE------------------------------------------------
# See names of all palettes
names(uos_palettes$contrast1)

## ----see-palettes, fig.height = 8---------------------------------------------
pal_names <- names(uos_palettes)
par(mfrow=c(length(uos_palettes)/2, 2), lheight = 2, mar=rep(1, 4), adj = 0)
for (i in 1:length(uos_palettes)){
    viz_palette(uos_palettes[[i]], pal_names[i])
}

## ----dichromate_deat, fig.height = 5------------------------------------------
par(mfrow=c(length(uos_palettes)/2, 2), lheight = 2, mar=rep(1, 4), adj = 0)
for (i in 1:length(uos_palettes)){
    viz_palette(dichromat(uos_palettes[[i]], "deutan"), pal_names[i])
}

## ----dichromate_protan, fig.height = 5----------------------------------------
par(mfrow=c(length(uos_palettes)/2, 2), lheight = 2, mar=rep(1, 4), adj = 0)
for (i in 1:length(uos_palettes)){
    viz_palette(dichromat(uos_palettes[[i]], "protan"), pal_names[i])
}

## ----dichromate_tritan, fig.height = 5----------------------------------------
par(mfrow=c(length(uos_palettes)/2, 2), lheight = 2, mar=rep(1, 4), adj = 0)
for (i in 1:length(uos_palettes)){
    viz_palette(dichromat(uos_palettes[[i]], "tritan"), pal_names[i])
}

## ----desaturate, fig.height = 5-----------------------------------------------
par(mfrow=c(length(uos_palettes)/2, 2), lheight = 2, mar=rep(1, 4), adj = 0)
for (i in 1:length(uos_palettes)){
    viz_palette(desaturate(uos_palettes[[i]]), pal_names[i])
}

## ---- echo=TRUE---------------------------------------------------------------
ggplot(mtcars, aes(hp, mpg)) +
    geom_point(color = uos_cols("horizon5"),
               size = 4, alpha = .8)

## ----mtcars, echo = TRUE, message = FALSE-------------------------------------
# Use the marine palette for colours
p1 <- ggplot(mtcars, aes(mpg, wt)) + 
   geom_point(aes(colour = factor(cyl)), size=2, alpha=0.7) + 
   scale_colour_uos(palette="marine") +
    theme_bw() + 
    theme(aspect.ratio=1, legend.position="bottom")

# Use the horizon palette for colours
p2 <- ggplot(data = mpg) + 
   geom_point(mapping = aes(x = displ, y = hwy, color = class), alpha=0.7) +
   scale_colour_uos(palette="horizon") +
    theme_bw() + 
    theme(aspect.ratio=1, legend.position="bottom")

p1 + p2

## ----diamonds, echo=TRUE, message=FALSE---------------------------------------
 ggplot(diamonds) + 
  geom_bar(aes(x = cut, fill = clarity)) +
  scale_fill_uos() +  # defaults to marine
  theme_bw() 

## ----maps, echo=TRUE, message=FALSE-------------------------------------------
# Create a new vector of colours to pass to scale_colour manual
# Use unname() to get hex codes from uos_cols()
my_cols <- unname(uos_cols()[c('black','shamrock','horizon4')])

ggplot(data = penguins, aes(x = species, y = flipper_length_mm)) +
  geom_boxplot(aes(color = species), width = 0.3, show.legend = FALSE) +
  geom_jitter(aes(color = species), alpha = 0.7, show.legend = FALSE, 
              position = position_jitter(width = 0.2, seed = 0)) +
  scale_colour_manual(values = my_cols) + # pass my_cols to scale_colour_manual
  theme_minimal() +
  labs(x = "Species",
       y = "Flipper length (mm)")

## ----base-plot, echo=TRUE-----------------------------------------------------
pal <- colorRampPalette(uos_palettes[["horizon"]])
image(volcano, col = pal(20))

## ----base-plot-2, echo=TRUE---------------------------------------------------
# Create new palette
my_cols <- unname(uos_cols()[c('marine1','shamrock','horizon3')])

pal <- colorRampPalette(my_cols)
image(volcano, col = pal(20))

