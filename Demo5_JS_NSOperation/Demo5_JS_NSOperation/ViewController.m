//
//  ViewController.m
//  Demo5_JS_NSOperation
//
//  Created by  江苏 on 16/3/18.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSOperation* po1=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(newThreadAction) object:nil];
    NSOperation* po2=[NSBlockOperation blockOperationWithBlock:^{
        for (int i=0; i<5; i++) {
            NSLog(@"线程2---%d",i);
        }
    }];
    //创建一个队列并初始化
    NSOperationQueue* myQueue=[[NSOperationQueue alloc]init];
    //设置最大同事执行数量
    [myQueue setMaxConcurrentOperationCount:1];
    //设置依赖关系
//    [po1 addDependency:po2];
    [myQueue addOperation:po1];
    [myQueue addOperation:po2];
}
-(void)newThreadAction{
    for (int i=0; i<5; i++) {
        NSLog(@"线程1---%d",i);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
