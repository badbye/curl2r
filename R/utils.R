get_template <- function(para){
  cmd = "GET('%s', add_headers(%s), set_cookies(%s))"
  sprintf(cmd,
          encodeString(para$url),
          format_vec(unlist(para$header)),
          format_vec(unlist(para$cookie)))
}

post_template <- function(para){
  cmd = "POST('%s', body=%s, add_headers(%s), set_cookies(%s))"
  sprintf(cmd,
          encodeString(para$url),
          format_vec(para$data),
          format_vec(unlist(para$header)),
          format_vec(unlist(para$cookie)))
}

format_vec <- function(vec){
  vec = sapply(seq_along(vec),
               function(i) paste(encodeString(names(vec[i]), quote = "'"), '=', encodeString(vec[i], quote="'")))
  vec = paste0(vec, collapse = ', \n    ')
  paste0('c(', vec, ')')
}

