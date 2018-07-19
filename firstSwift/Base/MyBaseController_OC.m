//
//  MyBaseController.m
//  firstSwift
//
//  Created by ctios on 2018/7/10.
//  Copyright © 2018年 ctios. All rights reserved.
//

#import "MyBaseController_OC.h"
#import <DKNightVersion/DKNightVersion.h>

@interface MyBaseController_OC ()

@end

@implementation MyBaseController_OC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.dk_barTintColorPicker = DKColorPickerWithKey(BAR);
    
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(BG);
    
    
    NSLog(@"123=%@",aabbcc);
    
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
