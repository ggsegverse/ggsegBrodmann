# Brodmann Areas Atlas

Brain atlas for the Brodmann areas cortical parcellation with 39 regions
per hemisphere. Contains both 2D polygon geometry for
[`ggseg::geom_brain()`](https://ggsegverse.github.io/ggseg/reference/ggbrain.html)
and 3D vertex indices for
[`ggseg3d::ggseg3d()`](https://lcbc-uio.github.io/ggseg3d//reference/ggseg3d.html).

## Usage

``` r
brodmann()
```

## Value

A
[ggseg.formats::ggseg_atlas](https://ggsegverse.github.io/ggseg.formats/reference/ggseg_atlas.html)
object (cortical).

## References

Brodmann K (1909). Vergleichende Lokalisationslehre der Grosshirnrinde.
Leipzig: Johann Ambrosius Barth. Pijnenburg R, et al. (2021).
*NeuroImage*, 239, 118274.
[doi:10.1016/j.neuroimage.2021.118274](https://doi.org/10.1016/j.neuroimage.2021.118274)

## Examples

``` r
brodmann()
#> 
#> ── brodmann ggseg atlas ────────────────────────────────────────────────────────
#> Type: cortical
#> Regions: 39
#> Hemispheres: left, right
#> Views: inferior, lateral, medial, superior
#> Palette: ✔
#> Rendering: ✔ ggseg
#> ✔ ggseg3d (vertices)
#> ────────────────────────────────────────────────────────────────────────────────
#> # A tibble: 78 × 3
#>    hemi  region     label        
#>    <chr> <chr>      <chr>        
#>  1 left  BA1_3      lh_BA1_3     
#>  2 left  BA2        lh_BA2       
#>  3 left  BA4        lh_BA4       
#>  4 left  BA5        lh_BA5       
#>  5 left  BA6        lh_BA6       
#>  6 left  BA7        lh_BA7       
#>  7 left  BA8        lh_BA8       
#>  8 left  BA9        lh_BA9       
#>  9 left  BA10       lh_BA10      
#> 10 left  BA11       lh_BA11      
#> 11 left  BA13       lh_BA13      
#> 12 left  BA16       lh_BA16      
#> 13 left  BA17       lh_BA17      
#> 14 left  BA18       lh_BA18      
#> 15 left  BA19       lh_BA19      
#> 16 left  BA20       lh_BA20      
#> 17 left  BA21       lh_BA21      
#> 18 left  BA22       lh_BA22      
#> 19 left  BA23       lh_BA23      
#> 20 left  BA24       lh_BA24      
#> 21 left  BA25       lh_BA25      
#> 22 left  BA26_29_30 lh_BA26_29_30
#> 23 left  BA27       lh_BA27      
#> 24 left  BA28       lh_BA28      
#> 25 left  BA31       lh_BA31      
#> 26 left  BA32       lh_BA32      
#> 27 left  BA33       lh_BA33      
#> 28 left  BA34       lh_BA34      
#> 29 left  BA35_36    lh_BA35_36   
#> 30 left  BA37       lh_BA37      
#> 31 left  BA38       lh_BA38      
#> 32 left  BA39       lh_BA39      
#> 33 left  BA40       lh_BA40      
#> 34 left  BA41_42_52 lh_BA41_42_52
#> 35 left  BA43       lh_BA43      
#> 36 left  BA44       lh_BA44      
#> 37 left  BA45       lh_BA45      
#> 38 left  BA46       lh_BA46      
#> 39 left  BA47       lh_BA47      
#> 40 right BA1_3      rh_BA1_3     
#> 41 right BA2        rh_BA2       
#> 42 right BA4        rh_BA4       
#> 43 right BA5        rh_BA5       
#> 44 right BA6        rh_BA6       
#> 45 right BA7        rh_BA7       
#> 46 right BA8        rh_BA8       
#> 47 right BA9        rh_BA9       
#> 48 right BA10       rh_BA10      
#> 49 right BA11       rh_BA11      
#> 50 right BA13       rh_BA13      
#> 51 right BA16       rh_BA16      
#> 52 right BA17       rh_BA17      
#> 53 right BA18       rh_BA18      
#> 54 right BA19       rh_BA19      
#> 55 right BA20       rh_BA20      
#> 56 right BA21       rh_BA21      
#> 57 right BA22       rh_BA22      
#> 58 right BA23       rh_BA23      
#> 59 right BA24       rh_BA24      
#> 60 right BA25       rh_BA25      
#> 61 right BA26_29_30 rh_BA26_29_30
#> 62 right BA27       rh_BA27      
#> 63 right BA28       rh_BA28      
#> 64 right BA31       rh_BA31      
#> 65 right BA32       rh_BA32      
#> 66 right BA33       rh_BA33      
#> 67 right BA34       rh_BA34      
#> 68 right BA35_36    rh_BA35_36   
#> 69 right BA37       rh_BA37      
#> 70 right BA38       rh_BA38      
#> 71 right BA39       rh_BA39      
#> 72 right BA40       rh_BA40      
#> 73 right BA41_42_52 rh_BA41_42_52
#> 74 right BA43       rh_BA43      
#> 75 right BA44       rh_BA44      
#> 76 right BA45       rh_BA45      
#> 77 right BA46       rh_BA46      
#> 78 right BA47       rh_BA47      
```
