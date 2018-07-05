//
//  RAssetsModel.h
//  RSelectePhoto
//
//  Created by RPK on 2018/7/5.
//  Copyright © 2018年 BruceAlbert. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PHFetchResult;
@interface RAssetsModel : NSObject
// 相册名
@property (nonatomic, strong) NSString  *albumName;
// 相册的第一张图片
@property (nonatomic, strong) UIImage   *lastImage;
// 资源数量
@property (nonatomic, assign) NSInteger photoCount;

@property (nonatomic, strong) PHFetchResult *fetchResult;

- (NSString *)getAlbumName;

@end
