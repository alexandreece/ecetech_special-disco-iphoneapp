//
//  GameViewController.swift
//  LAMApp
//
//  Created by Alexandre on 02/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

/*
    @IBOutlet weak var RoundText: UILabel!
    @IBOutlet weak var PlayerNameText: UILabel!
    @IBOutlet weak var TeamNameText: UILabel!
    @IBOutlet weak var CurrentWordText: UILabel!
    @IBOutlet weak var ScoreText: UILabel!
    @IBOutlet weak var ValidateWordButton: UIButton!
    @IBOutlet weak var ActualizeWordButton: UIButton!
    
    var CurrentRound = "Manche 1"
    var PlayerName = "Joueur 1"
    var TeamName = "Lamatraque"
    var WordList = ["Chien","Chat","Lion","Tigre","Souris","Rat","Elephant", "Hippopotame"]
    var Point = 0
    var i = 0
    */
    @IBOutlet weak var RoundText: UILabel!
    @IBOutlet weak var PlayerNameText: UILabel!
    @IBOutlet weak var TeamNameText: UILabel!
    @IBOutlet weak var CurrentWordText: UILabel!
    @IBOutlet weak var ScoreTexr: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        self.RoundText.text = CurrentRound
        self.PlayerNameText.text = PlayerName
        self.TeamNameText.text = TeamName
        self.CurrentWordText.text = WordList[0]
        self.ScoreText.text = "\(Point)/\(WordList.count)"
        */

    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }
    /*
    @IBAction func TEST(_ sender: UIButton) {
        if Point < WordList.count {
            
            Point = Point + 1
            
            if i < WordList.count {
                i = i + 1
                self.CurrentWordText.text = WordList[i]
            } else if i == WordList.count{
                i = 0
                self.CurrentWordText.text = WordList[i]
            }
        }
        if Point == WordList.count{
            // Aller à la view suivante --> Fin de manche
        }
    }
    

    @IBAction func ValidateWord(_ sender: UIButton) {
        
        if Point < WordList.count {
            
            Point = Point + 1
            
            if i < WordList.count {
                i = i + 1
                self.CurrentWordText.text = WordList[i]
            } else if i == WordList.count{
                i = 0
                self.CurrentWordText.text = WordList[i]
            }
        }
        if Point == WordList.count{
            // Aller à la view suivante --> Fin de manche
        }
    }
    
    @IBAction func TESTO(_ sender: UIButton) {
        if i < WordList.count {
            i = i + 1
            self.CurrentWordText.text = WordList[i]
        } else if i == WordList.count{
            i = 0
            self.CurrentWordText.text = WordList[i]
        }
        
    }
    
    @IBAction func ActualizeWord(_ sender: UIButton) {
    
        if i < WordList.count {
            i = i + 1
            self.CurrentWordText.text = WordList[i]
        } else if i == WordList.count{
            i = 0
            self.CurrentWordText.text = WordList[i]
        }

    }
 */
}
