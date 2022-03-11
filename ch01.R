write('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', file = "~/.Renviron", append = TRUE)

Sys.which("make")

Sys.getenv("PATH")

install.packages("jsonlite", type = "source")

install.packages("tidyverse")

library(tidyverse)

iris <- iris

ggplot(iris, aes(x = Sepa1.Length, y = Sepal.Width)) + geom_point()

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point()
