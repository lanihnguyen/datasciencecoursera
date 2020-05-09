### R CONSOLE INPUT AND EVALUATION

x <- 1 # This is an R expression using an assignment operator; this is a numeric vector with one
# element

msg <- "Hello" # Character vector with the string "hello"

y <- 1:20 # Colon operator can be used to create sequences including both values x:y
# This is an integer vector

### DATA TYPES: R OBJECTS AND ATTRIBUTES

# Classes of Objects: character, numeric, logical, complex, integer
# Most basic object in R is a vector -- contains multiple objects of a single class of object
# Exception: a list is a sequence of objects, but each element of the vector can be an object of a different class
  # Any element of a list can be anything
# Vectors can be created using the vector function: vector(class, length of vector)

c <- vector("numeric", length = 10)

  # Creating a vector that has a mix of objects leads to coercion -- coercing the vector so that every
  # element of the vector is from the same class; picks "least common denominator" class

d <- c(1.7, "a") # character coercion
d

e <- c("a", TRUE) # character coercion
e

f <- c(TRUE, 2) # TRUE = 1, numeric coercion
f

## Numerics
# Inf = infinity
# NaN = not a number, or a missing value

## Attributes
# R objects can have attributes: names/dimnames, dimensions (matrices), class, length, etc
# Attributes can be set or modified via attributes() function

### DATA TYPES: VECTORS AND LISTS

# c() function can be used to combine things together to create a vector of objects

a <- c(0.5, 0.6) # numeric
b <- c(TRUE, FALSE) # logical 

## Explicit Coercion

# Conversion to Numeric: as.numeric()
# Conversion to Character: as.character()
# Conversion to Logical: as.logical()
# Conversion to Complex: as.complex() 

g <- 0:6
class(g) # Integer
as.numeric(g)
as.logical(g) # If greater than 0 --> TRUE
as.character(g) # Converts numerics to strings

# Coercion doesn't always work -- nonsensical coercions will result in NAs
nonsense <- c("a", "b", "c")
as.numeric(nonsense) # Can't really convert strings to numbers

## Lists = special type of vector that can contain elements of different classes
# List Function: list(elements)

list1 <- list(1, "a", TRUE, 1 + 4i)
list1 # Elements are double indexed by double brackets, elements of regular vectors only have []

### DATA TYPES: MATRICES
## Matrices are a special kind of vector in R with a dimension attribute
# Function: matrix(values, # rows, # columns)
m <- matrix(nrow = 2, ncol = 3)

dim(m) # Will tell us how many rows and columns we have 

## Constructed column wise - numbers first fill up columns
m <- matrix(1:6, nrow = 2, ncol = 3)
m

## Can also create a matrix by creating dim attribute with a vector

m1 <- 1:10

dim(m1) <- c(2,5) # Assigning values to the dimension attribute of m1

m1

## Matrices can also be column-binding and row-binding with cbind() and rbind()

x <- 1:3
y <- 10:12 

cbind(x, y) # Matrix where column 1 is 1:3, column 2 is 10:12
rbind(x, y) # Matrix where row 1 is 1:3, row 2 is 10:12

### DATA TYPES: FACTORS
## Factors are a special type of vector used to represent categorial data
  # Factors can be ordered (ranked) or unordered (i.e male and female)
  # Factors are self-describable: 1 and 2 vs Male and Female

# Can be created using the factor function: factor(char vector)

x <- factor(c("yes", "yes", "no", "yes", "no"))
x

table(x) # Counts the number of occurrences for each level; formats into a table

unclass(x) # Brings levels and translates them into numeric elements; telling us its an integer vector
# with the levels attribute of no/yes

# Order of the levels can be set using the levels argument in factors

x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no"))
x
  # You can set the order of the levels: in this example, yes = level 1 and no = level 2

### DATA TYPES: MISSING VALUES
## Missing values are denoted by NA or NaN (undefined math operations)
# is.na() tests objects if they have missing objects; is.nan() is used for testing missing NaNs
# NA only tells you that the object is missing an element, but it doesn't tell you what kind of 
# class the missing value is

v <- c(1, 2, NA, 10, 3)
is.na(v) # Returns a logical vector if vector v has any missing elements (element 3 is TRUE - this is 
# where the missing value is)

### DATA TYPES: DATA FRAMES
## Used to store tabular data
  # Special type of list, where every element of the list has the same length
  # Can contain objects from different classes in each column, whereas matrices must have 
    # every element be from the same class
## Special Attributes
# Row Names - useful for annotating data

## read.table or read.csv function can read in dataframes; data.frame() function can create
# data frames

# data.frame(variable1 = ..., variable2 = ...)

x <- data.frame(foo = 14, bar = c(T, T, F, F))
x 

nrow(x) # tells us how many rows are in x
ncol(x) # tells us how many columns are in x

## can also use data.matrix() function to create a matrix from a dataframe
# if you have a dataframe with many classes of objects -- 
# it will coerce each object to be the same class

### DATA TYPES: NAMES ATTRIBUTE
# R objects can have names - useful for writing reusable code and self-describing objects
# Function: names(vector)

x <- 1:3
x

names(x) <- c("foo", "bars", "norf") # Assigning names to elements of the list x

names(x) # Outputs names associated with each element of the vector

x

# Lists can also have names

x <- list(a=1, b=2, c=3)
x

# Matrices can have names too

m <- matrix(1:4, nrow = 2, ncol = 2) # making a 2x2 matrix

dimnames(m) <- list(c("a", "b"), c("c", "d")) # assigning a list where the first element
# of the list is a vector of row names, second element of the list is a vector for column names

m

### READING TABULAR DATA

## read.table(), read.csv() can be used for reading tabular data into R
## readLines() will read in lines of a text file (character vector in R)
## source() for reading R code files (inverse of dump)
## dget() for reading in R code files (inverse of dput)
## load() for reading in saved workspaces
## unserialize() for reading single R objects in binary form

## Analgous functions for writing data:
## write.table()
## writeLines()
## dump()
## dput()
## save()
## serialize()

## read.table() is most commonly used function in R; has important arguments

# file = name of the file; usually required
# header = logical indicating if the file has a header line (T/F)
# sep = a string indicating how the columns are separated 
# colClasses = a character vector indicating the class of each column in the dataset
# nrows = number of rows in the dataset
# comment.char = a character string indicating a comment character
# skip = the number of lines to skip from the beginning
# stringsAsFactors = should char variables be coded as factors? (T/F)

# default separator for read.csv() is a comma, default separator for read.table() is a space



