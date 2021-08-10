#' Friendly R language pmml loading package
#'
#' @description Help R load the pmml file in a user-friendly manner, and use the model loaded by the pmml file to make predictions.
#'
#' @param ...
#'
#' @return
#'
#' @import reticulate
#' @import data.table
#'
#' @export
#'
#' @examples
#' pmmlFcLoad()
#'
#' # By one row data.frame or one row data.table
#' testDF <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = data.frame('Sepal.Length' = 1,'Sepal.Width' = 1,'Petal.Length' = 1,'Petal.Width' = 1))
#' testDF
#'
#' testDT <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = data.table('Sepal.Length' = 1,'Sepal.Width' = 1,'Petal.Length' = 1,'Petal.Width' = 1))
#' testDT
#'
#' # By list
#' testLIST <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = list('Sepal.Length' = 1,'Sepal.Width' = 1,'Petal.Length' = 1,'Petal.Width' = 1))
#' testLIST
#'
#' # By data.frame or data.table
#' testDFS <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = iris)
#' testDFS
#'
#' # By vector
#' testVC <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = c(1,1,1,1))
#' testVC
#'
#' # By matrix
#' testMT <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = matrix(1,1,1,1))
#' testMT
#'
#' # By records json
#' testRJ <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = '[{"sepal_length": 5.1, "sepal_width": 3.5, "petal_length": 1.4, "petal_width": 0.2}]')
#' testRJ
#'
#' # By split json
#' testSJ <- modelPredict(pmmlfile = 'fit_pmml.pmml',data = '{"columns": ["sepal_length", "sepal_width", "petal_length", "petal_width"], "data": [[5.1, 3.5, 1.4, 0.2]]}')
#' testSJ

pmmlFcLoad <- function(...){

  tryCatch(
    {

      pypmml <<- import('pypmml')

    }, error = function(err.msg){
      print('未在当前环境下检测到pypmml包')
      # if_confirm <- askYesNo(msg = "请确认是否下载此包？")
      if_confirm <<- menu(c("Yes", "No"), title="请确认是否下载此包？")

      if (if_confirm %in% c(1,'Yes')){

        py_install(packages = 'pypmml',pip = T)

      }else if(!(if_confirm %in% c(1,'Yes',2,'No'))){

        stop("未能理解您的意思，如果想继续使用，请再次使用此函数。")

      }

    }

  )

  modelLoad <<- pypmml$Model$load

  modelPredict <<- function(model = NULL,pmmlfile = NULL,data){

    if(is.null(model) & is.null(pmmlfile) == F){

      fit <- modelLoad(pmmlfile)

      result <- fit$predict(data)

    }else if (is.null(model) == F & is.null(pmmlfile)){

      result <- model$predict(data)

    }else if (is.null(model) == F & is.null(pmmlfile) == F){

      result <- model$predict(data)

    }else{

      stop("请验证参数输入是否正确。")

    }

    return(result)

  }

}
