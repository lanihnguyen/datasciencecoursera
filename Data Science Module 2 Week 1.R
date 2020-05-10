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

### READING LARGE TABLES
help(read.table)

## Important parameters of read.table to keep in mind:
# If there are no comments in the file: comment.char = ''
# colClasses tells R what type of data is in each column of the table - saves time
  # If all columns of are the same class, just do "colClasses = *class of object*"
# Another option is only reading in the first 100 or 1000 rows of the dataset --> use nrows

# --------------------------------------------------------------------------------------
                      # ** EXAMPLE CODE FOR SAPPLY**
# initial <- read.table("dataset.txt", nrows = 100)
# classes <- sapply(initial, class)
# specifying the nrows argument --> looping over each of the 
# columns using sapply and calling the class function. So the class function will give you,
# will tell you what class of data is in each column
# --------------------------------------------------------------------------------------

### SUBSETTING: BASICS

## Subsetting Operators -- Extracts from R Objects
# [ returns an object of the same class as the original (subsetting a list = output is a list)
  # Can be used to select more than one element of an object
# [[ extracts elements of a list/datadrame. Can only be used to extract a single element and the class
# of the returned object will not be necessarily be a list or a dataframe
  # Output can be of a different class than the original
# $ extracts elements of a list/dataframe that has a name
  # Output can be of a different class than the original

x <- c("a", "b", "c", "c", "d", "a")
x[1] # Extracts the first element of x
x[1:4] # Extracts the 1st - 4th index of x
x[x > "a"] # Extract elements of the list x that are "greater than" a (b, c, d, etc. )

u <- x > "a" # logical vector which outputs which values are greater than a (T)
u

x[u] # Logical Indexing
x[x > "a"] # Numeric Indexing

### SUBSETTING: LISTS

x <- list(foo = 1:4, bar = 0.6)
x

x[1] # Single bracket indexing returns a list if the original class is a list
x[[1]] # Double bracket will return a sequence (not a list of the sequence)

x$bar # Gives us the element associated with the name "bar" 
x[["bar"]] # Same as x$bar
x["bar"] # Returns a list with the element "bar"

x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1,3)] # Returns first and third element of the list 2. Allows you to extract multiple elements
# from a list

# Can use double bracket to index a list where the index itself was computed -- $ can't do this
name <- "foo"

x[[name]] 
# "name" is not in the list "foo", but the index was computed so that the index would read in 
# "name" as "foo" and the function extracted the elements associated with "foo"

# To use a dollar sign, need to use a literal symbol/name that is present in the list

# Double bracket can take an integer sequence -- recurses into a list
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1,3)]] # Extracting the third element of the first element in the overall list
x[[1]][[3]]
x[[c(2,1)]] # Extracting the first element in the second element of the overall list

### SUBSETTING: MATRICES
## Matrices can be subsetted in the (row, column) type indices

x <- matrix(1:6, 2, 3) # 2x3 matrix with numerics 1:6
x

x[1,2] # Index first row, second column

# Indices can be missing
x[1, ] # Extract first row
x[ , 2] # Extract second column

# 
