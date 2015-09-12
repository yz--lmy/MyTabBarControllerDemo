//
//  MallNavgationBar.m
//  ComeHere
//
//  Created by zfgj on 14-7-10.
//  Copyright (c) 2014年 keyuan. All rights reserved.
//

#import "MallNavgationBar.h"

@implementation MallNavgationBar

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:CGRectMake(0, iSIOS7 ? 0 : -20, UI_SCREEN_WIDTH, 64)];
    if (self)
    {
        [self setBackgroundColor:RGBA(203, 203, 203, 1)];
        
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton setFrame:CGRectMake(0, 20, 40, 40)];
        [_leftButton setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_leftButton];
        
        _leftTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(30,20,60, 44)];
        [_leftTitleLab setBackgroundColor:[UIColor clearColor]];
        [_leftTitleLab setFont:[UIFont boldSystemFontOfSize:16.0f]];
        [_leftTitleLab setTextColor:RGBA(156.0f,156.0f,156.0f,1.0f)];
        [_leftTitleLab setTextAlignment:NSTextAlignmentLeft];
        [self addSubview:_leftTitleLab];
        
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setFrame:CGRectMake(UI_SCREEN_WIDTH-60, 20, 60, 40)];
        [_rightButton setBackgroundColor:[UIColor clearColor]];
        [_rightButton setTitleColor:RGBA(0,165,222,1) forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont boldSystemFontOfSize:15.0f];
        [self addSubview:_rightButton];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 200, 44)];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:22.0f]];
        [_titleLabel setTextColor:RGBA(0,165,222,1)];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_titleLabel];
        
        

    }
    return self;
}
-(void)dealloc
{
    _leftButton = nil;
    _leftTitleLab = nil;
    _rightButton = nil;
    _titleLabel = nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
