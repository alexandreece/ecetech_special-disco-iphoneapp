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

class PreviousWordDataBase: NSObject {
    private static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    private static let ArchiveURL = DocumentsDirectory.appendingPathComponent("PreviousWords")
    static let shared = PreviousWordDataBase()
    public var delegate : DataBaseDelegate? = nil
    public var objects = [PreviousWord]()
    
    public func loadData() {
        let asset = NSDataAsset(name: "Previous Words", bundle: Bundle.main) //Je ne sais pas si le if let s'impose, on protegerait uniquement une coquille...
        parseJSON(asset: asset!)
    }
    
    func parseJSON(asset : NSDataAsset) {
        let json = try? JSONSerialization.jsonObject(with: asset.data, options: JSONSerialization.ReadingOptions.allowFragments)
        print(json!)
        //TODO PARSER
    }
    
    func saveToDisk() -> Bool {
        return NSKeyedArchiver.archiveRootObject(objects, toFile: PreviousWordDataBase.ArchiveURL.path)
    }
    
    func loadFromDisk() -> Bool {
        if let data = NSKeyedUnarchiver.unarchiveObject(withFile: PreviousWordDataBase.ArchiveURL.path) as? [PreviousWord]
        {
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
        print(json!)
        
        
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
