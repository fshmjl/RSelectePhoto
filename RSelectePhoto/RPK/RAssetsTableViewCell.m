//
//  RAssetsTableViewCell.m
//  RSelectePhoto
//
//  Created by RPK on 2018/7/5.
//  Copyright © 2018年 BruceAlbert. All rights reserved.
//

#import "RAssetsTableViewCell.h"

#import "RAssetsModel.h"

@interface RAssetsTableViewCell()
// 缩略图
@property (nonatomic, strong) UIImageView *thumbnail;
// 相册名
@property (nonatomic, strong) UILabel *albumName;
// 图片数量
@property (nonatomic, strong) UILabel *photoCount;
@end

@implementation RAssetsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self initView];
    }
    return self;
}

- (void)initView {
    self.thumbnail             = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.thumbnail.contentMode = UIViewContentModeScaleAspectFit;
    self.thumbnail.layer.masksToBounds = YES;
    self.thumbnail.layer.cornerRadius  = 0;
    [self addSubview:self.thumbnail];
    
    self.albumName             = [[UILabel alloc] initWithFrame:CGRectZero];
    self.albumName.textColor   = [UIColor darkGrayColor];
    self.albumName.font        = [UIFont systemFontOfSize:15];
    [self addSubview:self.albumName];
    
    self.photoCount            = [[UILabel alloc] initWithFrame:CGRectZero];
    self.photoCount.textColor  = [UIColor lightGrayColor];
    self.photoCount.font       = [UIFont systemFontOfSize:15];
    [self addSubview:self.photoCount];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.thumbnail.frame  = CGRectMake(5, 5, self.frame.size.height - 10, self.frame.size.height - 10);
    self.albumName.frame  = CGRectMake(self.thumbnail.frame.origin.x + self.thumbnail.frame.size.width + 10, self.frame.size.height/2. - 25/2., self.albumName.frame.size.width, 25);
    self.photoCount.frame = CGRectMake(self.albumName.frame.origin.x + self.albumName.frame.size.width + 10, self.frame.size.height/2. - 25/2., self.photoCount.frame.size.width, 25);
}

- (void)setAssetsModel:(RAssetsModel *)assetsModel {
    _assetsModel = assetsModel;
    if (assetsModel) {
        self.thumbnail.image = assetsModel.lastImage;
        self.albumName.text = [assetsModel getAlbumName];
        NSLog(@"原本显示为：%@, 处理后显示为：%@",assetsModel.albumName, self.albumName.text);
        [self.albumName sizeToFit];
        self.photoCount.text = [NSString stringWithFormat:@"(%ld)",assetsModel.photoCount];
        [self.photoCount sizeToFit];
    }
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
