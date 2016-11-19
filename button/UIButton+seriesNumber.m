//
//  UIButton+seriesNumber.m
//  button
//
//  Created by 陈晋添 on 2016/11/19.
//  Copyright © 2016年 陈晋添. All rights reserved.
//

#import "UIButton+seriesNumber.h"
#import <objc/runtime.h>

NSString const *UIButton_seriesNumberKey    = @"UIButton_seriesNumberKey";
NSString const *UIButton_seriesLabelKey     = @"UIButton_seriesLabelKey";
NSInteger const leftEdge    =   5;  //序列与文本的间隔
NSInteger const seriesFont  =   13; //序列的字体大小

@implementation UIButton (seriesNumber)

- (NSString *)seriesNumber {
    NSString *seriesNumber   =   objc_getAssociatedObject(self, &UIButton_seriesNumberKey);
    return seriesNumber;
}

- (void)setSeriesNumber:(NSString *)seriesNumber {
    
    [self updateSeriesFrameWithString:seriesNumber];
    
    objc_setAssociatedObject(seriesNumber, &UIButton_seriesNumberKey, seriesNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)seriesLabel {
    UILabel *label  =   objc_getAssociatedObject(self, &UIButton_seriesLabelKey);
    if (!label) {
        
        UIColor *textColor    =   [UIColor blackColor];
        UIColor *borderColor  =   [UIColor blackColor];
        
        label   =   [[UILabel alloc] init];
        label.layer.borderWidth =   1;
        label.layer.borderColor =   borderColor.CGColor;
        label.textAlignment =   NSTextAlignmentCenter;
        label.textColor =   textColor;
        label.alpha     =   0;
        label.opaque    =   YES;
        label.font      =   [UIFont systemFontOfSize:seriesFont];
        
        [self addSubview:label];
        
        objc_setAssociatedObject(self, &UIButton_seriesLabelKey, label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return label;
}

- (void)setSeriesLabel:(UILabel *)seriesLabel {
    objc_setAssociatedObject(self, &UIButton_seriesLabelKey, seriesLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


/**
 更新序列的尺寸
 */
- (void)updateSeriesFrameWithString:(NSString *)seriesNumber {
    
    if (seriesNumber.length == 0 || [seriesNumber integerValue] == 0 ) {
        self.seriesLabel.alpha  =   0;
        self.titleEdgeInsets    =   UIEdgeInsetsZero;
        return;
    }
    
    self.seriesLabel.alpha  =   1;
    self.seriesLabel.text   =   seriesNumber;
    [self.seriesLabel sizeToFit];
    self.seriesLabel.center =   CGPointMake(0, self.titleLabel.center.y);
    
    CGRect labelRect    =   self.seriesLabel.frame;
    labelRect.size.width =   CGRectGetWidth(labelRect)>CGRectGetHeight(labelRect)?CGRectGetWidth(labelRect): CGRectGetHeight(labelRect);
    
    //按钮原先文本需要向左偏移，使文本+序列号固定在中间
    self.titleEdgeInsets    =   UIEdgeInsetsMake(0, 0, 0, (CGRectGetWidth(labelRect)+leftEdge)/2.0);
    
    
    //适配序列号
    labelRect.origin.x   =   CGRectGetMaxX(self.titleLabel.frame) + leftEdge;
    self.seriesLabel.layer.cornerRadius    =   CGRectGetHeight(labelRect)/2.0;
    self.seriesLabel.frame =   labelRect;
    
}
@end
