//
//  LocationSearchActivationView.swift
//  Map_SwiftUI
//
//  Created by MUNAVAR PM on 01/09/23.
//

import SwiftUI

struct LocationSearchActivationView: View {
    
    
    var body: some View {
        HStack(spacing: 50) {
            Image(systemName: "location.circle")
                .font(.system(size: 25))
                .foregroundColor(.black)
                .padding(.horizontal)
            Text("Search here.!")
                .foregroundColor(Color.gray)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 60)
        .background(
            Capsule()
                .fill(Color.white)
                .shadow(color: Color.black, radius: 6)  
        )
    }
}

struct LocationSearchActivationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView()
    }
}
