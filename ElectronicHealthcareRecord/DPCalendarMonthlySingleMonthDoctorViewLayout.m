//
//  DPCalendarMonthlySingleMonthDoctorViewLayout.m
//  ElectronicHealthcareRecord
//
//  Created by DeemsysInc on 11/20/14.
//  Copyright (c) 2014 Deemsysinc. All rights reserved.
//

#import "DPCalendarMonthlySingleMonthDoctorViewLayout.h"

@implementation DPCalendarMonthlySingleMonthDoctorViewLayout
- (id)init {
    if (self = [super init]) {
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.sectionInset = UIEdgeInsetsZero;
        self.minimumInteritemSpacing = 0.f;
        self.minimumLineSpacing = 0.f;
        self.headerReferenceSize = CGSizeZero;
        self.footerReferenceSize = CGSizeZero;
    }
    return self;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    NSArray *array =
    [super layoutAttributesForElementsInRect:({
        CGRect bounds = self.collectionView.bounds;
        bounds.origin.y = proposedContentOffset.y - self.collectionView.bounds.size.height/2.f;
        bounds.size.width *= 1.5f;
        bounds;
    })];
    
    CGFloat minOffsetY = CGFLOAT_MAX;
    UICollectionViewLayoutAttributes *targetLayoutAttributes = nil;
    
    for (UICollectionViewLayoutAttributes *layoutAttributes in array) {
        if ([layoutAttributes.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
            CGFloat offsetY = fabs(layoutAttributes.frame.origin.y - proposedContentOffset.y);
            
            if (offsetY < minOffsetY) {
                minOffsetY = offsetY;
                
                targetLayoutAttributes = layoutAttributes;
            }
        }
    }
    
    if (targetLayoutAttributes) {
        return targetLayoutAttributes.frame.origin;
    }
    
    return CGPointMake(proposedContentOffset.x, proposedContentOffset.y);
}

@end
