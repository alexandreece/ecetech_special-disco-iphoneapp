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

    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        let value =  UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        UIViewController.attemptRotationToDeviceOrientation()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
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
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true

    }
 */
}
