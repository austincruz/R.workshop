# Sky School Research Apprenticeship Program: Spring 2022
# Workshop: Introduction to data science in R 
# March 19, 2022
# Script created by Austin R. Cruz, EEB PhD student (U of Arizona)
# 
# **********************************************
# Script outline
#
#	1) "Getting started" 
#		1.1		Exploring R
#		1.2		Organizing directory
#		1.3		Installing packages
#		1.4		Importing/running external data files
#
#	2) "Iris dataset"
#		2.1		Exploring the data set
#		2.2		Exploring the data for a single species
#	
#	3) "Data visualization"
#		2.1 Histograms
#		2.2 Scatterplots
#		2.3 Boxplots
#		2.4 Using 'ggplot2' package
#			2.4.1 'gg' Histograms
#			2.4.2 'gg' Scatterplots
#			2.4.3 'gg' Boxplots
#
# **********************************************
# 1) GETTING STARTED 
# **********************************************
# 
# 1.1 EXPLORING R -----------------------------

# One of the most basic features in R is creating objects which can 'hold' specific items, such as numbers, words ("strings"), or expressions. 

# In the example below, the value/number 100 is stored in the object 'x'. When we create the object x and call it, the number 100 is returned. Try it out!

x <- 100
x

# Notice that the way to we assign values to objects is with the '<-' or '->' operator, which looks like an arrow pointing toward the object. Both operators work equally, but pay attention to the assignment order/direction. 

200 -> w
w

# Let's create an object storing a 'string' of words: 

a <- "Hello! This is a string!"
a

# Strings are special in that they need to beginn and end with single quotes, ' ', or double quotes, " ", otherwise it will be invalid

# Now let's create some objects that store expression of numbers: 

b <- 10 - 5
b
# The object 'b' should now contain the number 5

c <- 20 - 10
c
# The object 'c' should now contain the number 10

# We can use these objects now like numbers. Check it out: 

# Addition
b + c 

# Subtraction
b - c 

# Division
c/b

# Multiplication: Notice the '*' symbol used for multipilcation
b*c

# Exponents
b^c

#This is my code

sq <- 100*2
sq
s <- 25
s    # s = sponge

# 1.2 ORGANIZING DIRECTORY -----------------------------

# So far, we've been able to work in the R console itself without needing to tell R where to obtain any information or files. 

# Here, we will set up our 'working directory', which is a folder or sub-folder on your computer that contains file types with data that you'll be using in R. 

# We want to tell R to get files from a specific folder, otherwise we can't access the file and it's data. 

# First, we need to check the current directory of your R session. We do this by writing the 'getwd()' function in the R console and hitting 'enter'. *Note: we don't run this function in the R script, which is where you are reading this now*

# This should return your current directory. If this is where your files are located, then you are all set! If not, then we need to change our directory in the next step.

# Next, we write 'setwd("\...\...")' and add the folder path between the quotes. Your directory is now set. 

# To check files in your directory, write the function 'dir()' or 'list.files()' in the console and hit enter. If you have other files in this directory folder, they should appear as a list in the console. 

# To creaate and add a new R script in the directory, use the function 'file.create("new_file.R")' which adds the script to your directory. Go check it out. 

# These are just a few important features of setting your directory; there are many other directory commands worth exploring. 


# 1.3 INSTALLING PACKAGES -----------------------------

# In R, we use 'packages' to access pre-built software that contains code for running all types of functions and programs. 

# The only tricky thing is that R has > 10,000 packages! 

# While there is some overlap between them, they are unique and require that you download them from the network of CRAN servers that store this code and its corresponding documentation. Learn more here <https://cran.r-project.org>

# Often, one has to do a bit of research in advance to learn about the packages that have the specific features or functions that you need. 

# Let's install the required package for multiple data sets, called 'datasets'. This package contains the 'iris' dataset. Use the function below, with the dataset name between quotes, to download the package.

install.packages("datasets")



# Add the package, in this case "datasets", to your working library
library(datasets)

# We want the 'iris' data set from this package. Once we run this command, the entire data set will be available for us explore/use
data(iris)


# 1.4 IMPORTING/RUNNING EXTERNAL DATA FILES -----------------------------

# In the previous section, we directly downloaded the 'iris' data set from R. This was convenient but most of the time we'll need to import OUR OWN data into R. Do to this, we use the following code: 

