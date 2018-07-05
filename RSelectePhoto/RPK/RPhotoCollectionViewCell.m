//
//  RPhotoCollectionViewCell.m
//  RSelectePhoto
//
//  Created by RPK on 2018/7/5.
//  Copyright © 2018年 BruceAlbert. All rights reserved.
//

#import "RPhotoCollectionViewCell.h"

#import <Photos/Photos.h>

#import "RPhotoModel.h"

// 一小时的秒数
static const int kOneHour   = 60*60;
// 一分钟的秒数
static const int kOneMinute = 60;

@interface RPhotoCollectionViewCell()
// 视频时长
@property (nonatomic, strong) UILabel     *duration;
// 选择按钮
@property (nonatomic, strong) UIButton    *selecteBut;
// 显示的图片或者视频
@property (nonatomic, strong) UIImageView *imageView;
// 放映机
@property (nonatomic, strong) UIImageView *projector;

@end


@implementation RPhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    _imageView          = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView.userInteractionEnabled = YES;
    [self addSubview:_imageView];
    
    _selecteBut         = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width-20, 0, 20, 20)];
    [_selecteBut setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self addSubview:_selecteBut];
    
    _projector          = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.frame.size.height - 25, 25, 20)];
    [_projector setImage:[UIImage imageNamed:@""]];
//    [_projector sizeToFit];
    [self addSubview:_projector];
    
    _duration           = [[UILabel alloc] initWithFrame:CGRectMake(_projector.frame.origin.x + _projector.frame.size.width + 10, _projector.frame.origin.y, 50, 20)];
    _duration.textColor = [UIColor whiteColor];
    _duration.font      = [UIFont systemFontOfSize:13];
    [self addSubview:_duration];
    
}

- (void)setPhotoModel:(RPhotoModel *)photoModel {
    _photoModel = photoModel;
    __block RPhotoCollectionViewCell *weakSelf = self;
    [[PHImageManager defaultManager] requestImageForAsset:photoModel.asset targetSize:CGSizeMake(R_ITEM_WIDTH, R_ITEM_WIDTH) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.imageView.image = result;
            weakSelf.duration.text = @"";
        });
    }];
    if (photoModel.asset.mediaType == PHAssetMediaTypeVideo) {
        PHVideoRequestOptions *videoRequestOption = [PHVideoRequestOptions new];
        videoRequestOption.networkAccessAllowed = YES;
        [[PHImageManager defaultManager] requestAVAssetForVideo:photoModel.asset options:videoRequestOption resultHandler:^(AVAsset * avasset, AVAudioMix * _Nullable audioMix, NSDictionary * _Nullable info) {
            dispatch_async(dispatch_get_main_queue(), ^{
                int assetDuration          = (int)avasset.duration.value / (int)avasset.duration.timescale;
                
                int hour   = 0;
                int minute = 0;
                int second = 0;
                NSString *durationText = @"";
                if (assetDuration != 0) {
                    if (assetDuration >= kOneHour) {
                        hour   = assetDuration / kOneHour;
                        minute = assetDuration % kOneHour / kOneMinute;
                        second = assetDuration % kOneMinute;
                    }
                    else if (assetDuration >= kOneMinute) {
                        minute = assetDuration / kOneMinute;
                        second = assetDuration % kOneMinute;
                    }
                    else {
                        second = assetDuration;
                    }
                    
                    if (hour == 0) {
                        durationText = [NSString stringWithFormat:@"%02d:%02d", minute, second];
                    }
                    else {
                        durationText = [NSString stringWithFormat:@"%02d:%02d:%02d", hour, minute, second];
                    }
                }
                weakSelf.duration.text   = durationText;
                [weakSelf setNeedsDisplay];
            });
        }];
    }
}

@end
