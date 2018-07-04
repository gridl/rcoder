##
##                        CONCATENATE R FILES
##

library(purrr)
library(magrittr)
library(readr)

r_files <- list.files(path = "data/repos", pat = "\\.r", ignore.case = TRUE,
                      recursive = TRUE, full.names = TRUE)
text_train <- map_chr(r_files, readr::read_file) %>% paste(collapse = "")

# R data format
saveRDS(text_train, "data/r_scripts_text.rds")

# Plain text format
write(text_train, "data/r_scripts_text.txt")