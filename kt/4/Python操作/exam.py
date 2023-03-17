#Exam.py v1.0 -- 根据谣言信息被转发次数，判断是否构成犯罪

ciShu=__①__(input("请输入谣言信息的转发次数："))                   
if ciShu<=500:           #③此行需要调试
        tiShi="构成犯罪！"
elif ciShu>=0:               
        tiShi="不构成犯罪！"
__②__:                         
        tiShi="转发次数为负数，请核对后输入！"
print(“该谣言信息%s”%tiShi)  #④此行需要调试
 
