//
//  RPreviewViewController.h
//  RSelectePhoto
//
//  Created by RPK on 2018/7/5.
//  Copyright © 2018年 BruceAlbert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPreviewViewController : UIViewController
// 需要预览的资源
@property (nonatomic, strong) NSArray *previewResources;

@property (nonatomic, assign) NSInteger currentIndex;

@end
