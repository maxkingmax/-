#Exam.py -- 计算列车速度的平均值

speeds=[]
sum=0
n=int(input("王飞记录了几个列车速度值？\n") )
for i in range(n):
    x=__①__(input('请输入第'+str(__②__)+'个速度值（km/h）：'))
    speeds.append(x)                 
for k in range(n):
    sum+=speeds[k]
________③___________                #根据算术平均值公式，计算列车速度的平均值
print("这辆列车速度的平均值约为：.2f" %average)      #④此行需要调试
