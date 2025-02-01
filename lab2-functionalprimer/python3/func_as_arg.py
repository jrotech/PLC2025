from typing import List


def listFunc(a:int, b:int) -> List[int]:
    return [i for i in range(a, b+1)] #Create list of ints from 1 to 5, Haskell equivalent [1..5]

def applicatorFunc(inpFunc,a:int,b:int,s:str):
    if s=='s':
        return sum(inpFunc(a,b))
    else:
        return sum(inpFunc(a,b))/(b-a+1)

print(applicatorFunc(listFunc,1,10, 'a'))