//
//  Home.swift
//  DesignCode
//
//  Created by Sami Ali on 12/27/19.
//  Copyright © 2019 Sami Ali. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State var show = false
    @State var showProfile = false
    var menu = menuData
    
    var body: some View {
        
        ZStack {
            
            HomeList()
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)
            
            ContentView()
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.easeIn)
                .offset(y: showProfile ? 40 : UIScreen.main.bounds.height)
            
            VStack {
                HStack {
                    MenuButton(show: $show)
                        .offset(x: -30, y: showProfile ? 0 : 80)
                        .animation(.easeIn)
                    Spacer()
                    MenuRight(show: $showProfile)
                        .offset(x: -16, y: showProfile ? 0 : 80)
                        .animation(.easeIn)
                }
                Spacer()
            }
            
            MenuView(menu: menu, show: $show)
            
        }
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

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

struct MenuView: View {
    var menu: [Menu]
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(menu) { item in
                MenuRow(image: item.icon, text: item.title)
            }
            Spacer()
        }
        .padding(.top, 60)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0 : 40), axis: (x: 0, y: 10, z: 0))
        .animation(.easeInOut)
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign Out", icon: "arrow.uturn.left")
]

struct CircleButton: View {
    var icon = "person.crop.circle"
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color.black)
        }
        .frame(width: 44, height: 44)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color.gray, radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    @Binding var show: Bool
    var body: some View {
        ZStack {
            Button(action: { self.show.toggle() } ) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash")
                        .foregroundColor(Color.black)
                }
                .padding(.trailing, 20)
                .frame(width: 90, height: 60)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color.gray, radius: 10, x: 0, y: 10)
                
            }
        }
    }
}

struct MenuRight: View {
    @Binding var show: Bool
    var body: some View {
        ZStack {
            HStack {
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "person.crop.circle")
                }
                
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "bell")
                }
            }
        }
    }
}
