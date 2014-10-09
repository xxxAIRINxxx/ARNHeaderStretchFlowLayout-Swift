//
//  ARNHeaderStretchFlowLayout.swift
//
//  Created by Airin on 2014/09/17.
//  Copyright (c) 2014 Airin. All rights reserved.
//

import UIKit

class ARNHeaderStretchFlowLayout: UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var offset = self.collectionView!.contentOffset
        var minY = 0 - self.collectionView!.contentInset.top
        
        var attributes:[UICollectionViewLayoutAttributes] = super.layoutAttributesForElementsInRect(rect) as [UICollectionViewLayoutAttributes]
        
        if offset.y < minY {
            var headerSize = self.headerReferenceSize
            var deltaY = fabsf(CFloat(offset.y) - CFloat(minY))
            
            for attrs in attributes {
                if attrs.representedElementKind == UICollectionElementKindSectionHeader &&
                    attrs.indexPath.section == 0 {
                        var headerRect = attrs.frame
                        headerRect.size.height = max(minY, CGFloat(headerSize.height + deltaY))
                        headerRect.origin.y = headerRect.origin.y - deltaY
                        
                }
            }
        }
        
        return attributes;
    }
}

//- (UICollectionViewScrollDirection)scrollDirection
//    {
//        return UICollectionViewScrollDirectionVertical;
//    }
//    
//    - (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
//{
//    CGPoint offset = [[self collectionView] contentOffset];
//    CGFloat minY   = 0 - [[self collectionView] contentInset].top;
//    
//    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
//    
//    if (offset.y < minY) {
//        CGSize  headerSize = [self headerReferenceSize];
//        CGFloat deltaY     = fabsf(offset.y - minY);
//        
//        for (UICollectionViewLayoutAttributes *attrs in attributes) {
//            if ([attrs representedElementKind] == UICollectionElementKindSectionHeader &&
//                attrs.indexPath.section == 0) {
//                    CGRect headerRect = [attrs frame];
//                    headerRect.size.height = MAX(minY, headerSize.height + deltaY);
//                    headerRect.origin.y    = headerRect.origin.y - deltaY;
//                    [attrs setFrame:headerRect];
//                    break;
//            }
//        }
//    }
//    return attributes;
//}
