//
//  LJNewFeatureController.m
//  WBO
//
//  Created by JackLou on 7/24/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJNewFeatureController.h"
#import "LJNewFeatureCell.h"

@interface LJNewFeatureController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic,strong) UICollectionView *collectionView;
@end


static NSString *identifier = @"newFeature";
@implementation LJNewFeatureController

- (void)loadView{
    [super loadView];
    
    self.view = self.collectionView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI{
    
    [self.collectionView registerClass:[LJNewFeatureCell class] forCellWithReuseIdentifier:identifier];
}

#pragma mark - collectionView代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LJNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.index = indexPath.item;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // 也可以在cell的重写setter方法里，实现下面的效果
    LJNewFeatureCell *newCell = (LJNewFeatureCell *)cell;
    
    if (indexPath.item == 3) {
        
        newCell.startButton.hidden = NO;
        
        newCell.startButton.transform = CGAffineTransformMakeScale(0, 0);
        
        newCell.startButton.userInteractionEnabled = NO;
        
        [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:0 animations:^{
            
            newCell.startButton.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            newCell.startButton.userInteractionEnabled = YES;
        }];
        
        [newCell.startButton addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    }else{
        newCell.startButton.hidden = YES;
    }
}

- (void)startClick{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kSwitchRootVcNotification object:@"newFeature"];
}


#pragma mark - 懒加载
- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = [UIScreen mainScreen].bounds.size;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.pagingEnabled = YES;
        
        collectionView.dataSource = self;
        collectionView.delegate = self;
        
        _collectionView = collectionView;
    }
    
    return _collectionView;
    
    
}

@end
