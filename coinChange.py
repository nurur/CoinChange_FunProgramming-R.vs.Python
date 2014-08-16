# Python script that takes an integer in between 1 to 99 as the input 
# It returns the number of quarters, dimes, nickels, and pennies 
# The sum of the values of coins is equal to the input integer 
#
#
# import sys package for command line input 
# import collections package for Ordered Dictionary
import sys, collections 


# Auxiliary Function to do the calculation  
def processChange(balance,denom):
    numOfCoin = balance/denom           # python integer division 
    remainBal = balance%denom           # python modulus 
    return (numOfCoin, remainBal)


# Main Function 
def makeChange(amountChange):
    # Create an ordered list 
    changeList= collections.OrderedDict()
    changeList['quarter']=25
    changeList['dime']=10
    changeList['nickel']=5
    changeList['penny']=1

    # Create an empty list to save the results 
    coinList=[]
    
    # Loop over the ordered list
    # processChange returns a two elements tuple
    # the second element of the tuple is the residual
    # assign the residual to the variable amountChange
    # append the number of coins to the empty list 
    for key,val in changeList.items():
        res = processChange(amountChange, val)  
        amountChange = res[1]                   
        coinList.append((res[0], key))          
    return coinList


if __name__=='__main__':
    amountToChange = int(sys.argv[1])
    print ''
    print 'The amount to change is,', amountToChange, ', cents.'
    print 'The output is:'
    coinList = makeChange(amountToChange)
    print coinList
