violations.data <- read.csv("/Users/elizabethsecor/Documents/code-for-america/Violations-2012.csv", header=TRUE)
violations.data$violation_date <- as.Date(violations.data$violation_date)

results <- matrix(NA, 9, 4)
colnames(results) <- c("Category", "Number of Violations", "Earliest Violation Date", "Latest Violation Date")

category.summary <- table(violations.data$violation_category)
results[,1] <- names(category.summary)
results[,2] <- category.summary

minimums <- c(by(violations.data$violation_date, violations.data$violation_category, min))
results[,3] <- as.character(as.Date(as.numeric(minimums), origin = "1970-01-01"))

maximums <- by(violations.data$violation_date, violations.data$violation_category, max)
results[,4] <- as.character(as.Date(as.numeric(maximums), origin = "1970-01-01"))
results

write.csv(results, "/Users/elizabethsecor/Documents/code-for-america/Violation-Statistics.csv", quote=FALSE, row.names=FALSE)