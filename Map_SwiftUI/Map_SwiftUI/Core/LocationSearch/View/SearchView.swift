//
//  LocationSearchView.swift
//  Map_SwiftUI
//
//  Created by MUNAVAR PM on 01/09/23.
//

import SwiftUI

struct LocationSearchView: View {
    
    @State private var startLocationSearch = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray))
                        .frame(width: 6, height: 6)
                    Rectangle()
                        .fill(Color(.systemGray))
                        .frame(width: 1, height: 30)
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 6, height: 6)
                }
                
                VStack {
                    TextField("Current Location", text: $startLocationSearch)
                        .padding()
                        .background(Color(.systemGroupedBackground))
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .clipShape(Capsule())
                        .padding(.trailing)
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .padding()
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .clipShape(Capsule())
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 60)
            .padding(.vertical)
            .background(.ultraThinMaterial)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) { result in
                        LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    viewModel.selectedLocation(result)
                                    mapState = .locationSelected
                                }
                            }
                    }
                }
            }
        }
        .background(Color.theme.backGroundColor)
        .cornerRadius(24)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(mapState: .constant(.searchingForLocation))
    }
}
