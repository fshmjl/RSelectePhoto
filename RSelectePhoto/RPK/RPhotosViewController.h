//
//  RPhotosViewController.h
//  RSelectePhoto
//
//  Created by RPK on 2018/7/5.
//  Copyright © 2018年 BruceAlbert. All rights reserved.
//

#import <UIKit/UIKit.h>


@class PHFetchResult;
@interface RPhotosViewController : UICollectionViewController

@property (nonatomic, strong) PHFetchResult *fetchResult;

@end
