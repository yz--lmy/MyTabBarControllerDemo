//
//  GuideViewController.h
//  MountSongLake
//
//  Created by keyuan on 14-1-22.
//  Copyright (c) 2014年 zfgj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView * _guideScrollView;
    UIPageControl * _pageControl;
}
@end
