//
//  ARNHeaderStretchFlowLayout.swift
//
//  Created by Airin on 2014/09/17.
//  Copyright (c) 2014 Airin. All rights reserved.
//

import UIKit

public class ARNHeaderStretchFlowLayout: UICollectionViewFlowLayout {
    
    public override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    public override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let offset = self.collectionView!.contentOffset
        let minY = 0 - self.collectionView!.contentInset.top
        
        let attributes = super.layoutAttributesForElementsInRect(rect)
        
        if let _attributes = attributes {
            if offset.y < minY {
                let headerSize = self.headerReferenceSize
                let deltaY = fabsf(CFloat(offset.y) - CFloat(minY))
                _ = _attributes.map() {
                    let kind = $0.representedElementKind
                    if kind == UICollectionElementKindSectionHeader && $0.indexPath.section == 0 {
                        var headerRect = $0.frame
                        headerRect.size.height = max(minY, CGFloat(headerSize.height) + CGFloat(deltaY))
                        headerRect.origin.y = headerRect.origin.y - CGFloat(deltaY)
                        $0.frame = headerRect
                    }
                }
            }
        }
        
        return attributes
    }
}
