//
//  GuideViewController.m
//  MountSongLake
//
//  Created by keyuan on 14-1-22.
//  Copyright (c) 2014年 zfgj. All rights reserved.
//

#import "GuideViewController.h"

@implementation GuideViewController

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (iSIOS7)
    {
        self.edgesForExtendedLayout =UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *imageNameArray = nil;
    if (iSIphone5)
    {
        imageNameArray = [NSArray arrayWithObjects:@"guide_1.jpg",@"guide_2.jpg", @"guide_3.jpg",@"guide_4.jpg",@"guide_5.jpg",nil];
    }
    else
    {
        imageNameArray = [NSArray arrayWithObjects:@"guide_1.jpg",@"guide_2.jpg", @"guide_3.jpg",@"guide_4.jpg",@"guide_5.jpg",nil];
    }
    
    _guideScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT)];
    _guideScrollView.delegate = self;
    [_guideScrollView setPagingEnabled:YES];
    _guideScrollView.backgroundColor = [UIColor clearColor];
    [_guideScrollView setBounces:NO];
    [_guideScrollView setShowsVerticalScrollIndicator:NO];
    [_guideScrollView setShowsHorizontalScrollIndicator:NO];
    [_guideScrollView setContentSize:CGSizeMake(imageNameArray.count*_guideScrollView.width, _guideScrollView.height)];
    [self.view addSubview:_guideScrollView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((self.view.width-100)/2,UI_SCREEN_HEIGHT-80,100,40)];
    _pageControl.backgroundColor = [UIColor clearColor];
    _pageControl.numberOfPages = imageNameArray.count;
    _pageControl.currentPage = 0;
    [_pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl];
    
    for (int i = 0; i < imageNameArray.count; i++)
    {
       
        UIImageView *guideImageView = [[UIImageView alloc] initWithFrame:CGRectMake(320 * i, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT)];
        [guideImageView setUserInteractionEnabled:YES];
        [guideImageView setImage:[UIImage imageNamed:[imageNameArray objectAtIndex:i]]];
        [_guideScrollView addSubview:guideImageView];
        
        if (i == imageNameArray.count - 1)
        {
            UIButton *enterButton = [[UIButton alloc] initWithFrame:CGRectMake((self.view.width-175.f)/2, _pageControl.bottom, 175.f, 35.f)];
            enterButton.backgroundColor = [UIColor clearColor];
            [enterButton setTitle:@"立即开启" forState:UIControlStateNormal];
            [enterButton setBackgroundImage:[UIImage imageNamed:@"experienceButton.png"] forState:UIControlStateNormal];
            [enterButton addTarget:self action:@selector(pressEnterButton:) forControlEvents:UIControlEventTouchUpInside];
            [guideImageView addSubview:enterButton];
        }
    }
    
}
- (void)pageChanged:(id)sender
{
    [_guideScrollView setContentOffset:CGPointMake(_pageControl.currentPage*_guideScrollView.width, 0) animated:YES];
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int offsetX = scrollView.contentOffset.x;
    int index = offsetX / scrollView.width;
    _pageControl.currentPage = index;
}
- (void)pressEnterButton:(UIButton *)enterButton
{
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    NSString *versionStr = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:versionStr];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)dealloc
{
    _pageControl = nil;
    _guideScrollView = nil;
}
@end
