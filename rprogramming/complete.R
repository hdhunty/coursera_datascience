complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    files_list <- list.files(directory, full.names=TRUE)
    
    ## create an initial empty data frame
    ## with column names id and nobs
    data <- data.frame()
   
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    ## loop through all CSV files indicated by 'id'
    for (i in id) {
        tmp <- read.csv(files_list[i])
        tmp_complete <- complete.cases(tmp)
        num_complete <- nrow(tmp[tmp_complete,])
        data <- rbind(data, c(i, num_complete))
        
        ## ugly but usable one line method
        ## num_complete <- read.csv(files_list[i])[complete.cases( \
        ## read.csv(files_list[i])),]
    }
    colnames(data) <- c("id", "nobs")
    data
}