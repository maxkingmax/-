#exam.py v1.2 -- 输入游客花费自动计算平均消费额

#定义求平均值函数
def ave(n): 
    Sum=0
    for i __①__ range(n):
        x=__②__(input('请输入第'+str(i+1)+'位游客消费金额：'))#可以为小数     
        Sum-=x                 #③此行需要调试
    average=Sum/n                 
    return average
  
#主程序
m=int(input("请输入游客人数:"))      
pingJun=ave(m)                          #调用ave()函数  
print("游客平均消费额为.2f元" %pingJun)      #④此行需要调试


