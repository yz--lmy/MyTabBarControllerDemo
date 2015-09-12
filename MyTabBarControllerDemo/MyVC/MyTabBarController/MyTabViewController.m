//
//  MyTabViewController.m
//  MyXmppDemo
//
//  Created by zfgj on 14-8-29.
//  Copyright (c) 2014年 lmy. All rights reserved.
//

#import "MyTabViewController.h"

@interface MyTabViewController ()

@end

@implementation MyTabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"MyTabViewController viewWillAppear");
    NSString * versionStr = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    if (![[NSUserDefaults standardUserDefaults] objectForKey:versionStr])
    {
        GuideViewController *guideVC = [[GuideViewController alloc] init];
        [self.navigationController presentViewController:[[UINavigationController alloc] initWithRootViewController:guideVC] animated:NO completion:nil];
    }

    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"MyTabViewController viewDidAppear");
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	self.view.backgroundColor = [UIColor orangeColor];
     NSLog(@"MyTabViewController viewDidLoad");
    _mainView = [[UIView alloc] initWithFrame:CGRectMake(0, iSIOS7?0:-20, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT-51)];
    _mainView.userInteractionEnabled = YES;
    [_mainView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_mainView];
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, UI_SCREEN_HEIGHT-50-(iSIOS7?0:20), UI_SCREEN_WIDTH, 50)];
    [_bottomView setBackgroundColor:RGBA(255, 255, 255, 1)];
    [self.view addSubview:_bottomView];
    
    UIImageView *lineImageView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, 1)];
    [lineImageView setBackgroundColor:[UIColor grayColor]];
    [_bottomView addSubview:lineImageView];
    
    [self createBottomBtns];
    
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getCarNumber:) name:@"getCarNumber" object:nil];
	
}
#pragma mark - 底部 View Button
- (void)createBottomBtns
{
    NSArray * normalImageAry = [self.bottomDic objectForKey:NormalImage];
    NSArray * selectedImageAry = [self.bottomDic objectForKey:SelectedImage];
    NSArray * itemTitleAry = [self.bottomDic objectForKey:ItemTitle];
    CGFloat itemWidth = UI_SCREEN_WIDTH/normalImageAry.count;
    // 创建底部按钮
    for (NSInteger i = 0; i < normalImageAry.count; i ++)
    {
        
        UIButton *bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [bottomBtn setFrame:CGRectMake(i*itemWidth, 0, itemWidth, 50)];
        [bottomBtn setBackgroundColor:[UIColor clearColor]];
//        [bottomBtn setImage:[UIImage imageNamed:@"ItemBG_H.png"] forState:UIControlStateSelected];
//        [bottomBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [bottomBtn setTag:i+MyTabBottomTag];
        [bottomBtn addTarget:self action:@selector(bottomButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:bottomBtn];
        
        if (itemTitleAry.count==normalImageAry.count)
        {
            UIButton *btnImageView = [UIButton buttonWithType:UIButtonTypeCustom];
            [btnImageView setFrame:CGRectMake(0, 0, 28, 28)];
            [btnImageView setUserInteractionEnabled:NO];
            [btnImageView setImage:[UIImage imageNamed:[normalImageAry objectAtIndex:i]] forState:UIControlStateNormal];
            [btnImageView setImage:[UIImage imageNamed:[selectedImageAry objectAtIndex:i]] forState:UIControlStateSelected];
            [btnImageView setCenter:CGPointMake(bottomBtn.width/2.0, bottomBtn.height/2.0-7)];
            [btnImageView setTag:1101];
            [bottomBtn addSubview:btnImageView];
            
            UIButton *btnTitleView = [UIButton buttonWithType:UIButtonTypeCustom];
            [btnTitleView setFrame:CGRectMake(0, 30, bottomBtn.width, 20)];
            [btnTitleView setUserInteractionEnabled:NO];
            [btnTitleView.titleLabel setFont:[UIFont systemFontOfSize:12.0f]];
            [btnTitleView setTitle:[itemTitleAry objectAtIndex:i] forState:UIControlStateNormal];
            [btnTitleView setTitleColor:[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1.0f] forState:UIControlStateNormal];
            [btnTitleView setTitleColor:RGBA(0,129,227, 1) forState:UIControlStateSelected];
            [btnTitleView setTag:1102];
            [bottomBtn addSubview:btnTitleView];
            if (i==0)
            {
                [btnImageView setSelected:YES];
                [btnTitleView setSelected:YES];
            }
            
        }
        else
        {
            [bottomBtn setImage:[UIImage imageNamed:[normalImageAry objectAtIndex:i]] forState:UIControlStateNormal];
            [bottomBtn setImage:[UIImage imageNamed:[selectedImageAry objectAtIndex:i]] forState:UIControlStateSelected];
            
        }
        
        if (i == 0)
        {
            // 先设置首页按钮为选中
            _selectedBtn = bottomBtn;
            [bottomBtn setSelected:YES];
            [self bottomButtonTouchUpInside:bottomBtn];
        }
    }
    _carNumLab = [[UILabel alloc] initWithFrame:CGRectMake(_bottomView.width-30,0,25,25)];
    _carNumLab.textColor = [UIColor whiteColor];
    _carNumLab.textAlignment = NSTextAlignmentCenter;
    _carNumLab.font = [UIFont boldSystemFontOfSize:10];
    _carNumLab.adjustsFontSizeToFitWidth = YES;
    _carNumLab.backgroundColor = [UIColor redColor];
    _carNumLab.layer.cornerRadius = 12.5;
    _carNumLab.layer.masksToBounds = YES;
    _carNumLab.hidden = YES;
    [_bottomView addSubview:_carNumLab];
}
- (void)bottomButtonTouchUpInside:(UIButton *)btn
{
    if (_showVC.view.tag == btn.tag)
    {
        return;
    }
    
//    UIView *viewBottom = btn.superview;
//    NSArray *bottomBtnArray = [viewBottom subviews];
//    for(UIButton *bottomBtn in bottomBtnArray)
//    {
//        if([bottomBtn isKindOfClass:[UIButton class]])
//        {
//            [bottomBtn setEnabled:YES];
//        }
//    }
//    [btn setEnabled:NO];//此处应注意[btn setEnabled:NO] 会导致 btn的 setSelected为NO 并导致 btn的 setSelected 方法不可用 ，具体原因不清楚，应该是[btn setEnabled:NO]时系统内部做了某些处理(使btn的状态变为UIControlStateNormal 并使btn对任何事件都不再有反应)，导致btn的某些属性发生了变化并且不可用.此处务必小心这个陷阱，必要时可注释掉。
    
    // 手指在按钮内收起
    UIViewController *viewController = nil;
//  ********  使用vcArray这种方式  Begin **********  //
    
    NSString * vcClassStr = [self.vcArray objectAtIndex:btn.tag - MyTabBottomTag];
    Class vcClass = NSClassFromString(vcClassStr);
    viewController = [[vcClass alloc] init];
   
//  ********  使用vcArray这种方式  End **********  //
    
//  ********  使用globalVCAry这种方式  Begin **********  //
    
//    viewController = [self.globalVCAry objectAtIndex:btn.tag - MallRootBottomTag];
    
//  ********  使用globalVCAry这种方式  End **********  //
 
    
    
    // ****** 为每个主VC创建一个NavigationController  Begin   ******  //
    
    //此处可以把每个主VC都加到各自的一个NavigationController里 ，每个主VC对应一个NavigationController(使用这种方式时要把UINavigationController解注释以便在合适的时候隐藏自定义的tabBar；使用这种方式时，当在主VC push一个页面时 可以用[self.navigationController pushViewController:xxVC animated:YES] 的方式直接push xxVC页面  并且这种方式每个主VC的viewWillAppear每次都会被调用)；（也可以只生成一个NavigationController 把MyTabViewController作为RootViewController添加到NavigationController里，所有主VC都共用这个NavigationController，目前就是采用的这种方式，使用这种方式时，当在主VC push一个页面时 不可以用[self.navigationController pushViewController:xxVC animated:YES] 的方式直接push xxVC页面，因为此时主VC不在NavigationController堆栈内，可以用 UINavigationController *rootNAV = (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController]; [rootNAV pushViewController:logVC animated:YES]这种方式去push xxVC页面  这种方式主VC的viewWillAppear有时不会被调用）。关于viewWillAppear的调用  UIViewController的viewWillAppear是在UIViewController对象的视图即将加入窗口时才会调用的，当VC的父VC不在当前窗口显示时这时去加载VC  VC的viewWillAppear是不会调用的（因为它的父VC都不在窗口显示作为子VC自然也不会加载到或者即将加载到窗口中显示出来，在子VC开始准备加载到父VC上时 系统应该会判断即将作为父VC的VC是否在当前窗口上，在的话就表明子VC即将在当前窗口显示这样子VC的viewWillAppear就会调用；反之当即将作为父VC的VC不在当前窗口上就表明子VC不能即将在当前窗口显示这样VC的viewWillAppear就不会调用），除非它的父VC是已经在当前窗口中的 。
    
//    NavViewController * nav = [[NavViewController alloc] initWithRootViewController:viewController];
//    nav.delegate = self;
    
    
     // ****** 为每个主VC创建一个NavigationController  End   ******  //
    
    
    if(_showVC && viewController)
    {
        CATransition *transition = [CATransition animation];
        transition.duration = 0.3f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//动画开始的快慢
        transition.type = @"reveal";
        BOOL animationFlag = _showVC.view.tag > btn.tag ;
        transition.subtype = animationFlag ? kCATransitionFromLeft : kCATransitionFromRight;
        [transition setDelegate:self];
        [_mainView.layer addAnimation:transition forKey:nil];  //再想添加CA动画的view层上添加此代码
    }
    
    if (viewController)
    {
        for (UIButton * butt in _selectedBtn.subviews)//此处遍历_selectedBtn的subviews时应注意_selectedBtn的subviews不一定只有自己添加的那两个Btn，一个UIButton自己本身就还可能含有其他类型的子View 因为你不知道系统内部UIButton是如何创建的。
        {
            if ([butt isKindOfClass:[UIButton class]])
            {
                [butt setSelected:NO];
            }

        }
        [_selectedBtn setSelected:NO];
        for  (UIButton * button in btn.subviews)
        {
            if ([button isKindOfClass:[UIButton class]])
            {
                [button setSelected:YES];
            }

        }
        [btn setSelected:YES];
        _selectedBtn = btn;
        
        [viewController.view setTag:btn.tag];
        [_mainView addSubview:viewController.view];
        [_showVC.view removeFromSuperview];
        
        _showVC = nil;
        _showVC = viewController;
        
        
    }
   
    // ****** 另一种动画效果  Begin   ******  //

//    viewController.view.tag = btn.tag;
//    if (_showVC)
//    {
//        for (UIButton * butt in _selectedBtn.subviews)
//        {
//            [butt setSelected:NO];
//        }
//        for  (UIButton * button in btn.subviews)
//        {
//            [button setSelected:YES];
//        }
//        [btn setSelected:YES];
//        _selectedBtn = btn;
//        btn.superview.userInteractionEnabled = NO;
//        viewController.view.left = viewController.view.tag > _showVC.view.tag?_mainView.width:-_mainView.width;
//        
//        UIView *viewBlack = [[UIView alloc] initWithFrame:_mainView.bounds];
//        [viewBlack setBackgroundColor:[UIColor blackColor]];
//        [viewBlack setAlpha:0.0f];
//        [_mainView addSubview:viewBlack];
//        
//        [_mainView addSubview:viewController.view];
//        [UIView animateWithDuration:0.5 animations:^
//         {
//             [_showVC.view setTransform:CGAffineTransformScale(_showVC.view.transform, 0.9, 0.9)];
//             [viewBlack setAlpha:0.8f];
//             viewController.view.left = 0;
//         }
//                         completion:^(BOOL finished)
//         {
//             [_showVC.view removeFromSuperview];
//             [viewBlack removeFromSuperview];
//             _showVC = viewController;
//             btn.superview.userInteractionEnabled = YES;
//         }];
//    }
//    else
//    {
//        [_mainView addSubview:viewController.view];
//        _showVC = viewController;
//        for  (UIButton * button in btn.subviews)
//        {
//            [button setSelected:YES];
//        }
//        [btn setSelected:YES];
//    }
    
    // ****** 另一种动画效果  End   ******  //
    
}

#pragma mark 在某个非主VC的页面跳转到某个主VC
+(void)showMainVCWithTag:(NSInteger)tag
{
    UINavigationController *rootNAV = (UINavigationController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    if ([rootNAV isKindOfClass:[UINavigationController class]])
    {
        if (rootNAV.viewControllers.count >= 2)
        {
            MyTabViewController *tabVC = [rootNAV.viewControllers objectAtIndex:0];
            if ([tabVC isKindOfClass:[MyTabViewController class]])
            {
                if (rootNAV.visibleViewController != tabVC)
                {
                    [rootNAV popToViewController:tabVC animated:NO];
                }
                
                [tabVC bottomButtonTouchUpInside:(UIButton *)[tabVC.view viewWithTag:tag]];
            }
        }
    }

}


//      ******* 这里是针对于商城APP购物车显示数量小图标的操作 Begin **********  //


//修改购物车图标的数字
//+(void) changeCarCountValuesWithNum:(NSInteger)num
//{
//    _carNumLab.hidden = num<=0;
//    if (num>99)
//    {
//        _carNumLab.text = @"99+";
//    }
//    else
//    {
//        _carNumLab.text = [NSString stringWithFormat:@"%i",num];
//    }
//}
//
//
//-(void)getCarNumber:(NSNotification *)not
//{
//    id a = [not userInfo];
//    NSLog(@"a = %@",a);
//    
//    NSString *getCarNUmber = [a objectForKey:@"ShopCartNum"];
//    
//    _carNumLab.hidden = [getCarNUmber intValue]<=0;
//    if ([getCarNUmber intValue]>99)
//    {
//        _carNumLab.text = @"99+";
//    }
//    else
//    {
//        _carNumLab.text = [NSString stringWithFormat:@"%i",[getCarNUmber intValue]];
//    }
//    
//}
//
//+(NSString *)returnCarNum
//{
//    return _carNumLab.text;
//}


//         ******* 这里是针对于商城APP购物车显示数量小图标的操作 End **********  //



#pragma mark  UINavigationControllerDelegate
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    NSLog(@"navigationController  willShowViewController");
//    if (viewController != [navigationController.viewControllers firstObject])
//    {
//        _bottomView.hidden = YES;
//    }
//    else
//    {
//        _bottomView.hidden = NO;
//    }
//}
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    
//    NSLog(@"navigationController__%p  viewController__%p",navigationController,viewController);
//    NSLog(@"navigationController  didShowViewController");//不知道为什么有时候会调用两次
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc
{
    _carNumLab = nil;
    _mainView = nil;
    _bottomView = nil;
    _showVC = nil;
    _selectedBtn = nil;
    self.bottomDic = nil;
    self.globalVCAry = nil;
    self.vcArray = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
