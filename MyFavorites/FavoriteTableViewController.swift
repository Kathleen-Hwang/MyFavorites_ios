//
//  FavoriteTableViewController.swift
//  MyFavorites
//
//  Created by Mac on 2016. 9. 20..
//  Copyright © 2016년 Mac. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UITableViewController {

    // MARK: Properties    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyStore.getFavoriteCount()
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "FavoriteTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! FavoriteTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let favorite = MyStore.getAtIndex(indexPath.row)
        
        cell.nameLabel.text = favorite.name
        cell.favoritSwitch.on = favorite.favorite
        
        return cell
    }
}
