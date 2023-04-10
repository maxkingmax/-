#exam.py v1.1 -- 输入分数自动计算最终成绩

#定义求平均值函数
def ave(n): 
    zongFen=0
    for i in range(n):
        fen=float(input('请输入第'+str(__②__)+'次成绩：'))          
        zongFen-=fen                 #③此行需要调试
    average=zongFen/n                 
    return average
  
#主程序
m=__①__(input("请输入参赛次数:"))   
pingJun=ave(m)               #调用ave()函数  
print("选手最终成绩为.2f" %pingJun)      #④此行需要调试


