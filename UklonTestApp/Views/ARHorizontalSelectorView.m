//
//  ARHorizontalSelectorView.m
//  UklonTestApp
//
//  Created by Andrew on 28.04.2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

#import "ARHorizontalSelectorView.h"
#import "ARSelectorCell.h"

@interface ARHorizontalSelectorView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) NSInteger selectedIndex;
@property (nonatomic) CGFloat cellWidth;

@end

@implementation ARHorizontalSelectorView

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
    [self setupCollectionView];
    
    self.underlineColor = [UIColor clearColor];
    self.underlineSelectedColor = [UIColor clearColor];
    _items = [NSArray<id<ARItemProtocol>> new];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.collectionView.frame = self.bounds;
    self.cellWidth = (self.bounds.size.width / self.items.count) > 80 ? (self.bounds.size.width / self.items.count) : 80;
    [self.collectionView.collectionViewLayout invalidateLayout];
}

-(void)setItems:(NSArray<ARItemProtocol> *)items {
    _items = items;
    [self setNeedsLayout];
}

#pragma mark - UI Settings

- (void)setupUI {
    self.backgroundColor = [UIColor clearColor];
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ARSelectorCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"ARSelectorCell"];

    [self addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat underlineHeight = 4;
    
    UICollectionViewLayoutAttributes *oldAttributes = [self.collectionView layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:_selectedIndex inSection:0]];
    UICollectionViewLayoutAttributes *newAttributes = [self.collectionView layoutAttributesForItemAtIndexPath:indexPath];
    
    CGRect oldFakeFrame = CGRectMake(oldAttributes.frame.origin.x, oldAttributes.frame.size.height - underlineHeight, self.cellWidth, underlineHeight);
    CGRect newFakeFrame = CGRectMake(newAttributes.frame.origin.x, newAttributes.frame.size.height - underlineHeight, self.cellWidth, underlineHeight);

    __block UIView *fakeUnderline = [[UIView alloc] initWithFrame:oldFakeFrame];
    fakeUnderline.backgroundColor = [UIColor yellowUklonColor];
    
    [self addSubview:fakeUnderline];

    ARSelectorCell *cell = (ARSelectorCell*)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_selectedIndex inSection:0]];
    [cell setImageColor:[UIColor grayTextUklonColor] underlineColor:self.underlineColor];
    
    [UIView animateWithDuration:0.25 animations:^{
        fakeUnderline.frame = newFakeFrame;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.selectedIndex = indexPath.item;
        [self.collectionView reloadData];
        [fakeUnderline removeFromSuperview];
        if ([self.delegate respondsToSelector:@selector(selectorView:didSelectItemAtIndex:)]) {
            [self.delegate selectorView:self didSelectItemAtIndex:indexPath.item];
        }
    }];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ARSelectorCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ARSelectorCell" forIndexPath:indexPath];
    
    [cell configureWithItem:self.items[indexPath.row]];
    if (indexPath.item == self.selectedIndex) {
        [cell setImageColor:[UIColor blueUklonColor] underlineColor:self.underlineSelectedColor];
    } else {
        [cell setImageColor:[UIColor grayTextUklonColor] underlineColor:self.underlineColor];
    }
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.cellWidth, self.bounds.size.height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

@end
