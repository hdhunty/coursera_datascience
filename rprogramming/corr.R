corr <- function(directory, threshold = 0) {
    ## create an empty numeric vector
    correlation <- numeric()
    
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    files_list <- list.files(directory, full.names=TRUE)
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## iterate through all files
    for (file in files_list) {
        ## code borrowed from complete.R
        tmp <- read.csv(file)
        tmp_complete <- complete.cases(tmp)
        ## only complete cases
        tmp <- tmp[tmp_complete,]
        num_complete <- nrow(tmp)
        
        if (num_complete >= threshold) {
            tmp_corr <- cor(tmp$nitrate, tmp$sulfate)
            ## add calculated correlation to correlation vector
            correlation <- c(correlation, tmp_corr)
        }
    }
    correlation
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
}