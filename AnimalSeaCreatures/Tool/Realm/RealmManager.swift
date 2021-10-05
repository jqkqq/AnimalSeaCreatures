//
//  RealmManager.swift
//  AnimalSeaCreatures

import Foundation
import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    private let realm = try! Realm()
    
    func fetchAll() -> [MyLoveSea] {
        var data: [MyLoveSea] = []
        let allLove = realm.objects(MyLoveSea.self)
        allLove.forEach({ data.append($0) })
        return data
    }
    
    func add(_ seaFeature: Value) {
        let myLoveSea = MyLoveSea()
        myLoveSea.name = seaFeature.name.nameCNzh
        myLoveSea.iconURI = seaFeature.iconURI
        myLoveSea.imageURI = seaFeature.imageURI
        
        let monthArrayNorthen = List<Int>()
        seaFeature.availability.monthArrayNorthern.forEach({
            monthArrayNorthen.append($0)
        })
        myLoveSea.monthArrayNorthern = monthArrayNorthen
        
        let monthArraySouthern = List<Int>()
        seaFeature.availability.monthArraySouthern.forEach({
            monthArraySouthern.append($0)
        })
        myLoveSea.monthArraySouthern = monthArraySouthern
        
        let timeArray = List<Int>()
        seaFeature.availability.timeArray.forEach({
            timeArray.append($0)
        })
        myLoveSea.timeArray = timeArray

        myLoveSea.speed = seaFeature.speed.changeToChinese()
        myLoveSea.price = seaFeature.price
        myLoveSea.shadow = seaFeature.shadow.changeToChinese()
        try! realm.write {
            realm.add(myLoveSea)
        }
    }
    
    func delete(_ seaFeature: MyLoveSea) {
        try! realm.write {            
            realm.delete(seaFeature)
            print(seaFeature.isInvalidated)
        }
        
    }
}
