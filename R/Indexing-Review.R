#Indexing Review!
#Indexing Atomic Vectors
x <- c(a = 1, b = 2, c = 5)
# 3 ways to index
# by position - only works for atomic vectors!
x[1]
x[1:2]
x[c(1,3)]

# by name
x["a"]
x[c("a", "c")]

# where's bob?
filenames <- c("bob", "bob", "springer", "bailey", "bailey")
breed <- c("pittie", "pittie", "shepherd", "lab", "lab")
filenames == "bob"
filenames[filenames=="bob"]
which(filenames=="bob")
breed[filenames == "bob"]

x[names(x) == "b"]

#Exercises Q1-Q3
plant_height_mm <- c(p0 = 45.94, p1 = 48.13, p2 = 48.14, p3 = 47.55, p4 = 43.85, 
                     p5 = 45.12, p6 = 45.49, p7 = 44.82, p8 = 48.4, p9 = 46.62)
plant_species <- c("Arabidopsis thaliana", "Arabidopsis arenosa", 
                   "Arabidopsis lyrata", "Arabidopsis arenosa", 
                   "Arabidopsis arenosa", "Arabidopsis arenosa", 
                   "Arabidopsis lyrata", "Arabidopsis thaliana", 
                   "Arabidopsis thaliana", "Arabidopsis thaliana")

#Q1: Match the following lines of code to indexing by position, logic, and name.
plant_height_mm[plant_species == "Arabidopsis thaliana"] #logic
plant_height_mm[c("p0", "p9", "p10")] #name
plant_height_mm[7:10] #position

#Q2: Fill in the blanks to (1) subset plant_height_mm where species is Arabidopsis arenosa 
#and (2) subset plant_height_mm where species isn’t Arabidopsis thaliana.
  #(1)
plant_height_mm[plant_species == "Arabidopsis arenosa"]
  #(2)
plant_height_mm[plant_species != "Arabidopsis thaliana"]

#Q3: Subset plant_species where the plant height was more than a standard deviation greater than the mean.
plant_species[plant_height_mm > (sd(plant_height_mm)+mean(plant_height_mm))]


#Indexing Lists
l <- list(a = 1:3, 
           b = 4:6)
mean(l[1])



#Exercises Q7-Q9
set.seed(1001)
# A linear regression model
x <- 1:10
l <- list(x = 1:10,
          y = 2 * x + rnorm(10, sd = 2),
          coef = c(intercept = 1.326, slope = 1.635))
plot(l$x, l$y)

#Q7: What type of indexing is used in the call to plot() to get the x- and y-axis values?
# indexing by name; dollar sign


#Q8: Estimate the predicted values of y using coef.
predicted_y <- (l$coef["slope"] * l$x) + l$coef["intercept"]
  
  #1 How will you subset x? [], [[]], or $. 
l$x
  
  #2 How will you subset the intercept and slope? Hint: you’ll need to combine list subsetting and vector subsetting!
l$coef["intercept"]
l$coef["slope"]
  
  #3 Apply the formula y = mx+ b to estimate predicted y.
predicted_y <- (l$coef["slope"] * l$x) + l$coef["intercept"]

#Q9: Create a plot by filling in the blanks in the following code.
predicted_y <- (l$coef["slope"] * l$x) + l$coef["intercept"]  # Your answer to Q8 goes here
plot(l$x, l$y)  # Create a scatter plot of x and y (from l)
lines(l$x, predicted_y, col = "red") # Add a line with the model predictions (observed x and predicted y)
