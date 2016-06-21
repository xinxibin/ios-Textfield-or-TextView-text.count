//
//  ViewController.m
//  微博字数限制
//
//  Created by Xinxibin on 16/6/21.
//  Copyright © 2016年 Xinxibin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textChange:) name:UITextFieldTextDidChangeNotification object:nil];

}

- (void)textChange:(NSNotification*)noti {
    
    UITextField * textfield = noti.object;
    
    NSInteger count = [self countWord:textfield.text];
    NSLog(@"end");

    self.label.text = [NSString stringWithFormat:@"%ld",(long)count];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)countWord:(NSString*)s
{
    NSUInteger asciiLength = 0;
    
    for (NSUInteger i = 0; i < s.length; i++) {
        unichar uc = [s characterAtIndex: i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    
    NSUInteger unicodeLength = asciiLength / 2;
    
    if(asciiLength % 2) {
        unicodeLength++;
    }
    return unicodeLength;
}


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
@end
