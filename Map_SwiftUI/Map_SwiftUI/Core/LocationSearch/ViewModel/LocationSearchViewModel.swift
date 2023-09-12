//
//  LocationSearchViewModel.swift
//  Map_SwiftUI
//
//  Created by MUNAVAR PM on 01/09/23.
//

import Foundation
import MapKit


class LocationSearchViewModel: NSObject, ObservableObject {
    
    @Published var results = [MKLocalSearchCompletion]() /// For getting the search result with related one's
    @Published var selectedMapLocation: MapLocation?
    @Published var startingTime: String?
    @Published var reachingTime: String? 
    
    private let searchCompleter = MKLocalSearchCompleter() /// Search Completer
    
    var queryFragment: String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    var userLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init() /// We need to conform to NSObject class that why we use super.init
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    func selectedLocation(_ localSearch: MKLocalSearchCompletion) {
        locationSearch(forLocalSearchComplete: localSearch) { response, error in
            if let error = error {
                print("DEBUG:- ERROR FROM THE LOCATION SEARCH 🚀 \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            self.selectedMapLocation = MapLocation(title: localSearch.title, coordinate: coordinate)
            print("DEBUG:- the Location  Coordinate\(coordinate)")
        }
    }
    
    func locationSearch(forLocalSearchComplete localSearch: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
    }
    
    func getDestinationRoute(from userLocation: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, completion: @escaping(MKRoute) -> Void) {
        let userPlaceMark = MKPlacemark(coordinate: userLocation)
        let destination = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlaceMark)
        request.destination = MKMapItem(placemark: destination)
        let direction = MKDirections(request: request)
        direction.calculate { response, error in
            if let error = error {
                print("DEGUB:- ERROR FROM GET DESTINATION \(error.localizedDescription)")
                return
            }
            guard let route  = response?.routes.first else { return } ///There have some route so we pick the first one it's fast.
            self.configureTravelTime(with: route.expectedTravelTime)
            completion(route)
        }
    }
    
    func configureTravelTime(with expectedTravelTime: Double) {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        startingTime = formatter.string(from: Date())
        reachingTime = formatter.string(from: Date() + expectedTravelTime)
    }
}

/// For the delegate method access
extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
