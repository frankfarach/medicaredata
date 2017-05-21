library(medicaredata)
context("Getting data")

test_that("URL concatenation is valid", {
  expect_equal(build_url("rbry-mqwu.json"),
               "https://data.medicare.gov/resource/rbry-mqwu.json")
})
