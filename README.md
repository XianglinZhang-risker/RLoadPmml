# RLoadPmml

install.packages('devtools')

devtools::install_github("https://github.com/xianglinZ/RLoadPmml", force = TRUE)

library(RLoadPmml)

pmmlFcLoad()

# By one row data.frame or one row data.table

## pmmlfile

testDF <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = data.frame('Sepal.Length' = 1,'Sepal.Width' = 1,'Petal.Length' = 1,'Petal.Width' = 1))

testDF

testDT <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = data.table('Sepal.Length' = 1,'Sepal.Width' = 1,'Petal.Length' = 1,'Petal.Width' = 1))

testDT

## model

testDF <- modelPredict(model = modelLoad('fit_pmml.pmml'),data = data.frame('Sepal.Length' = 1,'Sepal.Width' = 1,'Petal.Length' = 1,'Petal.Width' = 1))

testDF

testDT <- modelPredict(model = modelLoad('fit_pmml.pmml'),data = data.table('Sepal.Length' = 1,'Sepal.Width' = 1,'Petal.Length' = 1,'Petal.Width' = 1))

testDT

# By list
testLIST <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = list('Sepal.Length' = 1,'Sepal.Width' = 1,'Petal.Length' = 1,'Petal.Width' = 1))

testLIST

# By data.frame or data.table
testDFS <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = iris)

testDFS

# By vector
testVC <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = c(1,1,1,1))

testVC

# By matrix
testMT <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = matrix(1,1,1,1))

testMT

# By records json
testRJ <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = '[{"sepal_length": 5.1, "sepal_width": 3.5, "petal_length": 1.4, "petal_width": 0.2}]')

testRJ

# By split json
testSJ <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = '{"columns": ["sepal_length", "sepal_width", "petal_length", "petal_width"], "data": [[5.1, 3.5, 1.4, 0.2]]}')

testSJ
