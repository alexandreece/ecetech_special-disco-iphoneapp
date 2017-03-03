//
//  Joueur.swift
//  LAMApp
//
//  Created by VRSTL on 03/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import Foundation

class Joueur{
    
    var IDJoueur: Int
    var NomJoueur: String
    
    init() {
        IDJoueur = 0
        NomJoueur = ""
    }
    
    func Joueur (pNomJoueur: String) {
        self.NomJoueur = pNomJoueur
    }
    
    func Joueur (pIDJoueur: Int) {
        self.IDJoueur = pIDJoueur
    }
    
    func Joueur (pNomJoueur: String, pIDJoueur: Int) {
        self.NomJoueur = pNomJoueur
        self.IDJoueur = pIDJoueur
    }
    
    func SetIDJoueur (pIDJoueur: Int) {
        self.IDJoueur = pIDJoueur
    }
    
    func SetNomJoueur (pNomJoueur: String) {
        self.NomJoueur = pNomJoueur
    }
    
    func GetIDJoueur() -> Int {
        return IDJoueur
    }
    
    func GetNomJoueur() -> String {
        return NomJoueur
    }
}
