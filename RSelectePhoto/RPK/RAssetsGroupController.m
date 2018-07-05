//
//  RAssetsGroupController.m
//  RSelectePhoto
//
//  Created by RPK on 2018/7/5.
//  Copyright © 2018年 BruceAlbert. All rights reserved.
//

#import "RAssetsGroupController.h"

#import <Photos/Photos.h>

#import "RAssetsModel.h"
#import "RAssetsTableViewCell.h"
#import "RPhotosViewController.h"

static NSString *const identifier = @"photoAlbumsCell";

@interface RAssetsGroupController ()

@property (nonatomic,strong) PHPhotoLibrary *assetsLibrary;
@property (nonatomic, strong) PHFetchResult *fetchResult;
@property (nonatomic,strong) NSMutableArray *photoAlbums;

@end

@implementation RAssetsGroupController

- (PHPhotoLibrary *)assetsLibrary {
    if (!_assetsLibrary) {
        _assetsLibrary = [[PHPhotoLibrary alloc] init];
    }
    return _assetsLibrary;
}

- (PHFetchResult *)fetchResult {
    if (!_fetchResult) {
        _fetchResult = [[PHFetchResult alloc] init];
    }
    return _fetchResult;
}

- (NSMutableArray *)photoAlbums {
    if (!_photoAlbums) {
        _photoAlbums = [NSMutableArray array];
    }
    return _photoAlbums;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor      = [UIColor whiteColor];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableHeaderView = [UIView new];
    self.tableView.rowHeight       = 57;
    self.tableView.separatorInset  = UIEdgeInsetsZero;
    [self.tableView registerClass:[RAssetsTableViewCell class] forCellReuseIdentifier:identifier];
    
    //返回按钮
    UIBarButtonItem *backItem      = [[UIBarButtonItem alloc] init];
    backItem.title                 = @"返回相册";
    self.navigationItem.backBarButtonItem = backItem;
    
    // 所有相册数据
    self.fetchResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    // self.fetchResult.count 表示相册的数量
    for (PHAssetCollection *collection in self.fetchResult) {
        if ([collection.localizedTitle isEqualToString:@"Bursts"] || [collection.localizedTitle isEqualToString:@"Hidden"]) {
            continue;
        }
        __block RAssetsModel *assetsModel = [RAssetsModel new];
        assetsModel.albumName             = collection.localizedTitle;
        // 相册中图片是数量
        PHFetchResult *result             = [PHAsset fetchAssetsInAssetCollection:collection options:nil];
        assetsModel.fetchResult           = result;
        assetsModel.photoCount            = result.count;
        PHAsset *asset                    = [result lastObject];
        [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(300, 300) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            assetsModel.lastImage = result;
        }];
        if (![collection.localizedTitle isEqualToString:@"Camera Roll"]) {
            [self.photoAlbums addObject:assetsModel];
        }
        else {
            [self.photoAlbums insertObject:assetsModel atIndex:0];
        }
    }
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.photoAlbums.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RAssetsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (cell) {
        cell = [[RAssetsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setAssetsModel:self.photoAlbums[indexPath.row]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RAssetsModel *assetModel        = self.photoAlbums[indexPath.row];
    
    RPhotosViewController *photosVC = [RPhotosViewController new];
    photosVC.fetchResult            = assetModel.fetchResult;
    photosVC.title                  = [assetModel getAlbumName];
    [self.navigationController pushViewController:photosVC animated:YES];
}

@end
