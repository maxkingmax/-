#Exam.py v1.0 -- 根据列车速度判断列车类型

#定义函数
def fenLei(s):                    
    if __①__ and s>=250:
        L="高铁"
    __②__ s<250 and s>=200:
        L="动车"
    else:                         
        L="不是高速列车！请输入大于200小于350的数值！"
    return L

#主程序
g=float(input("请输入一个列车速度值(km/h)："))
________③___________               #调用fenLei()函数
print(“列车类型为：%s” %lieChe)   #④此行需要调试
 
