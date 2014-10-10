//
//  ViewController.swift
//  ARNHeaderStretchFlowLayout-Swift
//
//  Created by Airin on 2014/10/09.
//  Copyright (c) 2014年 Airin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView : UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var flowLayout:ARNHeaderStretchFlowLayout = ARNHeaderStretchFlowLayout()
        flowLayout.sectionInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, 50)
        flowLayout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 160)
        flowLayout.minimumLineSpacing = 1
        flowLayout.minimumInteritemSpacing = 0
        self.collectionView?.collectionViewLayout = flowLayout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var headerView:UICollectionReusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "Header", forIndexPath: indexPath) as UICollectionReusableView
        
        return headerView
    }
}