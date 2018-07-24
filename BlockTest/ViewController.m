//
//  ViewController.m
//  BlockTest
//
//  Created by AndyDeng on 2018/7/19.
//  Copyright © 2018年 AndyDeng. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"fdsafsa");
    NSLog(@"%@",[NSThread currentThread]);
    __block long x = 0;
    dispatch_semaphore_t signal = dispatch_semaphore_create(1);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"fdsfda");
        
        int64_t delayInSeconds = 3.0;      // 延迟的时间
        /*
         *@parameter 1,时间参照，从此刻开始计时
         *@parameter 2,延时多久，此处为秒级，还有纳秒等。10ull * NSEC_PER_MSEC
         */
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            // do something
            dispatch_semaphore_signal(signal);
            dispatch_semaphore_signal(signal);
        });
        
        
        x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
        x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
        NSLog(@"dddd");
        
    });
  
//    __block NSString *a = @"Andy";
//    NSLog(@"1%p", &a);
//    void (^foo)(void) = ^{
//        a = @"Deng";
//        NSLog(@"3%p", &a);
//    };
//    foo();
//    NSLog(@"2%p", &a);
    
    
    dispatch_queue_t dispatchQueue = dispatch_queue_create("ted.queue.next", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t dispatchGroup = dispatch_group_create();
    dispatch_group_async(dispatchGroup, dispatchQueue, ^(){
        NSLog(@"dispatch-1");
    });
    dispatch_group_async(dispatchGroup, dispatchQueue, ^(){
        NSLog(@"dspatch-2");
    });
    dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^(){
        NSLog(@"end");
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
