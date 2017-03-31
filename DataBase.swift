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
    
    var previousWord = String()
    static let KeyPreviousWord = "KeyPreviousWord"
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(previousWord, forKey:PreviousWord.KeyPreviousWord)
    }
    
    override init() {
        super.init()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        if let value = aDecoder.decodeObject(forKey: PreviousWord.KeyPreviousWord) as? String {
            self.previousWord = value
        }
    }
    
    public init?(previousWord : String) {
        self.previousWord = previousWord
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
    var score = String()
    var date = String()
    var nbPlayer = String()
    var niveau = String()
    
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
        if let value = aDecoder.decodeObject(forKey: Score.KeyScore) as? String {
            self.score = value
        }
        if let value = aDecoder.decodeObject(forKey: Score.KeyDate) as? String {
            self.date = value
        }
        if let value = aDecoder.decodeObject(forKey: Score.KeyNbPlayer) as? String {
            self.nbPlayer = value
        }
        if let value = aDecoder.decodeObject(forKey: Score.KeyNiveau) as? String {
            self.niveau = value
        }
    }
}

class PreviousWordDataBase : NSObject {
    private static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    private static let ArchiveURL = DocumentsDirectory.appendingPathComponent("PreviousWordsList")
    static let shared = PreviousWordDataBase()
    public var delegate : DataBaseDelegate? = nil
    public var objects = [PreviousWord]()
    
    func saveToDisk() -> Bool {
        return NSKeyedArchiver.archiveRootObject(objects, toFile:PreviousWordDataBase.ArchiveURL.path)
    }
    
    func loadFromDisk() -> Bool {
        if let data = NSKeyedUnarchiver.unarchiveObject(withFile: PreviousWordDataBase.ArchiveURL.path) as? [PreviousWord] {
            objects = data
            return true
        }
        return false
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

class ScoreDataBase: NSObject {
    private static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    private static let ArchiveURL = DocumentsDirectory.appendingPathComponent("ScoresCache")
    static let shared = ScoreDataBase()
    public var delegate : DataBaseDelegate? = nil
    public var objects = [Score]()
    
    public func loadData() {
        let path = "http://78.192.156.30:8050/LAMA/api/index.php/teams/Best"
        
        if let url = URL(string: path) {
            let task = URLSession.shared.dataTask(with: url, completionHandler:
            { (data, response, error) -> Void in
                guard let data = data, error == nil else
                {
                    return
                }
                // ok
                self.parseJSON(data: data)
            })
            task.resume()
        }
    }
    
    func parseJSON(data : Data) {
        do {
            let dataJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments )
            guard let root = dataJson as? [[String : AnyObject]] else {
                return
            }
            objects.removeAll()
            
            for item in root {
                let dataItem = Score()
                
                if let nomEquipeEntry = item["NomTeam"] as? String {
                    dataItem.nomEquipe = nomEquipeEntry
                }
                if let scoreEntry = item["Score"] as? String {
                    dataItem.score = scoreEntry
                }
                if let dateEntry = item["Date"] as? String {
                    dataItem.date = dateEntry
                }
                if let nbPlayerEntry = item["NbPlayer"] as? String {
                    dataItem.nbPlayer = nbPlayerEntry
                }
                if let niveauEntry = item["Niveau"] as? String {
                    dataItem.niveau = niveauEntry
                }
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
        catch {
            assert( false )
            return
        }
    }
    
    func saveToDisk() -> Bool {
        return NSKeyedArchiver.archiveRootObject(objects, toFile: ScoreDataBase.ArchiveURL.path)
    }
    
    func loadFromDisk() -> Bool {
        if let data = NSKeyedUnarchiver.unarchiveObject(withFile: ScoreDataBase.ArchiveURL.path) as? [Score] {
            objects = data
            return true
        }
        return false
    }
}
