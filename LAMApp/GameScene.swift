//
//  GameScene.swift
//  LAMApp
//
//  Created by Alexandre on 02/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//
import SpriteKit
import GameplayKit

class GameScene: SKScene , GameEngineDelegate
{
    //game
    
    //var wordCurrentList = Game.shared.Words_List
    
    
    //var nbMrestant = Game.shared.Words_List.count
    var manche = 0
    //constantes
    let pointZero = CGPoint(x: 0, y: 0)
    
    //let nbMot = self.mots.counts
    
    //node des vues
    var groupe1 : SKNode?
    var groupe2 : SKNode?
    var groupe3 : SKNode?
    var finTourG : SKNode?
    var finJeux : SKNode?
    
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
    var nbManche : SKLabelNode?
    
    //variable pour le chrono
    var timer = Timer()
    
    static let TimeCount = 4
    var count = TimeCount
    
    //var decompte joueurs
    var v = 0
    var playing = 0
    var mancheShow = 0
    
    
    
    // override function didmove
    override func didMove(to view: SKView)
    {
        GameEngine.shared.delegate = self
        Game.shared.copyWordList()
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
        if let finJ = childNode(withName: "//FinJeux")
        {
            finJeux = finJ
        }
        assert((finJeux != nil))
        
        
        //label
        if let ch = childNode(withName: "//Time") as? SKLabelNode
        {
            chrono = ch
        }
        if let mo = childNode(withName: "//Mot") as? SKLabelNode
        {
            mot = mo
            mot?.text = Game.shared.getNextWord()
            
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
        if let nmanche = childNode(withName: "//NManche") as? SKLabelNode
        {
            nbManche = nmanche
        }
        
        
        
        
        
        groupeJeux?.isHidden = true
        updateNumText()
        if #available(iOS 10.0, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block:
                { (timer) in
                    self.updateTime()
            })
        } else {
            // Fallback on earlier versions
        }
        
        
        
        updatePlayer()
        
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
            if (groupe1?.position == pointZero){
                groupe1?.run(SKAction.moveTo(y: -1900, duration: 0.5), completion:
                    {
                        self.playing = 1
                        self.jeux()
                })
                
            }
            if (mancheShow == 0 ){
                showScreen()
                print("if 0")
                 if(groupe2?.position == pointZero){
                    groupe2?.run(SKAction.moveTo(y: 1900, duration: 0.5), completion:
                        {
                            self.playing = 1
                            self.jeux()
                    })
                }
                else if(groupe3?.position == pointZero){
                    groupe3?.run(SKAction.moveTo(y: 1900, duration: 0.5), completion:
                        {
                            self.playing = 1
                            self.jeux()
                    })
                }
            }
            if (finTourG?.position == pointZero && mancheShow != 0 ){
                if(mancheShow == 1){
                    finTourG?.run(SKAction.moveTo(y: 1900, duration: 0.5), completion:
                        {
                            self.playing = 1
                            //self.jeux()
                    })
                    groupe2?.run(SKAction.move(to: pointZero, duration: 0.5), completion:
                        {
                            self.mancheShow = 0
                    })}
                if(mancheShow == 2){
                    finTourG?.run(SKAction.moveTo(y: 1900, duration: 0.5), completion:
                        {
                            self.playing = 1
                            //self.jeux()
                    })
                    groupe3?.run(SKAction.move(to: pointZero, duration: 0.5), completion:
                        {
                            self.mancheShow = 0
                    })}
                if(mancheShow == 3){
                    finTourG?.run(SKAction.moveTo(y: 1900, duration: 0.5), completion:
                        {
                            self.playing = 0
                            //self.jeux()
                    })
                    finJeux?.run(SKAction.move(to: pointZero, duration: 0.5), completion:
                        {
                            self.groupeJeux?.isHidden = true
                    })}
                
                
            }
            
            let location = touch.location(in: self)
            
