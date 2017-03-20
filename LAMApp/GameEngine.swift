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
     func mancheDidEnd()
     */
    func gameDidEnd()
    
    func updateView()
    func updateGame()
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
    var etatJeux   = GameState.Start
    var idManche    : Int = 0
    var idJoueur   : Int = 0
    var idEquipe   : Int = 0
    
    var delegate : GameEngineDelegate?
    
    func nextWord()
    {
        
        //        GameEngine.shared.nextWord()
        Game.shared.posTab += 1
        
        if( Game.shared.posTab < Game.shared.Words_Current_List.count)
        {
            
        }
        else
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
            Game.shared.posTab = 0
             Game.shared.copyWordList()
            score()
            
            endManche()
            
            print("postab \(Game.shared.posTab) word current list \(Game.shared.Words_Current_List)")
           
            
            
            
            
        }
        else
        {
            
            Game.shared.posTab += 1
            
            
            
            
            if( Game.shared.posTab < Game.shared.Words_Current_List.count){
                
                
            }
                
            else
            {
                Game.shared.posTab = 0
                Game.shared.Words_Current_List = randomArray(array: Game.shared.Words_Current_List)
                
                
            }
            
            delegate?.updateView()
            
        }
    }
    func endManche()
    {
        
        switch etatJeux {
        //Nouveau tour
        case .Start:
            etatJeux = .Manche
            idManche = 0
            idJoueur = 0
            idEquipe = 0
            
        //Nouvelle manche
        case .Manche:
            if (Game.shared.Words_Current_List.count == 0 )
            {
                idManche += 1
                print("Manche : \(Game.shared.Words_Current_List.count)")
                
                for i in Game.shared.Words_Current_List
                {
                    print(i)
                }
                
                if(idManche >= 2)
                {
                    etatJeux = .End
                }
            }
            else
            {
                idEquipe += 1
                if(idEquipe >= 2)
                {
                    idEquipe = 0
                    idJoueur += 1
                    
                    if(idJoueur >= Game.shared.NbPlayers)
                    {
                        idJoueur = 0
                    }
                }
                print("Id equipe  \(idEquipe)")

                tour()
            }
            
        //fin
        case .End:
            
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
        print(" State \(etatJeux) Manche \(idManche) Equipe \(idEquipe) joueur \(idJoueur) nbWord \(Game.shared.Words_Current_List.count)")
        
    }
    
    func score()
    {
        print("Id equipe  \(idEquipe)")
        if idEquipe == 0{
            Game.shared.NbPointsRoundTeamA = Game.shared.NbPointsRoundTeamA + Game.shared.NbPointsTurn
        }
        else{
            Game.shared.NbPointsRoundTeamB = Game.shared.NbPointsRoundTeamB + Game.shared.NbPointsTurn
        }
        delegate?.updateView()
        Game.shared.NbPointsTurn = 0
    }
}



//melange la liste de mot
func randomArray(array : [String]) -> [String]{
    return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: array) as! [String]
}




