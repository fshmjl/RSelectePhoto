//
//  RAssetsModel.m
//  RSelectePhoto
//
//  Created by RPK on 2018/7/5.
//  Copyright © 2018年 BruceAlbert. All rights reserved.
//

#import "RAssetsModel.h"



@implementation RAssetsModel


- (NSString *)getAlbumName
{
    if ([self.albumName isEqualToString:@"Slo-mo"]) {
        return @"慢动作";
    } else if ([self.albumName isEqualToString:@"Recently Added"]) {
        return @"最近添加";
    } else if ([self.albumName isEqualToString:@"Favorites"]) {
        return @"最爱";
    } else if ([self.albumName isEqualToString:@"Recently Deleted"]) {
        return @"最近删除";
    } else if ([self.albumName isEqualToString:@"Videos"]) {
        return @"视频";
    } else if ([self.albumName isEqualToString:@"All Photos"]) {
        return @"所有照片";
    } else if ([self.albumName isEqualToString:@"Selfies"]) {
        return @"自拍";
    } else if ([self.albumName isEqualToString:@"Screenshots"]) {
        return @"屏幕快照";
    } else if ([self.albumName isEqualToString:@"Camera Roll"]) {
        return @"相机胶卷";
    }else if ([self.albumName isEqualToString:@"My Photo Stream"]){
        return @"我的照片流";
    }
    else if ([self.albumName isEqualToString:@"Panoramas"]) {
        return @"全景照片";
    }
    else if ([self.albumName isEqualToString:@"Time-lapse"]) {
        return @"微速摄影";
    }
    else if ([self.albumName isEqualToString:@"Portrait"]) {
        return @"人像";
    }
    else if ([self.albumName isEqualToString:@"Live Photos"]) {
        return @"实况照片";
    }
    else if ([self.albumName isEqualToString:@"Long Exposure"]) {
        return @"长曝光";
    }
    else if ([self.albumName isEqualToString:@"Animated"]) {
        return @"动图";
    }
    return nil;
    
}
@end
