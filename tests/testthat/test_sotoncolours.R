## Some simple tests for 'sotoncolours'

## Check that every palette has a name (otherwise, stuff doesn't work)
expect_true(
  all(nchar(names(uos_palettes)))
)

## This should just not fail (not sure how to test that??)
viz_palette(uos_palettes$marine)
