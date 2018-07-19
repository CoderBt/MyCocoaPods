//
//  OtherController.m
//  firstSwift
//
//  Created by ctios on 2018/6/12.
//  Copyright © 2018年 ctios. All rights reserved.
//

#import "OtherController.h"

#import "firstSwift-Swift.h"
#import <DKNightVersion/DKNightVersion.h>

@interface OtherController ()

@end

@implementation OtherController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
//    UILabel *navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 44)];
//    navigationLabel.text = @"DKNightVersion";
//    navigationLabel.textAlignment = NSTextAlignmentCenter;
//    self.navigationItem.titleView = navigationLabel;
    
    self.navigationItem.title = @"DKNightVersion";
    
    NSLog(@"skdjfalsjdflasjdf=%@",aabbcc);
    
    HH *abc=[HH new];
    [abc show123];
    
//    demoButton.snp.makeConstraints { (make) in
//        //            make.width.height.equalTo(80)
//        //            make.center.equalTo(self.view)
//        make.top.equalTo(10)
//        make.left.equalTo(self.view).offset(10)
//        
//        make.right.equalTo(self.view).offset(-300)
//    }
    
    
//
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Present" style:UIBarButtonItemStylePlain target:self action:@selector(present)];
//    self.navigationItem.leftBarButtonItem = item;
    
    UIBarButtonItem *normalItem = [[UIBarButtonItem alloc] initWithTitle:@"Normal" style:UIBarButtonItemStylePlain target:self action:@selector(normal)];
    normalItem.dk_tintColorPicker = DKColorPickerWithKey(TINT);
    UIBarButtonItem *nightItem = [[UIBarButtonItem alloc] initWithTitle:@"Night" style:UIBarButtonItemStylePlain target:self action:@selector(night)];
    nightItem.dk_tintColorPicker = DKColorPickerWithKey(TINT);
//    UIBarButtonItem *redItem = [[UIBarButtonItem alloc] initWithTitle:@"Red" style:UIBarButtonItemStylePlain target:self action:@selector(red)];
//    redItem.dk_tintColorPicker = DKColorPickerWithKey(TINT);

    self.navigationItem.rightBarButtonItems = @[normalItem, nightItem];


    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    self.navigationController.navigationBar.dk_barTintColorPicker = DKColorPickerWithKey(BAR);
    
    
    self.navigationController.navigationBar.translucent = NO;
}

    
    - (void)night {
        self.dk_manager.themeVersion = DKThemeVersionNight;
    }
    
- (void)normal {
    self.dk_manager.themeVersion = DKThemeVersionNormal;
}
    
- (void)red {
    self.dk_manager.themeVersion = @"RED";
}

    
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
