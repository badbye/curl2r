#' @include utils.R
NULL

#' parse the arguments of curl command
#' @export
parse_args <- function(args){
  res = list()
  res$url = args[2]
  args = args[3:length(args)]
  if (length(args) %% 2 != 0){
    args = args[1:(length(args) - 1)]
  }
  arg_names = args[seq(1, length(args), by=2)]
  arg_vals = args[seq(2, length(args), by=2)]
  for (i in seq_along(arg_vals)){
    arg_name = arg_names[i]
    arg_val = arg_vals[i]
    if (arg_name %in% c('-H', '--header')){
      header = parse_header(arg_val)
      if (names(header) == 'header'){
        res$header = c(res$header, header$header)
      }else {
        res = append(res, header)
      }
    }else if (arg_name %in% c('-b', '--data-binary')){
      res$method = 'POST'
      res$data_binary = parse_data(arg_val)
    }else if (arg_name %in% c('-d', '--data')){
      res$method = 'POST'
      res$data = parse_data(arg_val)
    }else if (arg_name %in% c('-X')){
      res$method = arg_val
    }else if (arg_name %in% c('--compressed')){
      res$compressed = arg_val
    }
  }
  return(res)
}

#' parse other parameters
add_para <- function(list_name, attr, val){
  list_name[[attr]] = val
  list_name
}

#' parse header
#' @export
parse_header <- function(header){
  if (startsWith(header, 'Cookie')) {
    header = trimws(sub('Cookie:', '', header))
    return(list(cookie = parse_cookie(header)))
  }
  list(header = parse_val(header, ':', fixed=T))
}

#' parse value with spliter
parse_val <- function(string, spliter=':', ...){
  res = list()
  vec = strsplit(trimws(string), spliter, ...)[[1]]
  res[[trimws(vec[1])]] = trimws(vec[2])
  return(res)
}

#' parse cookie
parse_cookie <- function(cookie){
  args = strsplit(cookie, ';')[[1]]
  res = lapply(args, parse_val, spliter='=', fixed=T)
  do.call(c, res)
}

#' parse data
parse_data <- function(data){
  vec = strsplit(data, '&')[[1]]
  res = lapply(vec, parse_val, spliter='=', fixed=T)
  do.call(c, res)
}


main <- function(){
  para = commandArgs(trailingOnly = TRUE)
  para = parse_args(para)
  if (!is.null(para$method) && para$method == 'POST'){
    doc = post_template(para)
  }else{
    doc = get_template(para)
  }
  doc = paste('library(httr)', doc, sep = '\n')
  cat('\n\n\n')
  invisible(
    formatR::tidy_source(text = doc, indent=4, output=TRUE,width.cutoff = 20)
  )
}
# main()
