//
//  RPhotoModel.h
//  RSelectePhoto
//
//  Created by RPK on 2018/7/5.
//  Copyright © 2018年 BruceAlbert. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PHAsset;
@interface RPhotoModel : NSObject
// 是否被选择
@property (nonatomic, assign) BOOL isSelecte;
// 图片或者视频资源
@property (nonatomic, strong) PHAsset *asset;
@end
