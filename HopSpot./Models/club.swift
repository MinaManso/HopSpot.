//
//  location.swift
//  HopSpot.
//
//  Created by Ben Roman on 2024-07-05.
//

import Foundation
import CoreLocation

enum bcType: String, Codable {
    case Club
    case Bar
}

enum busynessType: Int, Codable {
    case Empty
    case Light
    case Moderate
    case Busy
    case VeryBusy
}

struct Club: Codable, Identifiable {
    var id: String
    var name: String
    var address: String
    var rating: Double
    var description: String
    var imageURL: String
    var latitude: Double
    var longitude: Double
    var busyness: busynessType

    init(id: String, name: String, address: String, rating: Double, description: String, imageURL: String, latitude: Double, longitude: Double, busyness: Int) {
        self.id = id
        self.name = name
        self.address = address
        self.rating = rating
        self.description = description
        self.imageURL = imageURL
        self.latitude = latitude
        self.longitude = longitude
        self.busyness = Club.updateBusyness(from: busyness)
    }

    static func updateBusyness(from num: Int) -> busynessType {
        switch num {
        case 0..<10:
            return .Empty
        case 10..<30:
            return .Light
        case 30..<60:
            return .Moderate
        case 60..<90:
            return .Busy
        default:
            return .VeryBusy
        }
    }
    
    var location: CLLocation {
            return CLLocation(latitude: latitude, longitude: longitude)
        }
}