            if nextButton!.contains(location) && playing != 0
            {
                nextWord()
            }
            if okButton!.contains(location) && playing != 0
            {
                validWord()
            }
            
        }
        
        
    }
    
    
    func showScreen()
    {
        if(finTourG?.position == pointZero){
            finTourG?.run(SKAction.moveTo(y: -900, duration: 0.5), completion:
                {
                    self.jeux()
                    self.playing = 1
                    
            })
        }
        else if(finTourG?.position.y == -900 && playing != 0){
            finTourG?.run(SKAction.move(to: pointZero, duration: 0.5), completion:
                {
                    self.groupeJeux?.isHidden = true
                    self.playing = 1
            })
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func jeux()
    {
        groupeJeux?.isHidden = false
        print(Game.shared.TeamA_List_Joueurs)
        startTimer()
        
    }
    
    //fonction mot suivant
    func nextWord()
    {
        GameEngine.shared.nextWord()
        mot?.text = Game.shared.getNextWord()
        
    }
    
    // fonction valider un mot
    func validWord()
    {
        GameEngine.shared.validWord()
    }
    
    func gameDidEnd()
    {
        playing = 0
        groupeJeux?.isHidden = true
        finTourG?.run(SKAction.move(to: pointZero, duration: 0.5), completion:
            {
                print("point \(Game.shared.NbPointsTurn)")
                self.nbLama?.text = "L'équipe adverse reçois \(Game.shared.NbPointsTurn) LAMA"
                Game.shared.NbPointsTurn = 0
                self.updateNumText()
                
        })
        
        //GameEngine.shared.score()
        
    }
    func mancheDidEnd() {
        if (GameEngine.shared.idManche == 1)
        {
            mancheShow = 1
        }
        if (GameEngine.shared.idManche == 2)
        {
            mancheShow = 2
        }
        if (GameEngine.shared.idManche == 3)
        {
            mancheShow = 3
            
        }
        print (GameEngine.shared.idManche)
        showScreen()
    }
    func updateView()
    {
        updateNumText()
        updateNomText()
        
    }
    func updateGame()
    {
        updateNumText()
        
        print(" State \(GameEngine.shared.etatJeux) Manche \(GameEngine.shared.idManche) Equipe \(GameEngine.shared.idEquipe) joueur \(GameEngine.shared.idJoueur) NbMot \(Game.shared.Words_Current_List.count)")
        print(Game.shared.Words_Current_List.count)
        
        
    }
    
    func updateNomText()
    {
        mot?.text = Game.shared.Words_Current_List[Game.shared.posTab]
    }
    func updateNumText()
    {
        numWord?.text = "\(Game.shared.NbPointsTurn) / \(Game.shared.Words_List.count)"
    }
    
    func updatePlayer()
    {
        if(GameEngine.shared.idEquipe == 0){
            joueurName?.text = Game.shared.TeamA_List_Joueurs[GameEngine.shared.idJoueur].GetNomJoueur()
            
        }
        else if(GameEngine.shared.idEquipe == 1){
            joueurName?.text = Game.shared.TeamB_List_Joueurs[GameEngine.shared.idJoueur].GetNomJoueur()
            
        }
        
        if(GameEngine.shared.idManche == 0)
        {
            nbManche?.text = ("Manche  1")
        }
        else if(GameEngine.shared.idManche == 1)
        {
            nbManche?.text = ("Manche  2")
        }
        else if(GameEngine.shared.idManche == 2)
        {
            nbManche?.text = ("Manche  3")
        }
        
        if(GameEngine.shared.idEquipe == 0) {
            teamName?.text = Game.shared.TeamA
        }
        else
        {
            teamName?.text = Game.shared.TeamB
        }
        
        
        
    }
    //fonction fin de manche
    func finManche(){
        groupeJeux?.isHidden = true
        
    }
    
    func finTour()
    {
        timer.invalidate()
        GameEngine.shared.endManche()
        
    }
    
    
    func gameTerminated() {
        print("game terminated ")
        manche = 3
    }
    
    //timer
    func startTimer()
    {
        count = GameScene.TimeCount
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
            
            finTour()
        }
    }
    
    
    
}
