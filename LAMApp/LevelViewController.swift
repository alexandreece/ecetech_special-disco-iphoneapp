//
//  LevelViewController.swift
//  LAMApp
//
//  Created by Maeva Margueritat on 06/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {
    
    @IBOutlet weak var EasyButton: UIButton!
    @IBOutlet weak var IntermediateButton: UIButton!
    @IBOutlet weak var DifficultButton: UIButton!
    var Level: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Selection du niveau 1:Facile, 2:Intermediaire, 3:Difficile")
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
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        if sender === EasyButton {
            Level = 1
            print(Level)
        } else if sender === IntermediateButton {
            Level = 2
            print(Level)
        } else if sender === DifficultButton {
            Level = 3
            print(Level)
        }
    }
    
    


}
