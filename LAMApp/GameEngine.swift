//
//  GameEngine.swift
//  LAMApp
//
//  Created by Adrien on 06/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import UIKit
import GameplayKit

protocol GameEngineDelegate
{
    /*
     func joueurDidEnd()
     */
    func mancheDidEnd()
    func gameDidEnd()
    func updatePlayer()
    func updateView()
    func updateGame()
    
    func gameTerminated()
}

/*class Game : NSObject
 {
 static var shared = Game()
 var nbPlayer = 4
 
 }*/


enum GameState
{
    case Start
    case Manche
    case End
    
}
enum TourState
{
    case Start
    case Valider
    case Next
    case End
    
}




class GameEngine: NSObject
{
    static var shared = GameEngine()
    var etatJeux   = GameState.Manche
    var idManche    : Int = 0
    var idJoueur   : Int = 0
    var idEquipe   : Int = 0
    
    var delegate : GameEngineDelegate?
    
    func endManche()
    {
        
        
        switch etatJeux {
            //Nouveau tour
            /*
             case .Start:
             
             idManche = 0
             idJoueur = 0
             idEquipe = 0
             */
        //Nouvelle manche
        case .Manche:
            if (Game.shared.Words_Current_List.isEmpty )
            {
                idManche += 1
                equipe()
                delegate?.mancheDidEnd()
                delegate?.updatePlayer()
                
                print("if manche")
                printState()
                
                if(idManche >= 2)
                {
                    etatJeux = .End
                }
            }
            else
            {
                print("else manche")
                
                delegate?.mancheDidEnd()
                printState()
                equipe()
                tour()
                delegate?.updatePlayer()
                
            }
            
        //fin
        case .End:
            print ("fin !")
            delegate?.gameTerminated()
            break
            
            
        default:
            break
        }
        
        tour()
    }
    
    func tour(){
        delegate?.updateGame()
    }
    
    func printState()
    {
        print("State \(etatJeux) Manche \(idManche) Equipe \(idEquipe) joueur \(idJoueur) nbWord \(Game.shared.Words_Current_List.count)")
        
    }
    func nextWord()
    {
        
        //GameEngine.shared.nextWord()
        Game.shared.posTab += 1
        
        if( Game.shared.posTab == Game.shared.Words_Current_List.count)
        {
            Game.shared.posTab = 0
            Game.shared.Words_Current_List = randomArray(array: Game.shared.Words_Current_List)
            
        }
    }
    
    func validWord()
    {
        Game.shared.Words_Current_List.remove(at : Game.shared.posTab)
        Game.shared.NbPointsTurn += 1
        // print("Points engine \(Game.shared.NbPointsTurn) point eqA \(Game.shared.NbPointsRoundTeamA) point eqB \(Game.shared.NbPointsRoundTeamB)" )
        
        if(Game.shared.Words_Current_List.isEmpty)
        {
            delegate?.gameDidEnd()
            endManche()
            Game.shared.posTab = 0
            Game.shared.copyWordList()
            score()
            
        }
        else
        {
            
            Game.shared.posTab += 1
            
            if( Game.shared.posTab >= Game.shared.Words_Current_List.count){
                Game.shared.posTab = 0
                Game.shared.Words_Current_List = randomArray(array: Game.shared.Words_Current_List)
                
            }
            delegate?.updateView()
            
        }
    }
    
    func score()
    {
        print("Id equipe  \(idEquipe)")
        if idEquipe == 0{
            print (" Eq 1 : \(Game.shared.NbPointsTurn)")
            Game.shared.NbPointsRoundTeamA = Game.shared.NbPointsRoundTeamA + Game.shared.NbPointsTurn
        }
        else{
            print (" Eq 2 : \(Game.shared.NbPointsTurn)")
            Game.shared.NbPointsRoundTeamB = Game.shared.NbPointsRoundTeamB + Game.shared.NbPointsTurn
        }
        delegate?.updateView()
        
    }
    func scoreDispatch()
    {
        switch Game.shared.Level {
        case 0:
        
            break
        case 1:
            break
        case 3:
            break
        default:
            break
            
        }    }
    
    func equipe()
    {
        idEquipe += 1
        if(idEquipe == 2)
        {
            print ("if equipe ")
            idEquipe = 0
            idJoueur += 1
            
            if(idJoueur >= Game.shared.NbPlayers)
            {
                print ("if joueur")
                idJoueur = 0
            }
        }
        print("Id equipe  \(idEquipe)")
        
    }
}



//melange la liste de mot
func randomArray(array : [String]) -> [String]{
    return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: array) as! [String]
}




