#' University of Southampton colour palettes
#' A.Bailey 2020-07-10
#' 
#' A collection of colour palettes using the University of Southampton colour
#' scheme. The list of available palettes is:
#' neutral
#' marine
#' horizon
#' contrast1
#' contrast2
#' contrast3
#' 
#' @examples 
#' \dontrun{
#' #' # Make an x-y plot using the marine palette
#' library(tidyverse)
#' df <- data.frame(x = rnorm(100, 0, 20), 
#'           y = rnorm(100, 0, 20), 
#'           cl = sample(letters[1:8], 100, replace=TRUE))
#' ggplot(df, aes(x, y, colour=cl, shape=cl)) + 
#'   geom_point(size=4) + scale_colour_uos() +
#'   theme_bw() + theme(aspect.ratio=1) 
#' }
#' @export
#' Make a named list of University of Southampton brand colours 
uos_colours <- c(
  # Rich-Black, Neutral-1, 
  # Neutral-2, Neutral-3
  'black' = "#00131D",
  'neutral1' = "#495961",
  'neutral2' = "#758D9A",
  'neutral3' = "#9FB1BD",
  'neutral4' = "#E1E8EC",
  # Marine-1, Marine-2, Marine-3, 
  # Marine-5, Marine-4, Marine-6
  'marine1' = "#005C84",
  'marine2' = "#74C9E5",
  'marine3' = "#3CBAC6", 
  'marine4' = "#B3DBD2",
  'marine5' = "#4BB694",
  'marine6' = "#C1D100",
  # Horizon-1,Horizon-2, Horizon-3,
  # Horizon-4, Horizon-5
  'horizon1' = "#FCBC00",
  'horizon2' = "#EF7D00",
  'horizon3' = "#E73037",
  'horizon4' = "#D5007F",
  'horizon5' = "#8D3970",
  # Web
  'prussian' = "#002E3B",
  'shamrock' = "#1E8765",
  'coral' = "#E73238"
)

#' Function to extract uos_colours as hex codes
#'
#' @param ... Character names of uos_colours 
#'
uos_cols <- function(...) {
  cols <- c(...)
  
  if (is.null(cols))
    return (uos_colours)
  
  uos_colours[cols]
}

#' Construct some palettes
#' @export
uos_palettes <- list(
  marine = uos_cols('marine1','marine2','marine3',
                      'marine4','marine5','marine6'),
  horizon = uos_cols('horizon1','horizon2','horizon3',
                       'horizon4','horizon5'),
  neutral = uos_cols('black','neutral1','neutral2','neutral3','neutral4'),
  web = uos_cols('prussian','shamrock','coral'),
  contrast1 = uos_cols('marine1','horizon3','horizon2','neutral2'),
  contrast2 = uos_cols('neutral1','neutral3','horizon3'),
  contrast3 = uos_cols('neutral1','horizon1','horizon3')
)

