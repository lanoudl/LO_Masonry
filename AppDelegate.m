//
//  AppDelegate.m
//  LO_Masonry
//
//  Created by 周琦 on 15/8/21.
//  Copyright (c) 2015年 蓝鸥科技. All rights reserved.
//

#import "AppDelegate.h"
#import "Masonry.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    // Masonry 源码：https://github.com/Masonry/Masonry
    
    // 1.居中显示一个View
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor  redColor];
    // 在使用autolayout之前 一定要先将视图添加到superview上 否则会报错
    [self.window addSubview:view1];
    // 用masonry函数来对你添加的view进行约束
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        // 设置view1居中
        make.center.equalTo(self.window);
        // 设置view1的宽高
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    /**
     *  1.mas_makeConstraints 只负责添加新增约束 Atuolayout中不能同时存在两条针对于同一对象的约束  否则会报错
     *  2.mas_updateConstraints 针对上面的情况 会更新在block中出现的约束,确保不会出现两个相同的约束
     *  3.mas_remakeConstraints 会清除之前所有的约束,仅保留最新的约束
     */
    
    /**
     *  mas_equal 除了支持NSNumber的数值类型外,就只支持CGPoint CGSize UIEdgeInsets
     */
    
    // 2.让一个view略小于其superView(边界15)
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor cyanColor];
    [self.window addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.window).with.offset(15);
//        make.left.equalTo(self.window).with.offset(15);
//        make.bottom.equalTo(self.window).with.offset(-15);
//        make.right.equalTo(self.window).with.offset(-15);
//        // 等价make.top.left.bottom.and.right.equalTo(self.window).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        // 等价
        make.edges.equalTo(self.window).with.insets(UIEdgeInsetsMake(15, 15, 15, 15));
    }];
    
    // 3.让两个高度为150的view垂直居中并且等宽等间隔排列 间隔(10) 宽度自动计算
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor purpleColor];
    [self.window addSubview:view3];
    
    UIView *view4 = [[UIView alloc] init];
    view4.backgroundColor = [UIColor yellowColor];
    [self.window addSubview:view4];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.window.mas_centerY);
        make.left.equalTo(self.window.mas_left).with.offset(10);
        make.right.equalTo(view4.mas_left).with.offset(-10);
        make.height.mas_equalTo(@150);
        make.width.equalTo(view4);
    }];
    
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.window.mas_centerY);
        make.left.equalTo(view3.mas_right).with.offset(10);
        make.right.equalTo(self.window.mas_right).with.offset(-10);
        make.height.equalTo(view3);
        make.width.equalTo(view3);
    }];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
