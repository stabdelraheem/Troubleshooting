install.packages("reprex")
library(reprex)

reprex({
  library(palmerpenguins)
  body_condition <- resid(lm(body_mass_g - flipper_length_mm, penguins))
  summary(body_condition)
})

# Small and simple outputs
# No extraneous packages
# No unnecessary function calls

# A full example of a workflow...

reprex({
  # Load some packages
  library(lubridate)
  library(nlme)
  library(palmerpenguins)
  library(tidyverse)
  
  # Define some functions
  
  # Standard error of the mean
  se_mean <- function(x) {
    sd(x) / sqrt(length(x))
  }
  
  # Standard error of a proportion
  se_prop <- function(p, n) {
    sqrt(p * (1 - p) / n)
  }
  
  # Body condition index (residual of body mass on structural size e.g. flipper or bill length)
  bci <- function(mass, structural_size) {
    resid(lm(mass ~ structural_size))
  }
  
  # Start manipulating data
  penguins %>% 
    arrange(body_mass_g) %>% 
    mutate(mass_kg = body_mass_g / 1000) %>% 
    group_by(species, island) %>% 
    summarize(n = sum(!is.na(body_mass_g)),
              mean_mass_g = mean(body_mass_g),
              sd_mass_g = sd(body_mass_g),
              bci_flipper = bci(body_mass_g, flipper_length_mm),
              bci_bill = bci(body_mass_g, bill_length_mm),
              .groups = "drop")
})

# Now lets try to make this reprex ready (reproducible + minimal)
# Q10: Identify 1-3 code chunks you think we can eliminate and still encounter the error.
# Chunk 1 - library(lubridate)
    # library(nlme)
# Chunk 2 - 
  # Standard error of the mean
    # se_mean <- function(x) {
    # sd(x) / sqrt(length(x))
      # }
   # Standard error of a proportion
      # se_prop <- function(p, n) {
      # sqrt(p * (1 - p) / n)
# 3 - mutate(mass_kg = body_mass_g / 1000)
    # mean_mass_g = mean(body_mass_g),
    # sd_mass_g = sd(body_mass_g),%>% 
      # }

# A shortened example of a workflow...
# And browser??
reprex({
  
  # Load some packages
  library(tidyverse)
  
  # Load some dummy data
  df <- data.frame(
    a = c("island 1", "island 2", "island 2", "island 3"), #grouping variable
    x = 1:4, # some numbers
    y = 9:12) #some numbers
  
  # Define some functions
  
  # Body condition index (residual of body mass on structural size e.g. flipper or bill length)
  bci <- function(mass, structural_size) {
    browser()
    resid(lm(mass ~ structural_size))
  }
  # Start manipulating data
  df %>% 
    group_by(a) %>% 
    summarize(bci_xy = bci(x, y),
              .groups = "drop")
})
  




