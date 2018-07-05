//
//  ViewController.m
//  RSelectePhoto
//
//  Created by RPK on 2018/7/5.
//  Copyright © 2018年 BruceAlbert. All rights reserved.
//

#import "ViewController.h"

#import "RImagePickerController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    RImagePickerController *imagePicker = [[RImagePickerController alloc] initWithRootViewController:nil];
    
    [imagePicker setDidFinishSelectImages:^(NSArray *images) {
        
    }];
    
    [imagePicker setDidFinishSelectThumbnails:^(NSArray *thumbnails) {
        
    }];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
