//
//  SeaFeature.swift
//  AnimalSeaCreatures

import Foundation

typealias SeaFeature = [String: Value]

// MARK: - Value
struct Value: Codable {    
    let id: Int
    let name: Name
    let availability: Availability
    let speed: Speed
    let shadow: Shadow
    let price: Int
    let imageURI, iconURI: String

    enum CodingKeys: String, CodingKey {
        case name, availability, speed, shadow, price, id
        case imageURI = "image_uri"
        case iconURI = "icon_uri"
    }
}

// MARK: - Availability
struct Availability: Codable {
    let monthArrayNorthern, monthArraySouthern, timeArray: [Int]

    enum CodingKeys: String, CodingKey {
        case monthArrayNorthern = "month-array-northern"
        case monthArraySouthern = "month-array-southern"
        case timeArray = "time-array"
    }
}

// MARK: - Name
struct Name: Codable {
    let nameCNzh: String

    enum CodingKeys: String, CodingKey {
        case nameCNzh = "name-CNzh"

    }
}

enum Shadow: String, Codable {
    case large = "Large"
    case largest = "Largest"
    case medium = "Medium"
    case small = "Small"
    case smallest = "Smallest"
}

enum Speed: String, Codable {
    case fast = "Fast"
    case medium = "Medium"
    case slow = "Slow"
    case stationary = "Stationary"
    case veryFast = "Very fast"
    case verySlow = "Very slow"
}

extension Speed {
    func changeToChinese() -> String {
        switch self {
        case .fast:
            return "快"
        case .medium:
            return "正常"
        case .slow:
            return "慢"
        case .stationary:
            return "平穩的"
        case .veryFast:
            return "非常快"
        case .verySlow:
            return "非常慢"
        }
    }
    
}


extension Name: Hashable {
}

extension Shadow {
    func changeToChinese() -> String {
        switch self {
        case .large:
            return "大"
        case .largest:
            return "特大"
        case .medium:
            return "中"
        case .small:
            return "小"
        case .smallest:
            return "特小"
        }
    }
    
}
