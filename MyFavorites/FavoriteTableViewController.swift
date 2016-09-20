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
    var favorites = [Favorite]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedFavorites = loadFavorites() {
            favorites += savedFavorites
        } else {
            loadDefaultFavorites()
        }
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
        return favorites.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "FavoriteTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! FavoriteTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let favorite = favorites[indexPath.row]
        
        cell.nameLabel.text = favorite.name
        cell.favoritSwitch.on = favorite.favorite
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: NSCoding
    
    
    func saveFavorites() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(favorites, toFile: Favorite.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save favorites...")
        }
    }
    
    
    
    func loadFavorites() -> [Favorite]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Favorite.ArchiveURL.path!) as? [Favorite]
    }
    
    // default
    func loadDefaultFavorites() {
        let favorite1 = Favorite(name: "South Korea", favorite: false)
        let favorite2 = Favorite(name: "France", favorite: false)
        let favorite3 = Favorite(name: "Canada", favorite: false)
        
        favorites += [favorite1!, favorite2!, favorite3!]
    }
}
