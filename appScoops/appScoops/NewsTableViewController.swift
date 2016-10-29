//
//  NewsTableViewController.swift
//  appScoops
//
//  Created by Javier Contreras on 29/10/16.
//  Copyright © 2016 Ocon. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    // AppService conection
    var client: MSClient = MSClient(applicationURL: URL(string:"http://balate-mbass.azurewebsites.net")!)
    
    // Create model
    //var model: [String]? = []
    var model: [Dictionary<String, AnyObject>]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        readAllItemsInTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Insert into table
    func addNews(_ title: String) {
    
        //create table conection
        let tableMS = client.table(withName: "News")
        
        //insert into table
            tableMS.insert(["title" : title, "detailsNews" : "Suegra aprende ha pronuciar croquetas"]) { (result, error) in
            
                //show result or error
                if let _ = error {
                    print(error)
                    return
                }
                print(result)
            }
        
    }
    
    func readAllItemsInTable() {
    
        //create table conection
        let tableMS = client.table(withName: "News")
        
        let predicate = NSPredicate( format: "title == 'Sucesos'" )
        
        tableMS.read {(results, error) in

            //show result or error
            if let _ = error {
                print(error)
                return
            }
        
            if let items = results {
                
                for item in items.items! {
                    self.model?.append(item as! [String : AnyObject])
                 }
                
                DispatchQueue.main.async {
                    
              self.tableView.reloadData()
            }
        }

        
    /*    tableMS.read(with: predicate) { (result, error) in
        
            //show result or error
            if let _ = error {
                print(error)
                return
            }
        
            if let items = result {
                
                for item in items.items! {
                    self.model?.append(item as! [String : AnyObject])
                 }
                
                DispatchQueue.main.async {
                    
              self.tableView.reloadData()
            }
        }*/
    
    }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
