context("ulimit")

test_that("Memory limits can be read", {
  l <- memory_limit()
  expect_true(is.numeric(l))
  expect_equal(names(l), c("soft", "hard"))
})

test_that("Memory limits can be set", {
  l <- memory_limit()
  on.exit(memory_limit(l[["soft"]]), add = TRUE)
  memory_limit(256)
  new_l <- memory_limit()
  expect_equal(new_l[["soft"]], 256)
  expect_equal(new_l[["hard"]], l[["hard"]])
})

test_that("Memory limits are respected", {
  skip_on_cran()
  l <- memory_limit()
  on.exit(memory_limit(l[["soft"]]), add = TRUE)
  memory_limit(256)
  expect_equal(length(1:100000), 100000)
  expect_error(length(1:100000000), "allocate")
})
