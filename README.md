# ggsegBrodmann

<!-- badges: start -->
[![R-CMD-check](https://github.com/ggsegverse/ggsegBrodmann/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ggsegverse/ggsegBrodmann/actions/workflows/R-CMD-check.yaml)
[![r-universe](https://ggsegverse.r-universe.dev/badges/ggsegBrodmann)](https://ggsegverse.r-universe.dev/ggsegBrodmann)
<!-- badges: end -->

Brodmann Areas Atlas for the ggsegverse Ecosystem.

## Installation

``` r
# From r-universe
install.packages("ggsegBrodmann", repos = "https://ggsegverse.r-universe.dev")

# From GitHub
# install.packages("remotes")
remotes::install_github("ggsegverse/ggsegBrodmann")
```

## Usage

``` r
library(ggsegBrodmann)
library(ggseg)

plot(brodmann()) +
  theme_brain()
```

## Atlas

### brodmann

Brodmann areas cortical parcellation with 39 regions per hemisphere (Brodmann, 1909; Pijnenburg et al., 2021).

![brodmann](man/figures/brodmann_snapshot.png)
