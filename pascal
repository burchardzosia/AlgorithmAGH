#wizard pascal has n plates
#each stack contains exactly k plates
#we have list "stack" stack[0]-there is a list of plates on the stack 0
#we have to choose exactly p plates
#if you want to take away you have to take all of them before him

def pascal(stack,p):
    tab=[[0 for i in range(p+1)]for j in range(len(stack[0]))]
    result=[[0 for i in range(p+1)]for j in range(len(stack[0]))]
    for i in range(len(stack[0])):
        for j in range(1,p+1):
            result[i][j]=result[i][j-1]+stack[j-1][i]
    for i in range(1,p+1):
        tab[0][i]=tab[0][i-1]+stack[i-1][0]

    for i in range(1,len(stack[0])):
        for j in range(1,p+1):
            wynik=tab[i-1][j]
            wynik=max(wynik,result[i][j])
            for k in range(1,j):
                wynik=max(tab[i-1][k]+result[i][j-k],wynik)
            tab[i][j]=wynik
    print(tab[len(stack[0])-1][p])

stack=[[7,6,8],[8,5,3],[2,2,2],[4,1,7],[6,3,2]]
p=5
pascal(stack,p)
