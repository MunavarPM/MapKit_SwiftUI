//
//  MapViewActionButton.swift
//  Map_SwiftUI
//
//  Created by MUNAVAR PM on 01/09/23.
//

import SwiftUI

struct MapViewActionButton: View {
    
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        Button {
            withAnimation {
                actionForState(mapState)
            }
        } label: {
            Image(systemName: imageForState(mapState))
                .font(.title2)
                .accentColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: Color.black, radius: 6)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    func actionForState(_ state: MapViewState) {
        switch state {
        case .noInput:
            print("DEBUG:- NO INPUT")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected, .polylineAdded:
            mapState = .noInput
            viewModel.selectedMapLocation = nil
        }
    }
    func imageForState(_ state: MapViewState) -> String {
        switch state {
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected, .polylineAdded:
            return "xmark.circle"
        }
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput))
    }
}
