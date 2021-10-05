//
//  MyLoveSea.swift
//  AnimalSeaCreatures


import Foundation
import RealmSwift

class MyLoveSea: Object {

    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var imageURI = ""
    @objc dynamic var iconURI = ""
    @objc dynamic var price = 0
    @objc dynamic var shadow = ""
    @objc dynamic var speed = ""
    var monthArrayNorthern = List<Int>()
    var monthArraySouthern = List<Int>()
    var timeArray = List<Int>()

    override static func primaryKey() -> String? {
        return "id"
    }
}

extension MyLoveSea {
    func changeToValue() -> Value {
        var montharrayNorthern: [Int] = []
        var monthArraySouthern: [Int] = []
        var timeArray: [Int] = []

        self.monthArrayNorthern.forEach({ montharrayNorthern.append($0) })
        self.monthArraySouthern.forEach({ monthArraySouthern.append($0) })
        self.timeArray.forEach({ timeArray.append($0) })

        let value = Value(id: 0,
                          name: Name(nameCNzh: self.name),
                          availability: Availability(monthArrayNorthern: montharrayNorthern, monthArraySouthern: monthArraySouthern, timeArray: timeArray),
                          speed: changeToSpeed(self.speed),
                          shadow: changeToShadow(self.shadow),
                          price: self.price,
                          imageURI: self.imageURI,
                          iconURI: self.iconURI)
        return value
    }

    private func changeToShadow(_ string: String) -> Shadow {
        switch string {
        case "大":
            return Shadow.large
        case "特大":
            return Shadow.largest
        case "中":
            return Shadow.medium
        case "小":
            return Shadow.small
        case "特小":
            return Shadow.smallest
        default:
            fatalError("代入的值錯誤")
        }
    }

    private func changeToSpeed(_ string: String) -> Speed {
        switch string {
        case "快":
            return Speed.fast
        case "正常":
            return Speed.medium
        case "慢":
            return Speed.slow
        case "平穩的":
            return Speed.stationary
        case "非常快":
            return Speed.veryFast
        case "非常慢":
            return Speed.verySlow
        default:
            fatalError("代入的值錯誤")
        }
    }
}
