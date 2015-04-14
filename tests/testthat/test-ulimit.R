context("ulimit")

test_that("Memory limits can be read", {
  l <- memory_limit()
  expect_true(is.numeric(l))
  expect_equal(names(l), c("soft", "hard"))
})

test_that("Memory limits can be set", {
  l <- memory_limit()
  on.exit(memory_limit(l[["soft"]]), add = TRUE)
  memory_limit(1)
  new_l <- memory_limit()
  expect_equal(new_l[["soft"]], 1)
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

test_that("Memory limits below zero and infinity can be set", {
  skip_on_cran()
  l <- memory_limit()
  on.exit(memory_limit(l[["soft"]]), add = TRUE)
  memory_limit(-10)
  new_l <- memory_limit()
  expect_equal(new_l[["soft"]], 0)
  memory_limit(Inf)
  new_l <- memory_limit()
  expect_equal(new_l[["soft"]], Inf)
})
