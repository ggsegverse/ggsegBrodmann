
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggsegBrodmann <img src='man/figures/logo.png' align="right" height="138.5" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/ggsegverse/ggsegBrodmann/workflows/R-CMD-check/badge.svg)](https://github.com/ggsegverse/ggsegBrodmann/actions)
[![DOI](https://zenodo.org/badge/424723872.svg)](https://zenodo.org/badge/latestdoi/424723872)

<!-- badges: end -->

This package contains dataset for plotting the
[brodmann](https://digital.zbmed.de/zbmed/id/554966?) atlas ggseg and
ggseg3d, based on the supplementary materials of Pijnenburg et al.,
NeuroImage, 239, 2021
[DOI](https://doi.org/10.1016/j.neuroimage.2021.118274); Version 1;
15-01-2021.

To learn how to use these atlases, please look at the documentation for
[ggseg](https://ggsegverse.github.io/ggseg/) and
[ggseg3d](https://ggsegverse.github.io/ggseg3d)

## Installation

We recommend installing the ggseg-atlases through the ggseg
[r-universe](https://ggsegverse.r-universe.dev/ui#builds):

``` r
# Enable this universe
options(repos = c(
    ggsegverse = 'https://ggsegverse.r-universe.dev',
    CRAN = 'https://cloud.r-project.org'))

# Install some packages
install.packages('ggsegBrodmann')
```

You can install the released version of ggsegBrodmann from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("ggsegverse/ggsegBrodmann")
```

``` r
library(ggseg)
#> Warning: package 'ggseg' was built under R version 4.1.1
#> Loading required package: ggplot2
library(ggseg3d)
library(ggsegBrodmann)

plot(brodmann) +
  theme(legend.position = "bottom", 
        legend.text = element_text(size = 9)) +
  guides(fill = guide_legend(ncol = 6))
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

``` r
library(dplyr)
ggseg3d(atlas = brodmann_3d) %>% 
  add_glassbrain() %>% 
  pan_camera("right lateral")
```

<img src="man/figures/README-3d-plot.png" width="100%" />

## Source annotation files

The FreeSurfer annotation files (`lh.fsaverage_Brodmann.annot`,
`rh.fsaverage_Brodmann.annot`) in `data-raw/` are from the supplementary
materials of Pijnenburg et al. (2021), extracted from `Brodmann.zip`.
These are in fsaverage space (163k vertices) and require resampling to
fsaverage5 via `mri_surf2surf` before use with the ggsegExtra pipeline.

FreeSurfer also ships `lh.PALS_B12_Brodmann.annot` and
`rh.PALS_B12_Brodmann.annot` in `$FREESURFER_HOME/subjects/fsaverage/label/`
as an alternative Brodmann parcellation.

Source: <http://www.dutchconnectomelab.nl/>

Reference: Pijnenburg R, Scholtens LH, Ardesch DJ, de Lange SC, Wei Y,
van den Heuvel MP (2021). Myelo- and cytoarchitectonic microstructural and
functional human cortical atlases reconstructed in common MRI space.
*NeuroImage*, 239, 118274.
doi:[10.1016/j.neuroimage.2021.118274](https://doi.org/10.1016/j.neuroimage.2021.118274)

Please note that the 'ggsegBrodmann' project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
