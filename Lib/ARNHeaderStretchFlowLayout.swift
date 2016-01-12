//
//  ARNHeaderStretchFlowLayout.swift
//
//  Created by xxxAIRINxxx on 2014/09/17.
//  Copyright (c) 2014 xxxAIRINxxx. All rights reserved.
//

import UIKit

public class ARNHeaderStretchFlowLayout: UICollectionViewFlowLayout {
    
    public override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    public override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let att = super.layoutAttributesForElementsInRect(rect)
        
        var attributes:[UICollectionViewLayoutAttributes] = []
        att?.forEach() { attributes.append($0.copy() as! UICollectionViewLayoutAttributes) }
        
        let offset = self.collectionView!.contentOffset
        let minY = 0 - self.collectionView!.contentInset.top
        
        if offset.y < minY {
            let headerSize = self.headerReferenceSize
            let deltaY = fabsf(CFloat(offset.y) - CFloat(minY))
            attributes.forEach() {
                if $0.representedElementKind == UICollectionElementKindSectionHeader && $0.indexPath.section == 0 {
                    var headerRect = $0.frame
                    headerRect.size.height = max(minY, CGFloat(headerSize.height) + CGFloat(deltaY))
                    headerRect.origin.y = headerRect.origin.y - CGFloat(deltaY)
                    $0.frame = headerRect
                }
            }
        }
        
        return attributes
    }
}
