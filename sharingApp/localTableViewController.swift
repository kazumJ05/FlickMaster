//
//  localTableViewController.swift
//  sharingApp
//
//  Created by 大原一倫 on 2019/12/08.
//  Copyright © 2019 oharakazumasa. All rights reserved.
//

import UIKit

class localTableViewController: UITableViewController {
    
    var dictionary : [Dictionary<String,String>] = []
    let savedata = UserDefaults.standard
    
    @IBOutlet var table: UITableView!
    
    @IBAction func selectback(){
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "localTableViewCell", bundle: nil),
        forCellReuseIdentifier: "celllocal")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if savedata.array(forKey: "ADDWORD") != nil{
            dictionary = savedata.array(forKey: "ADDWORD") as!  [Dictionary<String,String>]
        }
        
        print(dictionary)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dictionary.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celllocal", for: indexPath) as! localTableViewCell
        cell.nameLabel.text = dictionary[indexPath.row]["word"]
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dictionary.remove(at: indexPath.row)
        }
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.reloadData()
        savedata.set(dictionary, forKey: "ADDWORD")
    }

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
