library(tidyverse)
library(MASS)
data(package = .packages(all.available = TRUE))
data<- iris
head(data)
tail(data)
# List datasets from all installed packages
listofdata <- data()$results[, "Item"]

# Count the number of datasets
len <- length(listofdata)
print(len)

# check if there are any missing values
sapply(data, function(x) sum(is.na(x)))

# check number of rows and columns in dataset
dim(data)

# column names of the dataset
names(data)

# summary of dataset
summary(data)

# the dataset covers iris lengths and widths of their petals
# and sepals by 3 species. Petal.Length and Sepal.Length measure how tall
# the respective part is and Petal.Width and Sepal.Width measure how wide
# the respective part is
str(data)

# bar plot of sepal length
ggplot(data, aes(x=Sepal.Length))+
  geom_bar(fill="pink")+
  labs(title="Sepal Lengths by how many",
       x="Sepal Length")

# histogram of sepal width
ggplot(data, aes(x=Sepal.Width))+
  geom_histogram(bins=10, fill='lavender',color='black')+
  labs(title="Sepal Width", x='Width')

# scatter of sepal length vs petal length
ggplot(data, aes(x=Sepal.Length,y=Petal.Length))+
  geom_point(color='coral')+
  labs(title="Sepal Length vs Petal length",
       x="Sepal Length", y="Petal Length")

# scatter of sepal width vs petal width
ggplot(data, aes(x=Sepal.Width,y=Petal.Width))+
  geom_point(color='darkred')+
  labs(title="Sepal Width vs Petal Width",
       x="Sepal Width", y="Petal Width")

ggplot(data, aes(x=Sepal.Width,y=Petal.Width))+
  geom_point(color='black')+
  labs(title="Sepal width vs Petal Width",
       x="Sepal Width", y="Petal width")

# boxplots of the variables by species
ggplot(data, aes(x=Species, y=Sepal.Width))+
  geom_boxplot(fill="lavender")+
  labs(title="Species by Sepal Width")
ggplot(data, aes(x=Species, y=Petal.Length))+
  geom_boxplot(fill="pink")+
  labs(title="Species by Petal length")
ggplot(data, aes(x=Species, y=Sepal.Length))+
  geom_boxplot(fill="lightblue")+
  labs(title="Species by Sepal length")


# correlation matrix of the numeric data
cor_matrix<-cor(data %>% select_if(is.numeric))
print(cor_matrix)
ggplot(data=as.data.frame(as.table(cor_matrix)),aes(Var1, Var2, fill=Freq))+
  geom_tile(color='white')+
  scale_fill_gradient2(low='blue',high='red',mid='white', midpoint=0,
                       limit=c(-1,1))+
  geom_text(aes(label=round(Freq,2)),color='black', size=3)+
  theme_minimal()