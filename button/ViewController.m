//
//  ViewController.m
//  button
//
//  Created by 陈晋添 on 2016/11/19.
//  Copyright © 2016年 陈晋添. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+seriesNumber.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.button.layer.borderWidth   =   1;
}
- (IBAction)click {
    self.button.selected    =   !self.button.selected;
    if (self.button.selected) {
        self.button.seriesNumber    =   @"2";
    }
    else {
        self.button.seriesNumber    =   @"0";
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
