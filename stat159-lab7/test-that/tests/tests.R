# load the source code of the functions to be tested
source("../functions/range-value.R")
source("../functions/missing-values.R")
source("../functions/center-measures.R")
source("../functions/spread-measures.R")
source("../functions/descriptive-stats.R")

# context with one test that groups expectations
context("Test for range value")

test_that("range works as expected", {
    x <- c(1, 2, 3, 4, 5)
    expect_equal(range_value(x), 4)
    expect_length(range_value(x), 1)
    expect_type(range_value(x), 'double')
    
    y <- c(1, 2, 3, 4, NA)
    expect_equal(range_value(y,TRUE), 3)
    expect_length(range_value(y,TRUE), 1)
    
    expect_equal(range_value(y), NA_real_)
    expect_length(range_value(y), 1)
    
    z <- c(TRUE, FALSE, TRUE)
    expect_equal(range_value(z), 1L)
    expect_length(range_value(z), 1)
    expect_type(range_value(z), 'integer')
    w <- letters[1:5]
    expect_error(range_value(w))
    
    
})

context("Test for missing value")
test_that("missing value function works as expected", {
  x <- c(1, 2, 3, 4, 5, NA)
  expect_gte(missing_values(x), 0)
  expect_length(missing_values(x), 1)
  expect_type(missing_values(x), 'integer')
  
})

context("Test for center value")
test_that("center measures function works as expected", {
  x <- c(1, 2, 3, 4, 5)

  expect_length(center_measures(x), 2)
  expect_type(center_measures(x), 'double')
  expect_equal(center_measures(x), c(3,3))
  
})

context("Test for spread value")
test_that("spread measures function works as expected", {
  x <- c(1, 2, 3, 4, 5)

  expect_length(spread_measures(x), 4)
  expect_type(spread_measures(x), 'double')
  expect_equal(spread_measures(x), c(c(1,5),2,sd(x)))
})


context("Test for descriptive stats")
test_that("descriptive stats function works as expected", {
  x <- c(1, 2, 3, 4, 5)
  
  expect_length(descriptive_stats(x), 7)

  expect_equal(descriptive_stats(x), 
               c(3,3,c(1,5),2,sd(x), 0))
  
  y <- c(1, 2, 3, 4, NA)
  expect_length(descriptive_stats(y,TRUE), 7)
  expect_equal(descriptive_stats(y,TRUE), 
               c(2.5,2.5,1,4,1.5,sd(y,na.rm = TRUE), 
                 missing_values(y)))
  expect_error(descriptive_stats(y))
})

