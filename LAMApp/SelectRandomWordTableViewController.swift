//
//  SelectRandomWordTableViewController.swift
//  LAMApp
//
//  Created by Alexandre on 20/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import UIKit

class SelectRandomWordTableViewController: UITableViewController, DataBaseDelegate {
    
    @IBOutlet weak var peopleButton: UIButton!
    @IBOutlet weak var fauneButton: UIButton!
    @IBOutlet weak var floreButton: UIButton!
    @IBOutlet weak var fictifButton: UIButton!
    @IBOutlet weak var objetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataBase = WordDataBase.shared
        dataBase.delegate = self
        
        dataBase.loadFromDisk()
        dataBase.loadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func didLoadData()
    {
        tableView.reloadData()
        
        if(WordDataBase.shared.saveToDisk())
        {
            print("Save OK")
        }
        else
        {
            print("Save ERROR")
        }
    }
    
    func didLoadDataAtIndex( index : Int)
    {}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        let mots = WordDataBase.shared.objects
        
        if sender === peopleButton {
            var people=[Word]()
            for item in mots {
                if item.category.contains("People")
                {
                    people.append(item)
                }
            }
            print(people[Int(arc4random_uniform(UInt32(people.count)))].word)
        }
        else if sender === fauneButton {
            var faune=[Word]()
            for item in mots {
                if item.category.contains("Faune")
                {
                    faune.append(item)
                }
            }
            print(faune[Int(arc4random_uniform(UInt32(faune.count)))].word)
        }
        else if sender === floreButton {
            var flore=[Word]()
            for item in mots {
                if item.category.contains("Flore")
                {
                    flore.append(item)
                }
            }
            print(flore[Int(arc4random_uniform(UInt32(flore.count)))].word)
        }
        else if sender === fictifButton {
            var fictif=[Word]()
            for item in mots {
                if item.category.contains("Fictif")
                {
                    fictif.append(item)
                }
            }
            print(fictif[Int(arc4random_uniform(UInt32(fictif.count)))].word)
        }
        else if sender === objetButton {
            var objet=[Word]()
            for item in mots {
                if item.category.contains("Objet")
                {
                    objet.append(item)
                }
            }
            Game.shared.WordRndm = objet[Int(arc4random_uniform(UInt32(objet.count)))].word
        }
    }
}
