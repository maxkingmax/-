#exam.py v1.1 -- 根据分数判定获奖等级

#定义等级分类函数
def fenLei(f):                    
    if f>=80:
        L="一等奖"         #用变量L表示等级
    elif f>=70:
        L="二等奖"
    elif f<=60:          #③此行需要调试
        L="三等奖"          
    __②__:                         
        L="未获奖！"
    return L

#主程序
g=__①__(input("请输入选手分数(可能含有小数)："))  
dengJi=fenLei(g)               #调用fenLei()函数
print(“选手获奖等级为：%s” %dengJi)   #④此行需要调试
 
