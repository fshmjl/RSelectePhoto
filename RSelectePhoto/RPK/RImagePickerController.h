//
//  RImagePickerController.h
//  RSelectePhoto
//
//  Created by RPK on 2018/7/5.
//  Copyright © 2018年 BruceAlbert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RImagePickerController : UINavigationController

//返回用户选择的照片的原图
@property (nonatomic,copy) void(^didFinishSelectImages)(NSArray *images);

//返回用户选择的照片的缩略图
@property (nonatomic,copy) void(^didFinishSelectThumbnails)(NSArray *thumbnails);

@end
