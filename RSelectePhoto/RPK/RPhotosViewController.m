//
//  RPhotosViewController.m
//  RSelectePhoto
//
//  Created by RPK on 2018/7/5.
//  Copyright © 2018年 BruceAlbert. All rights reserved.
//

#import "RPhotosViewController.h"

#import <Photos/Photos.h>

#import "RPhotoModel.h"
#import "RPreviewViewController.h"
#import "RPhotoCollectionViewCell.h"


@interface RPhotosViewController ()

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation RPhotosViewController

static NSString * const kReuseIdentifier = @"Cell";

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (instancetype)init {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing          = kRowMargin;
    flowLayout.minimumInteritemSpacing     = kColumnMargin;
    flowLayout.itemSize                    = CGSizeMake(R_ITEM_WIDTH, R_ITEM_WIDTH);
    flowLayout.sectionInset                = UIEdgeInsetsMake(kRowMargin, kColumnMargin, kRowMargin, kColumnMargin);
    return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[RPhotoCollectionViewCell class] forCellWithReuseIdentifier:kReuseIdentifier];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self initData];
    // Do any additional setup after loading the view.
}


- (void)initData {
    self.dataSource = [NSMutableArray array];
    
    __block RPhotosViewController *weakSelf = self;
    
    [self.fetchResult enumerateObjectsUsingBlock:^(PHAsset *asset, NSUInteger idx, BOOL * _Nonnull stop) {
        RPhotoModel *photoModel = [RPhotoModel new];
        photoModel.asset = asset;
        [weakSelf.dataSource addObject:photoModel];
    }];
    
    [self.collectionView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifier forIndexPath:indexPath];
    [cell setPhotoModel:self.dataSource[indexPath.row]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    RPreviewViewController *previewVC = [[RPreviewViewController alloc] init];
    previewVC.previewResources        = self.dataSource;
    previewVC.currentIndex            = indexPath.row;
    [self.navigationController pushViewController:previewVC animated:YES];
}


@end
