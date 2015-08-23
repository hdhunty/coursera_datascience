add2 <- function(x, y) {
    x + y
}

above10 <- function(x) {
    use <- x > 10
    x[use]
}

above <- function(x, n = 10) {
    use <- x > n
    x[use]
}

columnmean <- function(y, removeNA = TRUE) {
    nc <- ncol(y)
    means <- numeric(nc)
    for (i in 1:nc) {
        means[i] <- mean(y[,i], na.rm = removeNA)
    }
    means
}

weightmedian <- function(directory, day) {
    # creates a list of files
    files_list <- list.files(directory, full.name=TRUE)
    # creats an empty data frame
    dat <- data.frame()
    for (i in 1:5) {
        # loops through the files, rbinding them together
        dat <- rbind(dat, read.csv(files_list[i]))
    }
    # subsets the rows that match the 'day' argument
    dat_subset <- dat[which(dat[, "Day"] == day),]
    # identifies the median weight and strips out the NAs
    median(dat_subset[, "Weight"], na.rm=TRUE)
}