//
//  HLCardFlowLayout.m
//
//  Created by HeLin on 2017/10/23.
//  Copyright © 2017年 HL. All rights reserved.
//

#import "HLCardFlowLayout.h"

@implementation HLCardFlowLayout
#define kCollectionViewWidth (self.collectionView.frame.size.width)
#define kCellHeight 167 /// cell 高度
#define kCellSpace 117 // cell0Top to cell1Top

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
    UIEdgeInsets inset = self.collectionView.contentInset;
    self.itemSize = CGSizeMake(kCollectionViewWidth - inset.right - inset.left, kCellHeight);
    self.minimumLineSpacing = kCellSpace - kCellHeight;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray * array = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes * attrs in array) {
        attrs.zIndex = attrs.indexPath.item;
    }
    return array;
}
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}
@end
