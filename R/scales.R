#' uos palette with ramped colours
#'
#' @param palette Choose from 'uos_palettes' list
#' 
#' @param alpha transparency
#'
#' @param reverse If TRUE, the direction of the colours is reversed.
#'
#' @examples
#' \dontrun{
#' library(scales)
#' show_col(uos_pal()(10))
#'
#' filled.contour(volcano,color.palette = uos_pal(), asp=1)
#' }
#'#' @export
uos_pal <- function(palette="marine", alpha = 1, reverse = FALSE) {
  pal <- uos_palettes[[palette]]
  if (reverse){
    pal <- rev(pal)
  }
  return(colorRampPalette(pal, alpha))
}

#' Setup colour palette for ggplot2
#' 
#' @rdname scale_color_uos
#'
#' @param palette Choose from 'uos_palettes' list
#' 
#' @param reverse logical, Reverse the order of the colours?
#' 
#' @param alpha transparency
#' 
#' @param discrete whether to use a discrete colour palette
#' 
#' @param ... additional arguments to pass to scale_color_gradientn
#'  
#' @inheritParams viridis::scale_color_viridis
#'
#' @importFrom ggplot2 scale_colour_manual
#'
#' @examples 
#' \dontrun{
#' library(tidyverse)
#' ggplot(mtcars, aes(mpg, wt)) + 
#'   geom_point(aes(colour = factor(cyl))) +     
#'   scale_colour_uos(palette="marine")
#' ggplot(mtcars, aes(mpg, wt)) + 
#'   geom_point(aes(colour = hp)) +     
#'   scale_colour_uos(palette="horizon", discrete = FALSE)
#' ggplot(data = mpg) + 
#'   geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
#'   scale_colour_uos(palette="marine")
#' ggplot(diamonds) + geom_bar(aes(x = cut, fill = clarity)) +
#'   scale_fill_uos()
#'   }
#' @export
#' 
#' @importFrom ggplot2 discrete_scale scale_color_gradientn
scale_color_uos <- function(..., palette="marine", 
                              discrete = TRUE, alpha = 1, reverse = FALSE) {
  if (discrete) {
    discrete_scale("colour", "marine", palette=uos_pal(palette, alpha = alpha, reverse = reverse))
  } else {
    scale_color_gradientn(colours = uos_pal(palette, alpha = alpha, reverse = reverse, ...)(256))
  }
}
#' @rdname scale_color_uos
#' @export
scale_colour_uos <- scale_color_uos


#' #' Setup fill palette for ggplot2
#'
#' @param palette Choose from 'uos_palettes' list
#' 
#' @inheritParams viridis::scale_fill_viridis
#' @inheritParams uos_pal
#' 
#' @param discrete whether to use a discrete colour palette
#' 
#' @param ... additional arguments to pass to scale_color_gradientn
#'
#' @importFrom ggplot2 scale_fill_manual discrete_scale scale_fill_gradientn
#'
#' @export
scale_fill_uos <- function(..., palette="marine", 
                             discrete = TRUE, alpha=1, reverse = TRUE) {
  if (discrete) {
    discrete_scale("fill", "marine", palette=uos_pal(palette, alpha = alpha, reverse = reverse))
  } else {
    scale_fill_gradientn(colours = ochre_pal(palette, alpha = alpha, reverse = reverse, ...)(256))
  }
}
