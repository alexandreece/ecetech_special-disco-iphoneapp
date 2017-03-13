//
//  EnterWordsTableViewController.swift
//  LAMApp
//
//  Created by Maeva Margueritat on 06/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import UIKit

class EnterWordsTableViewController: UITableViewController {
    
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var dictionaryButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    @IBOutlet weak var validButton: UIButton!

    var size: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lenghtTable()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return size
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellPlayer", for: indexPath)
        /*
 
        */
        // Configure the cell...

        return cell
    }
    

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
    
   @IBAction func optionClicked(_ sender: UIButton){
        if sender === randomButton {
            
            print()
        } else if sender === dictionaryButton {
            
            print()
        } else if sender === previousButton {
            
            print()
        }
    }
    
    @IBAction func validClicked(_ sender: UIButton){
        if sender === validButton{
            
        }
    }
    
    @IBAction func lenghtTable(){
        size = Game.shared.getNbPlayers()*2
        print(size)
    }

}
