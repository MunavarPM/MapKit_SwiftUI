//
//  HomeView.swift
//  Map_SwiftUI
//
//  Created by MUNAVAR PM on 31/08/23.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @State private var mapState = MapViewState.noInput
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                MapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                if mapState == .searchingForLocation  {
                    LocationSearchView(mapState: $mapState)
                } else if mapState == .noInput {
                    LocationSearchActivationView()
                        .padding(.top, 70)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                mapState = .searchingForLocation
                            }
                        }
                }
                MapViewActionButton(mapState: $mapState)
                    .padding(.leading, 23)
                    .padding(.top, 5)
            }
            if mapState == .locationSelected || mapState == .polylineAdded {
                LocationRequestView()
                    .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(LocationManager.shared.$userLocation) { location in
            if let location = location {
                viewModel.userLocation = location
                print("DUBUG:- USER LOCATION IN HOME VIEW 🚀 \(location)")
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
