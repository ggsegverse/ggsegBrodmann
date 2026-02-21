# Create Brodmann Cortical Atlas
#
# Recreates the brodmann cortical atlas from the Pijnenburg et al. (2021)
# fsaverage annotation files using ggseg.extra.
#
# The .annot files are in fsaverage space (163k vertices) and are resampled
# to fsaverage5 (10k) via mri_surf2surf_rereg() before atlas creation.
#
# Source: http://www.dutchconnectomelab.nl/
# Reference: Pijnenburg et al. (2021) NeuroImage 239:118274
#
# Requirements:
#   - FreeSurfer installed with fsaverage subject
#   - ggseg.extra package
#   - ggseg.formats package
#
# Run with: Rscript data-raw/make_atlas.R

library(dplyr)
library(ggseg.extra)
library(ggseg.formats)

options(freesurfer.verbose = FALSE)
options(chromote.timeout = 120)
future::plan(future::sequential)
progressr::handlers("cli")
progressr::handlers(global = TRUE)

# -- Locate source files (fsaverage space) ------------------------------------
annot_name <- "fsaverage_Brodmann"
src_annot_files <- here::here(
  "data-raw",
  c(paste0("lh.", annot_name, ".annot"), paste0("rh.", annot_name, ".annot"))
)

for (f in src_annot_files) {
  if (!file.exists(f)) {
    cli::cli_abort("Annotation not found: {.path {f}}")
  }
}

# -- Resample fsaverage -> fsaverage5 -----------------------------------------
cli::cli_h2("Resampling annotations to fsaverage5")

resample_dir <- here::here("data-raw", "fsaverage5")
dir.create(resample_dir, showWarnings = FALSE, recursive = TRUE)

fs_dir <- freesurfer::fs_subj_dir()
local_subj <- here::here("data-raw", "subjects")

setup_local_subjects_dir <- function(local_subj, fs_dir) {
  for (subj in c("fsaverage", "fsaverage5")) {
    for (subdir in c("surf", "label")) {
      dir.create(file.path(local_subj, subj, subdir),
                 recursive = TRUE, showWarnings = FALSE)
    }
    surf_files <- list.files(file.path(fs_dir, subj, "surf"), full.names = TRUE)
    for (sf in surf_files) {
      dst <- file.path(local_subj, subj, "surf", basename(sf))
      if (!file.exists(dst)) file.symlink(sf, dst)
    }
  }
}

setup_local_subjects_dir(local_subj, fs_dir)
file.copy(src_annot_files,
          file.path(local_subj, "fsaverage", "label"),
          overwrite = FALSE)

old_sd <- Sys.getenv("SUBJECTS_DIR")
Sys.setenv(SUBJECTS_DIR = local_subj)

for (hemi in c("lh", "rh")) {
  out_file <- file.path(resample_dir, paste0(hemi, ".", annot_name, ".annot"))
  if (file.exists(out_file)) {
    cli::cli_alert_info("Resampled {.val {hemi}} already exists, skipping")
    next
  }
  mri_surf2surf_rereg(
    subject = "fsaverage",
    annot = annot_name,
    hemi = hemi,
    output_dir = resample_dir
  )
}

Sys.setenv(SUBJECTS_DIR = old_sd)

annot_files <- list.files(resample_dir, "\\.annot$", full.names = TRUE)

# -- Create atlas -------------------------------------------------------------
cli::cli_h1("Creating brodmann cortical atlas")

atlas_raw <- create_cortical_from_annotation(
  input_annot = annot_files,
  atlas_name = "brodmann",
  output_dir = "data-raw",
  tolerance = 1,
  smoothness = 2,
  skip_existing = TRUE,
  cleanup = FALSE
)

# -- Post-processing ----------------------------------------------------------
atlas_raw <- atlas_raw |>
  atlas_region_contextual("unknown", "label")

# -- Inspect and save ---------------------------------------------------------
brodmann <- atlas_raw

cli::cli_alert_success("Atlas created with {nrow(brodmann$core)} regions")
print(brodmann)

brain_pals <- stats::setNames(
  list(brodmann$palette),
  brodmann$atlas
)
save(brain_pals, file = here::here("R/sysdata.rda"), compress = "xz")

usethis::use_data(brodmann, overwrite = TRUE, compress = "xz")
cli::cli_alert_success("Saved to data/brodmann.rda")
