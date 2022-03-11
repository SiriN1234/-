stats <- read.csv("data/rstats.csv") # rstats.csv
학생 = read.csv("data/학생.csv")
학생2 = readxl::read_xlsx("data/학생.xlsx")

rm(list = ls())

students = read.csv("public_dataset/student.csv")

mpg1 = read.csv("public_dataset/mpg1.csv")
mpg2 = read.csv("public_dataset/mpg2.csv")

## 66페이지 student.csv 파일

install.packages("data.table")
library(data.table)
fread("public_dataset/student.csv")
