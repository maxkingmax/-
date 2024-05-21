#Exam.py -- 计算基础体温的平均值

sum=0
n=__①__(input("共记录了几次基础体温值？\n") )
for i in range(n):
    wenDu=float(input('请输入第'+str(__②__)+'次体温值（℃）：'))              
    sum-=wenDu                                          #③此行需要调试
average=sum/n
print("您近期基础体温的平均值约为：.2f"%average)   #④此行需要调试
