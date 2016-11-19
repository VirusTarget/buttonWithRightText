//
//  UIButton+seriesNumber.h
//  button
//
//  Created by 陈晋添 on 2016/11/19.
//  Copyright © 2016年 陈晋添. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (seriesNumber)

@property   (nonatomic, strong) NSString    *seriesNumber;


@property   (nonatomic, strong, readonly)   UILabel *seriesLabel;
@end
