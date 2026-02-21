# Changelog

## ggsegBrodmann 2.0.0

### Breaking changes

- `brodmann` is now a `ggseg_atlas` object (from ggseg.formats)
  containing both 2D and 3D data. The separate `brodmann_3d` object has
  been removed.

- Use `ggplot() + ggseg::geom_brain(atlas = brodmann)` for 2D plots and
  `ggseg3d::ggseg3d(atlas = brodmann)` for 3D plots – both from the same
  object.

- `ggseg.formats` is now a hard dependency (in Depends).

- Package URLs updated from `LCBC-UiO` to `ggseg` GitHub organisation.
