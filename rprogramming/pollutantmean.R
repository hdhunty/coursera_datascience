pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    ## full.names = TRUE will prepend path to file name
    files_list <- list.files(directory, full.names=TRUE)
    
    ## create an empty dataframe
    data <- data.frame()
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    ## loop through 'id' and rbind all indicated csvs together
    ##for (i in id) {
    ##    data <- rbind(data, read.csv(files_list[i]))
    ##}

    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    ## get the column of "data" that matches pollutant
    data_subset <- data[[pollutant]]

    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    ## na.rm=TRUE removes NA values
    mean(data_subset, na.rm=TRUE)
}