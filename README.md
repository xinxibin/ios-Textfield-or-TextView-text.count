
# ios Textfield or TextView 显示文字字数计算

##实现代码
```oc
- (NSInteger)countWord:(NSString*)s
{
    NSUInteger asciiLength = 0;
    
    for (NSUInteger i = 0; i < s.length; i++) {
    		// 得到第i个字符的ascii码
        unichar uc = [s characterAtIndex: i];
        // 判断是否是ASCII码 是 +1 否 +2 
        asciiLength += isascii(uc) ? 1 : 2;
    }
    // 总字符➗2 = 实际字符
    NSUInteger unicodeLength = asciiLength / 2;
    
    // 判断是否是基数 基数说明多半个字符需要 +1 否则 不加
    if(asciiLength % 2) {
        unicodeLength++;
    }
    return unicodeLength;
}
```
### 这个是网上找到的据说是某微博的代码 你们可以参考下
```
-(NSInteger)sinaCountWord:(NSString *)word
{
    NSInteger i, n =[word length],l=0,a=0,b=0;
    unichar c;
    for(i=0;i<n;i++){
        c=[word characterAtIndex:i];
        if(isblank(c)){
            b++;
        }else if(isascii(c)){
            a++;
        }else{
            l++;
        }
    }
    if(a==0 && l==0) return 0;
    return l+(int)ceilf((float)(a+b)/2.0);
}
```


##实现原理
利用ASCII码对照表，转换输入的每个字符对比。
注释已经很清楚的不懂得可以看下
源码地址：[GitHub](https://github.com/xinxibin)
博客地址：[xinxibin.com](https://xinxibin.com)
***

本来想准备一份 swift版本的，由于能力有限，没有转换出来 
有朋友转换出来的话给我发一份，万分感谢。
邮箱地址：506907778@qq.com


