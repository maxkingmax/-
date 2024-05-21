#Exam.py v1.0 -- 根据处理器主频判断CPU性能

zhuPin=__①__(input("请输入CPU主频（GHz）：")) 
if zhuPin>7.0:
    tiShi="市场上很少见到，请警惕假货出现！"
elif zhuPin<3.5:                            #③此行需要调试
    tiShi="为高性能处理器！"
elif zhuPin>0:
    tiShi="为中低端处理器！"
__②__:                         
    tiShi="输入数值不正确！请重新输入一个正数！"               
print("该处理器CPU：s"%tiShi)   #④此行需要调试
 
