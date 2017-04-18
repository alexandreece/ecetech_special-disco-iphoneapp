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
    var home : SKNode?
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
    var winTeam : SKLabelNode?
    
    //variable pour le chrono
    var timer = Timer()
    
    static let TimeCount = 4
    var count = TimeCount
    var scoreToShow = 0
    //var decompte joueurs
    var mancheShow = 0
    
    
    
    
    
    // override function didmove
    override func didMove(to view: SKView)
    {
        GameEngine.shared.delegate = self
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
        if let h = childNode(withName: "//home")
        {
            home = h
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
        if let wint = childNode(withName: "//winteam") as? SKLabelNode
        {
            winTeam = wint
        }
        
        
        
        groupeJeux?.isHidden = true
        updateNumText()
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
            updateView()
            if(groupeJeux?.isHidden == false){
                let location = touch.location(in: self)
                
                if nextButton!.contains(location)
                {
                    nextWord()
                }
                if okButton!.contains(location)
                {
                    GameEngine.shared.validWord()
                }
            }
            /*
             Regles
             */
            //cas1 : regle premiere manche
            if(groupe1?.position == pointZero){
                mouveGrp(grp: groupe1!)
                self.mancheShow = 0
            }
                //cas2 : regle premiere manche
            else if(groupe2?.position == pointZero){
                mouveGrp(grp: groupe2!)
                self.mancheShow = 0
                
            }
                //cas3 : regle premiere manche
            else if(groupe3?.position == pointZero){
                mouveGrp(grp: groupe3!)
                self.mancheShow = 0
            }
                //cas4 : affichage des scores
            else if(finTourG?.position == pointZero){
                
                if(mancheShow == 1){
                    finTourG?.run(SKAction.moveTo(y: 1900, duration: 0.5))
                    groupe2?.run(SKAction.move(to: pointZero, duration: 0.7), completion:
                        {
                            self.mancheShow = 0
                    })}
                else if(mancheShow == 2){
                    finTourG?.run(SKAction.moveTo(y: 1900, duration: 0.5))
                    groupe3?.run(SKAction.move(to: pointZero, duration: 0.7), completion:
                        {
                            self.mancheShow = 0
                    })}
                else if(mancheShow == 3){
                    finTourG?.run(SKAction.moveTo(y: 1900, duration: 0.5))
                    finJeux?.run(SKAction.move(to: pointZero, duration: 0.7), completion:
                        {
                            self.mancheShow = 0
                    })}
                    
                else{
                    mouveGrp(grp: finTourG!)
                }
            }
            
        }
        
    }
    
    /*
     -gameStart lance le jeux
     -
     -*/
    //fait apparaitre le jeux et demarre le timer
    func gameStart()
    {
        updateView()
        self.groupeJeux?.isHidden = false
        self.startTimer()
        
        
    }
    
    //start timer
    func startTimer()
    {
        count = GameScene.TimeCount
        
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
        //chrono >0 donc decremente chrono et affiche valeur
        if(count > 0)
        {
            print(count)
            count -= 1
            self.chrono!.text = String (count)
            
        }
            //chrono = 0 donc stop timer, affiche scores
        else {
            finTour()
            
        }
    }
    /*
     -
     -Fin tour
     -
     */
    func finTour()
    {
        timer.invalidate()
        scoreToShow = Game.shared.NbPointsTurn
        Game.shared.NbPointsTurn = 0
        scoreScreen()
        GameEngine.shared.endManche()
    }
    //fonction appelé par le game engine pour mettre a jour l'affichage de la manche
    func mancheDidEnd() {
        timer.invalidate()
        scoreScreen()
        mancheShow = GameEngine.shared.idManche
        scoreToShow = Game.shared.NbPointsTurn
        Game.shared.NbPointsTurn = 0
        Game.shared.Words_Current_List.removeAll()
        Game.shared.copyWordList()
        GameEngine.shared.endManche()
        
        
    }
    
    //affiche l'éceran entre les joueurs
    func scoreScreen()
    {
        var teamN = ""
        if(GameEngine.shared.idEquipe == 0) {
            teamN = Game.shared.TeamB
        }
        else
        {
            teamN = Game.shared.TeamA
        }
        self.groupeJeux?.isHidden = true
        nbLama?.text = "L'equipe \(teamN) reçoit \(scoreToShow) LAMAs"
        finTourG?.run(SKAction.move(to: pointZero, duration: 0.5))
        
    }
    
    
    
    /*
     -
     -Update affichage
     -
     */
    func updateView()
    {
        updateNumText()
        updateNomText()
        updatePlayer()
        
    }
    
    
    //met a jours le mot a deviner
    func updateNomText()
    {
        if(!Game.shared.Words_Current_List.isEmpty){
            mot?.text = Game.shared.Words_Current_List[Game.shared.posTab]}
    }
    
    //update le numbre de mot
    func updateNumText()
    {
        numWord?.text = "\(Game.shared.Words_List.count - Game.shared.Words_Current_List.count) / \(Game.shared.Words_List.count)"
    }
    
    // met a jour le numero de la manche, le nom du joueur et le nom de l'équipe
    func updatePlayer()
    {
        if(GameEngine.shared.idEquipe == 0){
            joueurName?.text = Game.shared.TeamA_List_Joueurs[GameEngine.shared.idJoueur].GetNomJoueur()
            
        }
        else if(GameEngine.shared.idEquipe == 1){
            joueurName?.text = Game.shared.TeamB_List_Joueurs[GameEngine.shared.idJoueur].GetNomJoueur()
            
        }
        if (mancheShow == 0 ){
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
        }
        
        if(GameEngine.shared.idEquipe == 0) {
            teamName?.text = Game.shared.TeamA
        }
        else
        {
            teamName?.text = Game.shared.TeamB
        }
        
        
        
    }
    
    //fin de jeux
    func gameTerminated() {
        if(Game.shared.NbPointsRoundTeamA > Game.shared.NbPointsRoundTeamB){
            winTeam?.text = "L'équipe \(Game.shared.TeamA) remporte avec \(Game.shared.NbPointsRoundTeamA) LAMAs"
        }
        else if(Game.shared.NbPointsRoundTeamB > Game.shared.NbPointsRoundTeamA){
            winTeam?.text = "L'équipe \(Game.shared.TeamB) remporte avec \(Game.shared.NbPointsRoundTeamB) LAMAs"
        }
        mancheShow = 3
        
    }
    
    
    func mouveGrp (grp : SKNode){
        grp.run(SKAction.moveTo(y: -1900, duration: 0.5), completion:
            {
                self.gameStart()
        })
    }
    
    //fonction mot suivant
    func nextWord()
    {
        GameEngine.shared.nextWord()
        mot?.text = Game.shared.getNextWord()
        
    }
       
}
