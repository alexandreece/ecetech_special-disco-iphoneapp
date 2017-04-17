//
//  ConfigJeuViewController.swift
//  LAMApp
//
//  Created by Maeva Margueritat on 06/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import UIKit
class ConfigJeuViewController: UIViewController {

    @IBOutlet weak var x2Button: UIButton!
    @IBOutlet weak var x3Button: UIButton!
    @IBOutlet weak var x4Button: UIButton!
    @IBOutlet weak var x5Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Selection de la configuration de jeu : 2x2 joueurs, 2x3 joueurs, 2x4 joueurs, 2x5 joueurs")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func configClick(_ sender: UIButton) {
        if sender === x2Button {
            Game.shared.NbPlayers = 2
            Game.shared.NbWords = 12
            print(Game.shared.NbPlayers)
        } else if sender === x3Button {
            Game.shared.NbPlayers = 3
            Game.shared.NbWords = 8
            print(Game.shared.NbPlayers)
        } else if sender === x4Button {
            Game.shared.NbPlayers = 4
            Game.shared.NbWords = 6
            print(Game.shared.NbPlayers)
        } else if sender === x5Button {
            Game.shared.NbPlayers = 5
            Game.shared.NbWords = 4
            print(Game.shared.NbPlayers)
        }
        
        for i in 0...Game.shared.NbPlayers-1{
         
            switch Game.shared.NbPlayers {
                case 2 :
                    Game.shared.WordTeamA[i] = Game.shared.NbWords
                    Game.shared.WordTeamB[i] = Game.shared.NbWords
                case 3 :
                    Game.shared.WordTeamA[i] = Game.shared.NbWords
                    Game.shared.WordTeamB[i] = Game.shared.NbWords
                case 4 :
                    Game.shared.WordTeamA[i] = Game.shared.NbWords
                    Game.shared.WordTeamB[i] = Game.shared.NbWords
                case 5 :
                    Game.shared.WordTeamA[i] = Game.shared.NbWords
                    Game.shared.WordTeamB[i] = Game.shared.NbWords
                default :
                    Game.shared.WordTeamA[i] = 6
                    Game.shared.WordTeamB[i] = 6
            }
            
        }
        
    }

}
