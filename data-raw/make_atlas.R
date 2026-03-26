# Create Brodmann Cortical Atlas
#
# Recreates the brodmann cortical atlas from the Pijnenburg et al. (2021)
# fsaverage annotation files using ggseg.extra vertex projection pipeline.
#
# The .annot files are in fsaverage space (163k vertices) and are resampled
# to fsaverage5 (10k) via mri_surf2surf_rereg() before atlas creation.
#
# Source: http://www.dutchconnectomelab.nl/
# Reference: Pijnenburg et al. (2021) NeuroImage 239:118274
#
# Requirements:
#   - FreeSurfer installed with fsaverage subject
#   - ggseg.extra (>= 2.0.0.9000)
#   - ggseg.formats
#
# Run with: Rscript data-raw/make_atlas.R

library(ggseg.extra)
library(ggseg.formats)

Sys.setenv(FREESURFER_HOME = "/Applications/freesurfer/7.4.1")

# -- Resample fsaverage -> fsaverage5 -----------------------------------------
annot_name <- "fsaverage_Brodmann"
src_annot_files <- here::here(
  "data-raw",
  c(paste0("lh.", annot_name, ".annot"), paste0("rh.", annot_name, ".annot"))
)

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
  if (file.exists(out_file)) next
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
brodmann <- create_cortical_from_annotation(
  input_annot = annot_files,
  atlas_name = "brodmann",
  output_dir = "data-raw",
  tolerance = 0,
  skip_existing = TRUE,
  cleanup = FALSE
) |>
  atlas_region_contextual("unknown", "label")

print(brodmann)
plot(brodmann)

.brodmann <- brodmann
usethis::use_data(.brodmann, overwrite = TRUE, compress = "xz", internal = TRUE)
