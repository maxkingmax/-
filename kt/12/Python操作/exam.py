#exam.py v1.2 -- 根据年龄判断票价

#定义票价函数
def pj(n):    
    __②__ n>120 or n<=0:
        L="请输入正确的年龄！"#用变量L表示票价
    elif n>=60:
        L="票价为30元"         
    elif n>=12:
        L="票价为60元"
    elif n<=6:          #③此行需要调试 
        L="票价为10元"          
    else:                         
        L="不需购票！"
    return L

#主程序
g=__①__(input("请输入游客年龄："))  
piaoJia=pj(g)               #调用pj()函数
print(“您：%s” %piaoJia)   #④此行需要调试
 