flowers <- read.table(file="iris.csv",
			header = TRUE,  # 'header' set to TRUE means that there are variable 								#names at the top of the file
			sep=","		# Data points are separated by commas
			)


# I've stored the data from the .csv files into the 'object' named 'flowers'. Be sure to have a unique name for your data set so that it is easy to identify. 

# Now that we've accessed the 'iris' data set from within R or from our .csv file, we're ready to start exploring. Yahoo!


# **********************************************
# 2) IRIS DATA SET
# **********************************************

# 2.1 EXPLORING THE DATA SET -----------------------------

# Install the collection of packages called 'tidyverse'
# These packages are widely used for data manipulation in data science, and are some of the most sophistcated. See more here <https://www.tidyverse.org>
install.packages("tidyverse")

# Now load the specific package called 'dplyr' into your library
library(dplyr)

# First, let's take a look at how the data are summarized 

# We can use the 'summary' function for either the 'iris' object from the package, or the 'flowers' object that contains the data from our .csv file
summary(iris) 

summary(flowers)

# This function returns from information about the distribution of values for each column, and the number of observations for each species (50)

# However, some of this isn't quite useful since all the different species' values are mixed together

# Now let's take a look at how the data are structured using the 'str' function
str(iris)

# First, this information tells us that we are working with a 'dataframe', which is a matrix of rows and columns

# In our case, we have 150 rows (observations) across 5 columns (variables)

# We can also use the 'dim()' function to know exactly how many rows and columns we have: 

dim(iris)

# Again, 150 rows and 5 columns

# We can see that the name of each column is listed after each $

# We can also use specific code to extract the names of our columns: 
colnames(iris)

# Notice how each column name has upper case letters in it; this might be inconvenient to work with, as R is sensitive to cases. Let's transform these upper case letters to all lower case: 

names(iris) <- tolower(names(iris))

# Check our column names again to see that they have been converted to all lower case

colnames(iris)

# Let's say we wanted to see the value/number of each row in a column. We can do that by the using the 'print' function with the '$' operator inside the parenthesis (); the data frame object goes before the '$' operator, and the column name goes after the '$' operator

# Examples: 

print(iris$sepal.length)

print(iris$species)

# 2.1 EXPLORING THE DATA FOR A SINGLE SPECIES -----------------------------

# Imagine now that we are interested in the setosa species. Let's filter the data so that we only have rows for this species: 

setosa <- filter(iris, species == 'setosa')

setosa

# Did R return 50 rows, and only 50 rows, that correspond to the setosa species (indicated in the last column)?

# Now let's check the summary statistics of setosa species only
summary(setosa)

# If we want, we can also filter the rows for setosa that contain sepal lengths  greather than some value, in the case below I've set that to 5. We store those data in a new object that I've called 'setosa.SL5' 

setosa.SL5 <- filter(iris, species == 'setosa', sepal.length > 5)

# All returned values of setosa sepal length should now be greater than 5. Check to find out:
setosa.SL5

# These objects hold the data for the versicolor and virginica species

versicolor <- filter(iris, species == 'versicolor')

verginica <- filter(iris, species == 'verginica')


# In the code below, we are interested in the means of the setosa species traits
# The code below extracts the means for each trait (column) in the setosa species, and stores them in a new object with a name that can easily be identified

setosa.sepal.l.mean <- summarise(setosa, mean(sepal.length))
setosa.sepal.l.mean

setosa.sepal.w.mean <- summarise(setosa, mean(sepal.width))
setosa.sepal.w.mean

setosa.petal.l.mean <- summarise(setosa, mean(petal.length))
setosa.petal.l.mean

setosa.petal.w.mean <- summarise(setosa, mean(petal.width))
setosa.petal.w.mean

# These means should be the exact same as when we used the 'summary(setosa)' function above 

# We can repeat + modify this code for each of the four traits for the other two species (versicolor, virginica)


# **********************************************
# 3) DATA VISUALIZATION
# **********************************************

# Hooray! This is where R gets a lot more fun: visualizing our data! 

# 3.1 HISTOGRAMS -----------------------------
# To start, let's now see how each setosa trait is distributed using a histogram. A histogram groups values of the trait on the x-axis, and shows the frequency of that group on the y-axis

# We can use the 'hist()' function in R, and use the '$' operator again to specify which trait (column) we want from our data, in this case our 'setosa' object that we created above
  
# Histogram of each trait (column) for 'setosa' 
hist(iris$sepal.length)

