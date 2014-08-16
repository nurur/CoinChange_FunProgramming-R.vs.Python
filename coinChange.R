# R script that takes an integer in between 1 to 99 as the input 
# It returns the number of quarters, dimes, nickles, and pennies 
# The sum of the values of coins is equal to the input integer
#
#
# To run the script, type in the shell:
# Rscript choinChange.R  99
#
#
# Auxiliary Function to do the calculation  
processChange <- function(balance,denom){
			numOfCoin <- balance%/%denom      # R floor division 
	      		remainBal <- balance%%denom       # R modulous
			return (c(numOfCoin, remainBal))
			}

# Main Function 
makeChange <- function(amountChange){
	   # Create a list 
	   coinName   <- c('quarter','dime','nickle','penny') 
    	   coinVal    <- c(25,10,5,1)
	   changeList <- list(key=coinName, val=coinVal)

    	   # Create empty vectors to save the results 
    	   a <- vector()
    	   b <- vector()

	   # Loop over the changeList
    	   # processChange returns a two elements vector 
    	   # the second element of the vector is the residual
    	   # assign the residual to the variable amountChange
    	   # append the number of coins to the empty list 

	   d = length(changeList$key)
    	   for (i in 1:d){
               res = processChange(amountChange, changeList$val[i])  
               amountChange = res[2]     
              
               a[i] <- res[1] 
	       b[i] <- coinName[i] #changeList$key[i])         
 	    }

	    coinList <- list(Num=a, Name=b)
	    return (coinList)
}



argv <- commandArgs(TRUE)
amountToChange <- as.numeric(argv[1])
cat('\n')
cat('The amount to change is,', amountToChange, ', cents.','\n')
cat('The output is:', '\n')
coinList = makeChange(amountToChange)

cat('[')
for (i in 1:length(coinList$Num)){
    cat('(', coinList$Num[i], ', ', coinList$Name[i], '),', sep='')
}
cat(']', '\n')