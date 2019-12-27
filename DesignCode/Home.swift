//
//  Home.swift
//  DesignCode
//
//  Created by Sami Ali on 12/27/19.
//  Copyright © 2019 Sami Ali. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            MenuRow(image: "person.crop.circle", text: "My Account")
            MenuRow(image: "creditcard", text: "Billing")
            MenuRow(image: "person.and.person", text: "Team")
            MenuRow(image: "arrow.uturn.left", text: "Sign Out")
            Spacer()
        }
        .padding(.top, 60)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "My Account"
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(.red)
                .frame(width: 32, height: 32)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}