hist(setosa$sepal.width)

hist(setosa$petal.length)

hist(setosa$petal.width)

# Running the next five lines of code knits all the histograms together in a single figure. This might make visual inspection and comparison easier. 

# This line of code organizes the figure in a series of panels that is 1 row by 4 columns large, with the 'mar()' functions used to set the margin sizes 

par(mfrow = c(1, 4), mar = c(4, 4, 2, 2))

hist(setosa$sepal.length)

hist(setosa$sepal.width)

hist(setosa$petal.length)

hist(setosa$petal.width)

# Notice the slightly different ranges on the x-axis for each trait


# 3.2 SCATTERPLOTS -----------------------------

# Another type of graph that we can use to visualize our data is a scatter plot. These plots use the x-y coordinate system to display values usually for two variables. 

# Use the 'plot()' function to generate a scatter plot with our 'setosa' object
plot(setosa)

# This returns a seemingly overwhelming grid of scatter plot combinations of all traits with others in setosa. This is good to get a general idea at first glance, but let's take a look at individual x-y combinations first.

# Plots one main scatter plot figure 
par(mfrow = c(1, 1), mar = c(4, 4, 2, 2))
plot(setosa$sepal.length, setosa$sepal.width)

# This code can be repeated + modified to examine other combinations of petal and sepal measurements against one another for setosa, and for the other species (versicolor, virginica)


# 3.3 BOXPLOTS -----------------------------

# Boxplots a great ways to understand the distribution of your data, and how those data are grouped

# Without getting into the details here about how to analyze boxplots, I will instead go over the code to generate them

# The code and argumentation to do this is similar to that used in the previous types of figures, but this difference is the use of the '~' 

# The '~' operator says to the sepal lengths by species, so we'll be visualizing all three species' sepal lengths 

boxplot(iris$sepal.length ~ iris$species)

# So far so good, right? 

# Let's create another one for sepal width this time

boxplot(iris$sepal.width ~ iris$species)


# 3.4 USING 'ggplot2' PACKAGE -----------------------------

# Now that we've got the basics of histograms, scatterplots, and boxplots under our belts, let's take a peek at a better recipe, in my humble opinion, for data visualization. 

# I'm not sure about you, but those previous figures were nice but needed a little more 'jazz' and cleaning up, right? Enter 'ggplot2'. Let's dive in!

# The 'ggplot2' package has been around for about 10 years, and is one that was created specifically with ease of design, aesthetics, and creativity in mind. Check out more background here <https://ggplot2.tidyverse.org>

# We first have to add the package 'ggplot2' to our library

library(ggplot2)

# 3.4.1 'gg' HISTOGRAMS -----------------------------

# Next, let's build the code for a histogram

# We use the 'ggplot()' function which takes the 'aes()' function as one of its arguments. The 'aes()' functions controls what we want on the x axis. 

# Now let's store the function in the object that I've called 'gg.histogram'
gg.histogram <- ggplot(data = iris, aes(x = sepal.length))

gg.histogram + 
	geom_histogram(binwidth = 0.2, color = "black", aes(fill = species)) +
	xlab("Sepal length") +
	ylab("Frequency") +
	ggtitle("Histogram of sepal length")
	
# If we want to get rid of the gray background, we can add '+ theme_minimal()' to our code (in this case, at the end)

gg.histogram + 
	geom_histogram(binwidth = 0.2, color = "black", aes(fill = species)) +
	xlab("Sepal length") +
	ylab("Frequency") +
	ggtitle("Histogram of sepal length") + 
	theme_minimal()

# Pretty cool, huh?
	
# 3.4.2 'gg' SCATTERPLOTS -----------------------------

gg.scatter <- ggplot(data = iris, aes(x = sepal.length, y = sepal.width, color = species))

gg.scatter +
	geom_point(aes(shape = species), size = 1.5) +
	xlab("Sepal length") +
	ylab("Sepal width") +
	ggtitle("Iris scatterplot") +
	geom_smooth(method = "lm") +
	theme_minimal()


# 3.4.3 'gg' BOXPLOTS -----------------------------

gg.boxplot <-ggplot(data = iris, aes(x = species, y = sepal.length))

gg.boxplot +
	geom_boxplot(aes(fill = species)) +
	ylab("Sepal length") +
	ggtitle("Iris boxplot") +
	stat_summary(fun.y = mean, geom = "point", shape = 4, size =3) +
	theme_minimal()

