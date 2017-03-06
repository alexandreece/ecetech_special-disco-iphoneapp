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
    //game
    
    var wordCurrentList = Game.shared.getWords_List()
    var posTab = 0
    var nbMrestant = Game.shared.getWords_List().count
    var score = 0
    var manche = 1
    //constantes
    let pointZero = CGPoint(x: 0, y: 0)
    
    //let nbMot = self.mots.counts
    
    //node des vues
    var groupe1 : SKNode?
    var groupe2 : SKNode?
    var groupe3 : SKNode?
    var finTourG : SKNode?
    
    //node groupe jeux
    var groupeJeux : SKNode?
    var chrono : SKLabelNode?
    var mot : SKLabelNode?
    var nextButton : SKNode?
    var okButton : SKNode?
    var numWord : SKLabelNode?
    var nbLama : SKLabelNode?
    var joueurName : SKLabelNode?
    var teamName : SKLabelNode?
    
    //variable pour le chrono
    var timer = Timer()
    var count: Int = 60
    
    //var decompte joueurs
    var v = 0
    
    // override function didmove
    override func didMove(to view: SKView)
    {
        
        //groupe
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
        if let finTou = childNode(withName: "//FinTour")
        {
            finTourG = finTou
        }
        //label
        if let ch = childNode(withName: "//Time") as? SKLabelNode
        {
            chrono = ch
        }
        if let mo = childNode(withName: "//Mot") as? SKLabelNode
        {
            mot = mo
        }
        if let nbmo = childNode(withName: "//CompteMot") as? SKLabelNode
        {
            numWord = nbmo
        }
        
        if let nblamas = childNode(withName: "//NbLama") as? SKLabelNode
        {
            nbLama = nblamas
        }
        if let jname = childNode(withName: "//JoueurName") as? SKLabelNode
        {
            joueurName = jname
        }
        if let tname = childNode(withName: "//TeamName") as? SKLabelNode
        {
            teamName = tname
        }
        
        
        
        groupeJeux?.isHidden = true
        numWord?.text = "\(score) / \(nbMrestant)"
        joueurName?.text = Game.shared.getTeamA_List_Joueurs()[0].GetNomJoueur()
        
        nextButton = childNode(withName: "//NextButton")
        okButton = childNode(withName: "//OkButton")
        
    }
    
    
    
    //gestion touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
        
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        if let touch = touches.first
        {
            let location = touch.location(in: self)
            
            if nextButton!.contains(location)
            {
                nextWord()
            }
            if okButton!.contains(location)
            {
                validWord()
            }
        }
        if (groupe1?.position == pointZero){
            groupe1?.run(SKAction.moveTo(y: -1900, duration: 0.5), completion:
                {
                    self.jeux()
            })
            
        }
        
    }
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func jeux()
    {
        groupeJeux?.isHidden = false
        print(Game.shared.getTeamA_List_Joueurs())
        
        while (v<Game.shared.getTeamA_List_Joueurs().count){
            joueurName?.text = Game.shared.getTeamA_List_Joueurs()[v].GetNomJoueur()
            teamName?.text = Game.shared.TeamA
            time()
            while(count > 0 || wordCurrentList.count != 1 ){
                print(count)
            }
           // mot?.text = wordCurrentList[posTab]
            
        }
        print("broke")
        
        
    }
    
    //fonction mot suivant
    func nextWord(){
        posTab += 1
        if(posTab < wordCurrentList.count){
            mot?.text = wordCurrentList[posTab]
        }
        else{
            posTab = 0
            wordCurrentList = randomArray(array: wordCurrentList)
            mot?.text = wordCurrentList[posTab]
        }
    }
    
    // fonction valider un mot
    func validWord(){
        print(wordCurrentList.count)
        print(wordCurrentList)
        if(wordCurrentList.count == 1){
            print("points \(score)")
            score += 1
            finTour()
            
        }
        else{
            wordCurrentList.remove(at : posTab)
            score += 1
            posTab += 1
            numWord?.text = "\(score) / \(nbMrestant)"
            if(posTab < wordCurrentList.count){
                mot?.text = wordCurrentList[posTab]
            }
                
            else{
                posTab = 0
                wordCurrentList = randomArray(array: wordCurrentList)
                mot?.text = wordCurrentList[posTab]
            }
        }
    }
    
    //fonction fin de manche
    func finManche(){
        groupeJeux?.isHidden = true
        
    }
    
    func finTour(){
        groupeJeux?.isHidden = true
        finTourG?.run(SKAction.move(to: pointZero, duration: 0.5), completion:
            {
                self.nbLama?.text = "L'équipe adverse reçois \(self.score) LAMA"
        })
        
    }
    
    //timer
    func time(){
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
            finTour()
        }
    }
    //melange la liste de mot
    func randomArray(array : [String]) -> [String]{
        return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: array) as! [String]
    }
    
    
}


