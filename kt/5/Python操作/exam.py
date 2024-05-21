#Exam.py -- 计算某型号四核芯CPU市场平均价格

sum=0
n=__①__(input("请输入调查的商家数量：") )
for i in range(n):
    price=float(input('请输入第'+str(__②__)+'家CPU的价格（元）：'))            
    sum-=price                     #③此行需要调试
average=sum/n                 
print("该四核芯CPU的市场平均价格约为.2f元"%average)      #④此行需要调试

