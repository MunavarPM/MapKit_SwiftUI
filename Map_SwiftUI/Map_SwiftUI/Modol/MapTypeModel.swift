//
//  MapTypeModel.swift
//  Map_SwiftUI
//
//  Created by MUNAVAR PM on 10/09/23.
//

import Foundation


enum MapViewType: Int, CaseIterable, Identifiable {
    case Transit
    case Satellite
    case Explore
    
    var id: Int { return rawValue }
    
    var name: String {
        switch self {
        case.Transit: return "Transit"
        case.Satellite: return "Satellite"
        case.Explore: return "Satellite"
        }
    }
    
    var image: String {
        switch self {
        case.Transit: return "PublicTransportation"
        case.Satellite: return "Satellite"
        case.Explore: return "Explore"
        }
    }
}
