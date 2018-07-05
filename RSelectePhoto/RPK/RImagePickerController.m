//
//  RImagePickerController.m
//  RSelectePhoto
//
//  Created by RPK on 2018/7/5.
//  Copyright © 2018年 BruceAlbert. All rights reserved.
//

#import "RImagePickerController.h"

#import <AssetsLibrary/AssetsLibrary.h>

#import "RAssetsGroupController.h"

@interface RImagePickerController ()
//
@property (nonatomic, strong) RAssetsGroupController *assetsGroup;

@end

@implementation RImagePickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

- (RAssetsGroupController *)assetsGroup {
    if (!_assetsGroup) {
        _assetsGroup         = [RAssetsGroupController new];
        UILabel *titleLabel      = [UILabel new];
        titleLabel.textColor     = [UIColor darkGrayColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text          = @"选择相册";
        [titleLabel sizeToFit];
        
        _assetsGroup.navigationItem.titleView         = titleLabel;
        
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
        _assetsGroup.navigationItem.leftBarButtonItem = cancelItem;
    }
    return _assetsGroup;
}

- (instancetype)init {
    self = [super initWithRootViewController:self.assetsGroup];
    if (self) {
        UINavigationBar *navBar = [UINavigationBar appearance];
        //导航条背景色
        navBar.barTintColor     = [UIColor grayColor];
        //字体颜色
        navBar.tintColor        = [UIColor whiteColor];
    }
    return self;
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    return [self init];
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
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
