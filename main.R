source("header.R")

#' @post /validator
function(req) {
  
  cat_rule("Receive validator. Prepare to validate.")
  
  cli::cat_line("连接MongoDB数据库...", col = "yellow")
  
  rd <- est_mongo_conn("Mongo")
  
  dat <- rd$find()
  
  paste("共有", nrow(dat), "条数据") %>% 
    cli::cat_boxx(col = "green")
  
}