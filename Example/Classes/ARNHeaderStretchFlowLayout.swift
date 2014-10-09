//
//  ARNHeaderStretchFlowLayout.swift
//
//  Created by Airin on 2014/09/17.
//  Copyright (c) 2014 Airin. All rights reserved.
//

import UIKit

class ARNHeaderStretchFlowLayout: UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool
    {
        return true
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]?
    {
        var offset = self.collectionView!.contentOffset
        var minY = 0 - self.collectionView!.contentInset.top
        
        var attributes:[UICollectionViewLayoutAttributes] = super.layoutAttributesForElementsInRect(rect) as [UICollectionViewLayoutAttributes]
        
        if offset.y < minY {
            var headerSize = self.headerReferenceSize
            var deltaY = fabsf(CFloat(offset.y) - CFloat(minY))
            for attrs in attributes {
                var kind:String? = attrs.representedElementKind
                if kind == UICollectionElementKindSectionHeader && attrs.indexPath.section == 0 {
                        var headerRect = attrs.frame
                        headerRect.size.height = max(minY, CGFloat(headerSize.height) + CGFloat(deltaY))
                        headerRect.origin.y = headerRect.origin.y - CGFloat(deltaY)
                        attrs.frame = headerRect
                        break
                }
            }
        }
        
        return attributes
    }
}
