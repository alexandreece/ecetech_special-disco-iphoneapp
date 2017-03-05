//
//  GameScene.swift
//  LAMApp
//
//  Created by Alexandre on 02/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene
{
    //constantes
    let pointZero = CGPoint(x: 0, y: 0)
    var mots = ["papillon","voiture","George Cloney","Obama", "Trump", "Donald Duck"]
    //let nbMot = self.mots.counts
    
    //node des vues
    var groupe1 : SKNode?
    var groupe2 : SKNode?
    var groupe3 : SKNode?
    
    //node groupe jeux
    var groupeJeux : SKNode?
    var chrono : SKLabelNode?
    var nextButton : SKNode?
    var okButton : SKNode?
    
    
    
    //variable pour le chrono
    var timer = Timer()
    var count: Int = 60
    
    
    
    override func didMove(to view: SKView)
    {
        if let g1 = childNode(withName: "//PremiereManche")
        {
            groupe1 = g1
        }
        
        if let g2 = childNode(withName: "//DeuxiemeManche")
        {
            groupe2 = g2
        }
        
        if let g3 = childNode(withName: "//TroisiemeManche")
        {
            groupe3 = g3
        }
        if let gJeux = childNode(withName: "//ElementJeux")
        {
            groupeJeux = gJeux
        }
        if let ch = childNode(withName: "//Time") as? SKLabelNode
        {
            chrono = ch
        }
        
        groupeJeux?.isHidden = true
        
        
        
        
        
        nextButton = childNode(withName: "//NextButton")
        okButton = childNode(withName: "//OkButton")
        
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        
        if let touch = touches.first
        {
            let location = touch.location(in: self)
            
            if nextButton!.contains(location)
            {
                
                print("next button")
            }
            if okButton!.contains(location)
            {
                
                print("ok button")
            }
        }
        if (groupe1?.position == pointZero){
            groupe1?.run(SKAction.moveTo(y: -1900, duration: 0.5), completion:
                {
                    print("Premiere manche")
                    
                    print("Shuffled: \(self.randomArray(array: self.mots))")
                    self.jeux()
            })
            
        }
        
        if (groupe2?.position == pointZero){
            groupe2?.run(SKAction.moveTo(y: -1900, duration: 0.5), completion:
                {
                    print("Deuxieme manche")
            })
            groupe3?.run(SKAction.move(to: pointZero, duration: 0.5), completion:
                {
                    print("Troisieme manche")
            })
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func jeux()
    {
        groupeJeux?.isHidden = false
        
        //timer lancé
        //var count: Int = 60
        if #available(iOS 10.0, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block:
                { (timer) in
                    self.updateTime()
            })
        } else {
            // Fallback on earlier versions
        }
        timer.fire()
        
    }
    //met a jour la variable count
    func updateTime(){
        
        if(count > 0)
        {
            
            count -= 1
            self.chrono!.text = String (count)
        } else {
            timer.invalidate()
            count = 60
        }
    }
    //melange la liste de mot
    func randomArray(array : [String]) -> [String]{
        return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: array) as! [String]
    }
}


