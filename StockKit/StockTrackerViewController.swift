
//
//  StockTrackerViewController.swift
//  StockKit
//
//  Copyright © 2017 Nathan Tannar.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//
//  Created by Nathan Tannar on 7/23/17.
//

import NTComponents
import SwiftChart

open class StockTrackerViewController: NTCollectionViewController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        makeLargeTitle()
        datasource = StockTrackerDatasource()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addStockSymbol))
        navigationController?.navigationBar.tintColor = .white
    }
    
    open override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 100)
    }
    
    open func addStockSymbol() {
        let alertController = UIAlertController(title: "Add Stock", message: nil, preferredStyle: .alert)
        alertController.view.tintColor = Color.Default.Tint.View
        
        let saveAction = UIAlertAction(title: "Add", style: .default, handler: {
            alert -> Void in
            let count = (self.datasource?.objects?.count ?? 0)
            self.datasource?.objects?.append(alertController.textFields?[0].text ?? "$SYM")
            self.collectionView?.insertSections([count])
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Stock Symbol"
        }
        present(alertController, animated: true, completion: nil)
    }
    
    fileprivate func makeLargeTitle() {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: -2, width: 0, height: 0))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.text = "Stocks"
        titleLabel.textAlignment = .left
        titleLabel.sizeToFit()
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: titleLabel.frame.size.width, height: 30))
        titleView.addSubview(titleLabel)
        navigationItem.titleView = titleView
    }
}

open class StockTrackerDatasource: NTCollectionDatasource {
    
    public override init() {
        super.init()
        objects = ["AAPL", "MSFT"]
    }
    
    ///The cell classes that will be used to render out each section.
    open override func cellClasses() -> [NTCollectionViewCell.Type] {
        return [StockViewCell.self]
    }
    
    ///Override this method to provide your list with what kind of headers should be rendered per section
    open override func headerClasses() -> [NTCollectionViewCell.Type]? {
        return [StockViewHeaderCell.self]
    }
    
    open override func numberOfItems(_ section: Int) -> Int {
        return 1
    }
    
    open override func numberOfSections() -> Int {
        return objects?.count ?? 0
    }