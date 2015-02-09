Reading Data

There are a few principal functions for reading data in R
Read.Table, read.scv, for reading tabular data
readlines, for reading lines of a text file
source, for reading in R code files(inverse of dump)
dget, for reading in R code files (inverse of dput)
load, for reading in saved workspaces
unserialize, for reading single R objects in binary form


Writing Data

write.table
writeLines
dump
dput
save
serialize

read.table function is one of the most commonly used functions for reading data. It has a few important arguments
file, the name of a file or connection
header, logical indicating if the file has a header line
sep, a string indicating how the columns are separated
colClasses, a character vector indicating the class of each column in the dataset
nrows, the number of rows in the dataset
comment.char a character string indicating the comment character
skip, the number of lines to skip from the beginning
stringsasfactors , should character variables coded as factors


Read.Table (for small to moderately sized datasets , you can usually call read.table without specifying any other arguments) 

data <- read.table("foo.txt")

r will automatically 
	Skip lines that begin with #
	figure out how many rows are (and how much memory needs to be allocated)
	figure what type of variable is in each column of the table Telling R all these things directly makes R run faster and more efficiently
	read.csv is identical to read.table except that the default separator is a comma



Reading Larger Datasets with Read.Table

Read the help page for read.table, which contains a lot of hints
Make a rough calculation of the memory required to store your dataset. if the dataset is alrger than th amount of Ram, ou should stop
Set comment.char = "" if there are no commented lines in your file.



Use the colClasses argument. Specify this option instead of using the default can make read.table run much faster, often twice as fast. In order to use this option you have to know the calss of each column in your dataframe. If all the columns are numeric for example then you can just set colClass = "numeric". A quick an dirty way to figure out the classes of each column is the following.

initial <- read.table("datatable.txt", nrows = 100);
classes <- sapply(initial, class)
tabAll <- read.table("datatable.txt", colClasses = classes)

nrows doesnt make R run faster but it helps memory usage. A mild overestimate is okay. You can use the Unix tool wc to calcualte the number of lines in a file. 

Know you system
How much memory is available
What other applications are in useAre you logged into the same system as someone else
what operating system
OS 32bit or 64bit?



Calculating Memory Requrements

I have a data frame with 1,500,000 rows and 120 columns, all of which are numeric data. Roughly how much memory is required to store this data frame?

row * column * bytes per cell
1,500,000 * 120 * 8 bytes (numeric)

1440000000 bytes

1440000000 / 2^20 bytes/MB
1373 MB
1.34 GB

Have to add a bit of memory for R overhead


Textual Data Formats - dput() dump()

Other formats other than tabular and csv - dumping and dputing are useful because the resulting textual format is edit-able and in the case of corruption, ptentially recoverable
Unlike writing out a table or csv file, dump and dput preserve the metadata (sacrificing some readability), so that another users doesnt have to specify it all over again
textual formats can work much better with version control programs like subversion or git which can only track changes meaningfully in text files
Textual formats can be longer-lived; if there is corruption somewhere in the file, it can be easier to fix the problem
textual formats adhere to the "unix philosophy" -> store all data in text

Downside -> the format is not very space efficient

dumping and dputting are text formats -> but they contatin the meta data of the object - such as the class, names, rownames etc. Textual formats are nice for storing data

> getwd()
[1] "C:/Users/Matt/Desktop/myStuff/Programming/R"
> Df <- data.frame(x = 2, y = 5)
> Df
  x y
1 2 5
> dput(Df)
structure(list(x = 2, y = 5), .Names = c("x", "y"), row.names = c(NA, 
-1L), class = "data.frame")
> Df
  x y
1 2 5
> dget(Df)
Error in parse(file = file) : invalid connection
> dput(Df, file = "mydputDfFile") #creates a file with meta data in current working directory
> dget(Df)
Error in parse(file = file) : invalid connection
> dget("mydputDfFile")
  x y
1 2 5

