source("header.R")

#' @post /validator
function(req) {
  
  rd <- est_mongo_conn("Mongo")
  
  dat <- rd$find()
  
  nrow(dat) %>% print()
  
}