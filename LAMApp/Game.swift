//
//  Game.swift
//  LAMApp
//
//  Created by VRSTL on 03/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import Foundation

class Game{
    
    static let shared = Game()
    
    // ----- INSTANTIATION ----- //
    var Level: Int
    
    var NbPlayers: Int = 5
    var NbTeam = 2
    
    var TeamA: String
    var TeamB: String
    
    var TeamA_List_Joueurs = [Joueur]()
    var TeamB_List_Joueurs = [Joueur]()
    
    var NbWords: Int
    var CurrentWord: Int
    var Words_List = [String]()
    var Words_Current_List = [String]()
    var Word: String
    var WordRndm: String
    var WordPlayer: Int
    
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
    self.NbPlayers = 5
    self.TeamA = ""
    self.TeamB = ""
    self.NbWords = 0
    self.Word = ""
    self.WordRndm = ""
    self.WordPlayer = 0
    self.CurrentWord = 0
    self.CurrentRound = 0
    self.PlayerToPlay = [0, 0]
    self.NbPointsTurn = 0
    self.NbPointsRoundTeamA = 0
    self.NbPointsRoundTeamB = 0
    }
    
    // ----- GETTERS ----- //
     
    func getLevel() -> Int {
        return Level
    }
    
    func getNbPlayers() -> Int {
        return NbPlayers
    }
    
    func getNameTeamA() -> String {
        return TeamA;
    }
    
    func getNameTeamB() -> String {
        return TeamB;
    }
    
    func getTeamA_List_Joueurs() -> [Joueur] {
        return TeamA_List_Joueurs
    }
    
    func getTeamB_List_Joueurs() -> [Joueur] {
        return TeamB_List_Joueurs
    }
    
    func getNameJoueurTeamA (pIDJoueur: Int) -> String {
        let Joueur: Joueur = TeamA_List_Joueurs[pIDJoueur]
        let JoueurName: String = Joueur.GetNomJoueur()
        return JoueurName
    }
    
    func getNameJoueurTeamB (pIDJoueur: Int) -> String {
        let Joueur: Joueur = TeamB_List_Joueurs[pIDJoueur]
        let JoueurName: String = Joueur.GetNomJoueur()
        return JoueurName
    }
    
    func getCurrentWord() -> Int {
        return CurrentRound
    }
    
    func getNbWords() -> Int{
        return NbWords
    }
    
    func getWords_List() -> [String] {
        return Words_List
    }
    
    func getWords_Current_List() -> [String] {
        return Words_Current_List
    }
    
    func getWord (pWordID: Int) -> String {
        return Words_List[pWordID]
    }
    
    func getWordCurrentList (pWordID: Int) -> String {
        return Words_Current_List[pWordID]
    }
    
    func getPlayerToPlay() -> [Int] {
        return PlayerToPlay
    }
    
    func getCurrentRound() -> Int {
        return CurrentRound
    }
    
    func getNbPointsTurn() -> Int {
        return NbPointsTurn
    }
    
    func getNbPointsRoundTeamA() -> Int {
        return NbPointsRoundTeamA
    }
    
    func getNbPointsRoundTeamB() -> Int {
        return NbPointsRoundTeamB
    }
    
    
    // ----- SETTERS ----- //
    
    func setLevel (pLevel: Int) {
        self.Level = pLevel
    }
    
    func setNbPlayers (pNbPlayers: Int) {
        self.NbPlayers = pNbPlayers
    }
    
    func setNameTeamA (pNameTeamA: String) {
        self.TeamA = pNameTeamA
    }
    
    func setNameTeamB (pNameTeamB: String) {
        self.TeamB = pNameTeamB
    }
    
    func addTeamA (TeamA: [Joueur]) {
        self.TeamA_List_Joueurs = TeamA
    }
    
    func addTeamB (TeamB: [Joueur]) {
        self.TeamB_List_Joueurs = TeamB
    }
    
    func addPlayerTeamA (pJoueur: Joueur) {
        self.TeamA_List_Joueurs.append(pJoueur)
    }

    func addPlayerTeamB (pJoueur: Joueur) {
        self.TeamB_List_Joueurs.append(pJoueur)
    }
    
    func setCurrentWord (pCurrentWord: Int) {
        self.CurrentRound = pCurrentWord
    }
    
    func setNbWords (pNbWords: Int) {
        self.NbWords = pNbWords
    }
    
    func setWords_List (pWordsList: [String]) {
        self.Words_List = pWordsList
    }
    
    func addWord (pWord: String) {
        self.Words_List.append(pWord)
    }
    
    func deleteWord (pLastWordID: Int) {
        self.Words_Current_List.remove(at: pLastWordID)
    }
    
    func setCurrentRound (pCurrentRound: Int) {
        self.CurrentRound = pCurrentRound
    }
    
    func setPlayerToPlay (pPlayerToPlay: [Int]) {
        self.PlayerToPlay = pPlayerToPlay
    }
    
    func setNbPointsTurn (pNbPoints: Int) {
        self.NbPointsTurn = pNbPoints
    }
    
     /*
    public void setNbPointsTurnTeamA(int pNbPointsTurn){
    NbPointsTurnTeamA = pNbPointsTurn;
    }
    public void setNbPointsTurnTeamB(int pNbPointsTurn){
    NbPointsTurnTeamB = pNbPointsTurn;
    }
    */
    
    func setNbPointsRoundTeamA (pNbPointsRound: Int) {
        self.NbPointsRoundTeamA = pNbPointsRound
    }
    
    func setNbPointsRoundTeamB (pNbPointsRound: Int) {
        self.NbPointsRoundTeamB = pNbPointsRound
    }
}
