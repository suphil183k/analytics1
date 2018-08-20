data("iris")
data()
iris

#matrix----
#array----


#vectors----
v1 = 1:10000 #create vector from 1 to 100
v1
v2 = c(1,4,5,10)
v2
class(v1)
class(v2)
v3 = c('a','Shivani','Megha')
v3 #print the character
class(v3)
v4 = c(TRUE, FALSE, T, F, T)
class(v4)

#summary on vectos
mean(v1)
median(v1)
sd(v1)
var(v1)
hist(v1)

hist(women$height)

v2
v2[v2>=5]

x = rnorm(60, mean = 60, sd=10)
x
plot(x)
hist(x)
plot(density(x))
abline(v=60)
#rectangles and density together
hist(x, freq = F) #F=False
lines(density(x))

hist(x, breaks=10, col=1:10)
length(x)
sd(x)

?sample
?sample 
x1 = LETTERS[5:20]
X1
x1

set.seed(1803)
y1 = sample(x1)
y1

set.seed(5)
(y2 = sample(x1, size = 5))

(gender=sample(c('M','F'), size = 1000000, replace = TRUE, prob = c(.3,.7)))
(t1=table(gender))
prop.table(t1)
pie(t1)
barplot(t1, col=1:2, horiz = T)


#matrix----
(m1 = matrix(1:24, nrow = 4, ncol = 6))
(m2 = matrix(1:24, nrow = 4, byrow = T))
(m3 = matrix(1:24, ncol = 4, byrow = T))
(x=trunc(runif(60,60,100)))

?runif
#round, trunc, ceiling, floor


plot(density(x))
(m4 = matrix( x, ncol = 6))
colSums(m4)
rowSums(m4)
rowMeans(m4)
colMeans(m4)
m4[m4> 67 & m4 < 86]
m4[8:10, ]
m4[8:10, c(1,3,5)]
m4[ , c(1,3,5)]
rowSums(m4[8:10, c(1,3,5)])

#array----
#data.frame
#rollno, name, gender, course, marks1, marks2
(rollno = 1:60)
(name=paste('student',1:60,sep = '-'))
(gender=sample(c('Male','Female'), size = 60, replace = T, prob = c(.3,.7)))
(course=sample(c('BBA','MBA','FPM'), size = 60, replace = T, prob = c(.4,.3,.2)))
(marks1= ceiling(rnorm(60, mean = 65, sd=7)))
(marks2= ceiling(rnorm(60, mean = 65, sd=11)))
(grades = sample(c('A','B','C'), size = 60, replace = T))
students = data.frame(rollno, name, gender, course, marks1, marks2, grades, stringsAsFactors = F)
class(students)
summary(students)

students[, c('name')]
students[students$gender=='Male', c('rollno','gender','marks1')]
students[students$marks1>55 | students$marks1<75, c('name','marks1')]
students$gender
t1=table(students$gender)
barplot(table(students$course), ylim=c(0,50), col = 1:3)
text(1:3,table(students$course)+5,table(students$course))

str(students)
nrow(students)
names(students)
dim(students)
head(students)
tail(students)
head(students,n=7)
#
#avg marks scored by each gender in marks1
#gender, marks1
aggregate(students$marks1, by=list(students$gender), FUN=mean)
#max marks2 scored from each course
aggregate(students$marks2, by=list(students$course), FUN=max)
#max marks2 scored from each gender and each course
aggregate(students$marks2, by=list(students$course, students$gender, students$grades), FUN=max)


#extra commands
name[1:10]
name[15:20]
name[c(15,20,37)]
name[-1]
name[-10]
name[-c(1:10)]
rev(name)
name[60:1]
name[-c(1:10,35:40)]



#dplyr
library(dplyr)
students %>% group_by(gender) %>% summarise(mean(marks1))
students %>% group_by(course,gender) %>% summarise(meanmarks1=mean(marks1), min(marks2), max(marks2)) %>% arrange(desc(meanmarks1))
students %>% arrange(desc(marks1)) %>% filter(gender=='Male') %>% head(n=5)

students %>% sample_frac(.1) %>% arrange(course) %>% select(name, gender) #0.1 = 10% of the total 60 = 6 students
students %>% sample_n(2)



#factor----
names(students)
students$gender = factor(students$gender)
summary(students$gender)
summary(students$course)
students$course = factor(students$course,ordered = T)
summary(students$course)
students$course = factor(students$course,ordered = T, levels=c('FPM','MBA','BBA'))
summary(students$course)
students$grades

#C, A, B
students$course = factor(students$course,ordered = T, levels=c('C','A','B'))
students$grades
table(students$grades)
barplot(table(students$grades))

students
write.csv(students,'./data/iimtrichy.csv')
students2 = read.csv('./data/iimtrichy.csv')
head(students2)
students3 = read.csv(file.choose())



