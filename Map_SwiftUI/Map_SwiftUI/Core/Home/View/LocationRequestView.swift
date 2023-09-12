//
//  LocationRequestView.swift
//  Map_SwiftUI
//
//  Created by MUNAVAR PM on 03/09/23.
//

import SwiftUI
import MapKit

struct LocationRequestView: View {
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top)
            // location info View
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray))
                        .frame(width: 7, height: 7)
                    Rectangle()
                        .fill(Color(.systemGray))
                        .frame(width: 1, height: 35)
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 9, height: 9)
                }
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text("Current Location")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text(viewModel.startingTime ?? "")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 12)
                    
                    HStack {
                        if let location = viewModel.selectedMapLocation {
                            Text(location.title)
                                .font(.system(size: 20, weight: .semibold))
                        }
                        
                        Spacer()
                        
                        Text(viewModel.reachingTime ?? "")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 8)
            }
            .padding()
            
            Divider()
            
            // location mood
            Text("CHOOSE YOU'RE MAP MOOD 🪐")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(MapViewType.allCases) { type in
                        MapView(image: type.image, text: type.name)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 40)
        }
        .padding(.bottom, 26)
        .background(Color.theme.backGroundColor)
    }
}

struct LocationRequestView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRequestView()
    }
}
