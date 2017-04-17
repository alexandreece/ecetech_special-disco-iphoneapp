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
    func finTour()
    //func gameDidEnd()
    func updatePlayer()
    func updateView()
    func gameTerminated()
}

/*class Game : NSObject
 {
 static var shared = Game()
 var nbPlayer = 4
 
 }*/

//enumeration des états du jeux
enum GameState
{
    case Start
    case Manche
    case End
    
}
//enumeration des état des tours
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
    
    
    //fonction principal avec la logique du jeux
    func endManche()
    {
        
        
        switch etatJeux {
            //etat voué a reinitialiser le jeux
            //Nouveau tour
            /*
             case .Start:
             
             idManche = 0
             idJoueur = 0
             idEquipe = 0
             */
        //Nouvelle manche
        case .Manche:
            //cas de fin de manche lorsque la liste de mot est vide
            if (Game.shared.Words_Current_List.isEmpty )
            {
                idManche += 1
                delegate?.mancheDidEnd()
                equipe()
                
                printState()
                //cas ou l'on est a la troisieme manche et que le jeux est fini
                if(idManche >= 2)
                {
                    etatJeux = .End
                }
            }
                //timer terminé
            else
            {
                
                //delegate?.mancheDidEnd()
                printState()
                equipe()
                delegate?.updatePlayer()
                
            }
            
        //fin
        case .End:
            print ("fin !")
            delegate?.gameTerminated()
            //etatJeux = Start
            break
            
            
        default:
            break
        }
    }
    
    //affiche l'état du jeux
    func printState()
    {
        print("State \(etatJeux) Manche \(idManche) Equipe \(idEquipe) joueur \(idJoueur) nbWord \(Game.shared.Words_Current_List.count)")
        
    }
    //fonction mot précédent
    func nextWord()
    {
        
        //GameEngine.shared.nextWord()
        Game.shared.posTab += 1
        //reinitialise la liste de mot (courante)
        
        if( Game.shared.posTab == Game.shared.Words_Current_List.count)
        {
            Game.shared.posTab = 0
            Game.shared.Words_Current_List = randomArray(array: Game.shared.Words_Current_List)
            
        }
    }
    
    //mot valider
    func validWord()
    {
        Game.shared.Words_Current_List.remove(at : Game.shared.posTab)
        Game.shared.NbPointsTurn += 1
        // print("Points engine \(Game.shared.NbPointsTurn) point eqA \(Game.shared.NbPointsRoundTeamA) point eqB \(Game.shared.NbPointsRoundTeamB)" )
        //si la liste est vide, ordonne a gameScene d'afficher les scores
        if(Game.shared.Words_Current_List.isEmpty)
        {
            //delegate?.gameDidEnd()
            delegate?.finTour()
            endManche()
            Game.shared.posTab = 0
            score()
            Game.shared.copyWordList()

        }
            //ordonne a gameScene d'afficher le prochain mot
        else
        {
            
            Game.shared.posTab += 1
            //si le compteur est plus grand que la liste, le remet a  zero
            if( Game.shared.posTab >= Game.shared.Words_Current_List.count){
                Game.shared.posTab = 0
                Game.shared.Words_Current_List = randomArray(array: Game.shared.Words_Current_List)
                
            }
            delegate?.updateView()
            
        }
    }
    //met a jour le score des equipes
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
    
    //incremente le num d'équipe et de joueur
    func equipe()
    {
        idEquipe += 1
        if(idEquipe == 2)
        {
            idEquipe = 0
            idJoueur += 1
            
            if(idJoueur >= Game.shared.NbPlayers)
            {
                idJoueur = 0
            }
        }
        
    }
}



//melange la liste de mot
func randomArray(array : [String]) -> [String]{
    return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: array) as! [String]
}




