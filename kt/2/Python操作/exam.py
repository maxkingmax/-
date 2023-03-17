#Exam.py v1.0 -- 根据体温数值，快速筛选体温异常者

wenDu=__①__(input("请输入一个体温值(℃)："))
if wenDu>37.1:
    jieGuo="体温偏高，建议到医院进一步检查！"
elif wenDu<=35.8:             #③此行需要调试
    jieGuo="体温正常！"
__②__:
    jieGuo="体温偏低！建议重新测量体温！"
print(“初步判断此同学的状况为：%s”%jieGuo)  #④此行需要调试 
 
