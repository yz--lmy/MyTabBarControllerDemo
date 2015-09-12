//
//  MyTabViewController.h
//  MyXmppDemo
//
//  Created by zfgj on 14-8-29.
//  Copyright (c) 2014年 lmy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavViewController.h"
#import "GuideViewController.h"
#define MyTabBottomTag 2100
#define NormalImage @"NormalImage"  //底部一般状态下的图片
#define SelectedImage @"SelectedImage" //底部选中状态下的图片
#define ItemTitle    @"ItemTitle"  //底部标题

static UILabel * _carNumLab;
@interface MyTabViewController : UIViewController<UINavigationControllerDelegate>
{
    UIView * _mainView;
    UIView * _bottomView;
    UIViewController * _showVC;
    UIButton * _selectedBtn;
    
}

@property(nonatomic,strong)NSDictionary * bottomDic;
//  ******  传入VC的两种方式，选一种  Begin ******  //

@property(nonatomic,strong)NSArray * vcArray;//传入VC类名即可，每次点击TabBar上的按钮会重新生成一个VC 新生成VC将被添加到MyTabViewController上去，之前的VC会被释放，内存方面相对与使用globalVCAry传入VC对象这种方式会更好一点
@property(nonatomic,strong)NSArray * globalVCAry;//传入VC对象，不会每次点击TabBar上的按钮都生成新的VC对象，永远都是被MyTabViewController引用的那个，这样就导致MyTabViewController上的几个主VC在程序结束前永远不会释放，也不会重新生成，一直只是被MyTabViewController引用的那个。（这种方式和系统UITabBarController一样）

//  ******  传入VC的两种方式，选一种  End ******  //

+(void)showMainVCWithTag:(NSInteger)tag;



//         ******* 这里是针对于商城APP购物车显示数量小图标的操作 Begin **********  //
/*
//修改购物车图标的数字
+(void) changeCarCountValuesWithNum:(NSInteger)num;
+(NSString *)returnCarNum;
*/

//         ******* 这里是针对于商城APP购物车显示数量小图标的操作 End **********  //
@end
