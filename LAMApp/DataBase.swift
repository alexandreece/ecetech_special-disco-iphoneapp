//
//  DataBase.swift
//  LAMApp
//
//  Created by Alexandre on 03/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import UIKit

protocol DataBaseDelegate {
    func didLoadData()
    func didLoadDataAtIndex( index : Int)
}

class PreviousWord : NSObject, NSCoding {
    
    var idPreviousWord = Int()
    var previousWord = String()
    
    static let KeyIdPreviousWord = "KeyIdPreviousWord"
    static let KeyPreviousWord = "KeyPreviousWord"
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(idPreviousWord, forKey: PreviousWord.KeyIdPreviousWord)
        aCoder.encode(previousWord, forKey:PreviousWord.KeyPreviousWord)
    }
    
    override init() {
        super.init()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        if let value = aDecoder.decodeObject(forKey: PreviousWord.KeyIdPreviousWord) as? Int {
            self.idPreviousWord = value
        }
        if let value = aDecoder.decodeObject(forKey: PreviousWord.KeyPreviousWord) as? String {
            self.previousWord = value
        }
    }
}

class Word: NSObject, NSCoding {
    var idWord = Int()
    var category = String()
    var word = String()
    
    static let KeyIdWord = "KeyIdWord"
    static let KeyCatagory = "KeyCategory"
    static let KeyWord = "KeyWord"
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(idWord, forKey: Word.KeyIdWord)
        aCoder.encode(category, forKey: Word.KeyCatagory)
        aCoder.encode(word, forKey: Word.KeyWord)
    }
    
    override init() {
        super.init()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        if let value = aDecoder.decodeObject(forKey: Word.KeyIdWord) as? Int {
            self.idWord = value
        }
        if let value = aDecoder.decodeObject(forKey: Word.KeyCatagory) as? String {
            self.category = value
        }
        if let value = aDecoder.decodeObject(forKey: Word.KeyWord) as? String {
            self.word = value
        }
    }
}

class Score: NSObject, NSCoding {
    var nomEquipe = String()
    var score = Int()
    var date = String()
    var nbPlayer = Int()
    var niveau = Int()
    
    static let KeyNomEquipe = "KeyNomEquipe"
    static let KeyScore = "KeyScore"
    static let KeyDate = "KeyDate"
    static let KeyNbPlayer = "KeyNbPlayer"
    static let KeyNiveau = "KeyNiveau"
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nomEquipe, forKey: Score.KeyNomEquipe)
        aCoder.encode(score, forKey: Score.KeyScore)
        aCoder.encode(date, forKey: Score.KeyDate)
        aCoder.encode(nbPlayer, forKey: Score.KeyNbPlayer)
        aCoder.encode(niveau, forKey:Score.KeyNiveau)
    }
    
    override init() {
        super.init()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        if let value = aDecoder.decodeObject(forKey: Score.KeyNomEquipe) as? String {
            self.nomEquipe = value
        }
        if let value = aDecoder.decodeObject(forKey: Score.KeyScore) as? Int {
            self.score = value
        }
        if let value = aDecoder.decodeObject(forKey: Score.KeyDate) as? String {
            self.date = value
        }
        if let value = aDecoder.decodeObject(forKey: Score.KeyNbPlayer) as? Int {
            self.nbPlayer = value
        }
        if let value = aDecoder.decodeObject(forKey: Score.KeyNiveau) as? Int {
            self.niveau = value
        }
    }
}

class WordDataBase: NSObject {
    private static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    private static let ArchiveURL = DocumentsDirectory.appendingPathComponent("WordsList")
    static let shared = WordDataBase()
    public var delegate : DataBaseDelegate? = nil
    public var objects = [Word]()
    
    public func loadData() {
        let asset = NSDataAsset(name: "WordsList", bundle: Bundle.main) //Je ne sais pas si le if let s'impose, on protegerait uniquement une coquille...
        parseJSON(asset: asset!)
    }
    
    func parseJSON(asset : NSDataAsset) {
        let json = try? JSONSerialization.jsonObject(with: asset.data, options: JSONSerialization.ReadingOptions.allowFragments)
        
        guard let root = json as? [ String : AnyObject] else
        {
            return
        }
        guard let mots = root["objects"] as? [[ String : AnyObject]] else
        {
            return
        }
        objects.removeAll()
        
        for item in mots {
            let dataItem = Word()
            
            if let motEntry = item["word"] as? String {
                dataItem.word = motEntry
            }
            if let IDMotEntry = item["id"] as? Int {
                dataItem.idWord = IDMotEntry
            }
            if let categoryEntry = item["category"] as? String {
                dataItem.category = categoryEntry
            }
            //            print(dataItem.word)
            objects.append(dataItem)
        }
        if (self.saveToDisk())
        {
            print("Save OK")
        }
        else
        {
            print("Save ERROR")
        }
        
        DispatchQueue.main.async
            {
                self.delegate?.didLoadData()
        }
    }
    
    func saveToDisk() -> Bool {
        return NSKeyedArchiver.archiveRootObject(objects, toFile: WordDataBase.ArchiveURL.path)
    }
    
    func loadFromDisk() -> Bool {
        if let data = NSKeyedUnarchiver.unarchiveObject(withFile: WordDataBase.ArchiveURL.path) as? [Word]
        {
            objects = data
            return true
        }
        return false
    }
    
}
