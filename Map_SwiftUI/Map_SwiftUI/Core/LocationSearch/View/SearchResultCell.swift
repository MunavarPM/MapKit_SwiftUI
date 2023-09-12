//
//  LocationSearchResultCell.swift
//  Map_SwiftUI
//
//  Created by MUNAVAR PM on 01/09/23.
//

import SwiftUI

struct LocationSearchResultCell: View {
    let title: String
    let subtitle: String
    var body: some View {
        HStack {
            Image("SearchLogo")
                .resizable()
                .scaledToFit()
                .background(Color.blue)
                .clipShape(Circle())
                .frame(width: 40, height: 42)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body).bold()
                    .foregroundColor(Color.theme.secondaryColor)
                
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading, 6)
        }
        .padding(.leading)
        .background(Color.theme.backGroundColor)
        
    }
}

struct LocationSearchResultCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResultCell(title: "Forum Mall", subtitle: "Maradu, West near HighWay")
    }
}
