#' Brodmann Areas Atlas
#'
#' Brain atlas for the Brodmann areas cortical parcellation
#' with 39 regions per hemisphere. Contains both 2D polygon geometry
#' for [ggseg::geom_brain()] and 3D vertex indices for [ggseg3d::ggseg3d()].
#'
#' @family ggseg_atlases
#'
#' @references Brodmann K (1909). Vergleichende Lokalisationslehre der
#'   Grosshirnrinde. Leipzig: Johann Ambrosius Barth.
#'   Pijnenburg R, et al. (2021). *NeuroImage*, 239, 118274.
#'   \doi{10.1016/j.neuroimage.2021.118274}
#'
#' @return A [ggseg.formats::ggseg_atlas] object (cortical).
#' @import ggseg.formats
#' @export
#' @examples
#' brodmann()
brodmann <- function() .brodmann
