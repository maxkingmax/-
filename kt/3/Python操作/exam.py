#Exam.py v1.0 -- 计算初二级部轻信谣言人数的占比

sum=0
zongShu=__①__(input("请输入初二级部总人数：") )
for i in range(0,5)         #③此行需要调试   
    renShu=int(input('请输入'+str(__②__)+'班轻信谣言人数：'))              
    sum+=renShu                
zhanBi=sum-zongShu          #④此行需要调试 
print("初二级部轻信谣言人数的占比为：%.2f"%(zhanBi*100),"%")     
