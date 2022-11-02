# UrlDeCode
DELPHI 编写的dll 其他程序调用进行 URLDECODE 和 ENCODE

# 使用说明
 1. powerbuilder 调用语法
 2. 其他的语言可以参考 

外部变量：
```
FUNCTION string urldecode(string data) Library "UrlCode.dll" alias for "urldecode;ansi" 
FUNCTION string urlencode(string data) Library "UrlCode.dll" alias for "urlencode;ansi" 
```

调用方式：
```
    ls_in = '{"article_number":"10010001","bar_code":"6927091100089","brand":"-","categroy":"-","height":0,"item_code":"10010001","item_name":"头孢拉定胶囊","item_pic":"-","length":0,"prime_price":0,"sale_price":4.8,"unit":"盒","volume":0,"weight":0,"width":0}'
    ls_return = urlencode(ls_in)
    messagebox('ll',ls_return)
    ls_return = urldecode(ls_return)
    messagebox('ll',ls_return)
```
