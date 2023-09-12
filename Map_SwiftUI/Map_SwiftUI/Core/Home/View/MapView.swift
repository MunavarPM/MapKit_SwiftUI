//
//  MapView.swift
//  Map_SwiftUI
//
//  Created by MUNAVAR PM on 10/09/23.
//

import SwiftUI

struct MapView: View {
    let image: String
    let text: String
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .scaledToFit()
            Text(text)
                .font(.system(size: 14, weight: .semibold))
        }
        .frame(width: 112, height: 140)
        .background(Color.theme.backGroundColor)
        .cornerRadius(10)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(image: "Satellite", text: "Satellite")
    }
}
