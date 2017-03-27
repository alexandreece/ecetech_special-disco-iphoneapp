//
//  Game.swift
//  LAMApp
//
//  Created by VRSTL on 03/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import Foundation

import GameplayKit



class Game{
    
    static let shared = Game()
    
    // ----- INSTANTIATION ----- //
    var Level: Int

    var NbPlayers: Int
    
    var TeamA: String
    

    var TeamB: String
    
    var TeamA_List_Joueurs = [Joueur]()
    var TeamB_List_Joueurs = [Joueur]()
    
    var NbWords: Int
    var CurrentWord: Int

    
    var posTab = 0
    
    var Words_List = [String]()
    var Words_Current_List = [String]()
    //var Word: String


    
//    int NbPointsTurnTeamA;
//    int NbPointsTurnTeamB;
    var CurrentRound: Int
    var PlayerToPlay: [Int]
    var NbPointsTurn: Int
    var NbPointsRoundTeamA: Int
    var NbPointsRoundTeamB: Int
    
    
    // ----- CONSTRUCTOR ----- //
    init() {
    self.Level = 0

    self.NbPlayers = 3
    self.TeamA = "Lamatraque"
    self.TeamB = "Lamatrice"
    self.NbWords = 0
    

    self.CurrentWord = 0
    self.CurrentRound = 0
    self.PlayerToPlay = [0, 0]
    self.NbPointsTurn = 0
    self.NbPointsRoundTeamA = 0
    self.NbPointsRoundTeamB = 0

        
    self.Words_List = ["papillon", "voiture", "George Cloney", "Obama", "Trump", "Donald Duck"]
        
        //copyWordList()
    self.TeamA_List_Joueurs = [Joueur(),Joueur(),Joueur()]
    self.TeamB_List_Joueurs = [Joueur(),Joueur(),Joueur()]
        var i = 0
        for joueur in TeamA_List_Joueurs {
            joueur.NomJoueur = "toto \(i)"
            i += 1
        }
        i=0
        for joueur in TeamB_List_Joueurs {
            joueur.NomJoueur = "tutu \(i)"
            i += 1
        }
        
    }/*
    init() {
        self.Level = 0
        self.NbPlayers = 0
        self.TeamA = "Lamatraque"
        self.TeamB = "Lamatrice"
        self.NbWords = 0
        self.Word = ""
        self.CurrentWord = 0
        self.CurrentRound = 0
        self.PlayerToPlay = [0, 0]
        self.NbPointsTurn = 0
        self.NbPointsRoundTeamA = 0
        self.NbPointsRoundTeamB = 0
        self.Words_List = []
        self.TeamA_List_Joueurs = [Joueur(),Joueur(),Joueur()]
        self.TeamB_List_Joueurs = [Joueur(),Joueur(),Joueur()]
   
        
    }*/
    // ----- GETTERS ----- //
    
    
    func getNextWord() ->String
    {
         return Words_Current_List[ posTab ]
    }
    func getNameJoueurTeamA (pIDJoueur: Int) -> String {
        let Joueur: Joueur = TeamA_List_Joueurs[pIDJoueur]
        let JoueurName: String = Joueur.NomJoueur

        return JoueurName
    }
    
    func getNameJoueurTeamB (pIDJoueur: Int) -> String {
        let Joueur: Joueur = TeamB_List_Joueurs[pIDJoueur]

        let JoueurName: String = Joueur.NomJoueur
        return JoueurName
    }
    
    func copyWordList()
    {
    
        Words_Current_List = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: Words_List) as! [String]
        
    }
   

}
