library(ggplot2)

iris = iris
str(iris)

theme_set(theme_bw())
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  xlim(c(0, 10)) +
  ylim(c(0, 10))


ggplot(mpg, aes(x=class, y=hwy)) + 
  geom_boxplot(
    
    # custom boxes
    color="blue",
    fill="blue",
    alpha=0.2,
    
    # Notch?
    notch=TRUE,
    notchwidth = 0.8,
    
    # custom outliers
    outlier.colour="red",
    outlier.fill="red",
    outlier.size=3
    
  )

