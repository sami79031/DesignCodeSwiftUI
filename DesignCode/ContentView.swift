//
//  ContentView.swift
//  DesignCode
//
//  Created by Sami Ali on 12/20/19.
//  Copyright © 2019 Sami Ali. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardView()
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .animation(.easeIn(duration: 1.1))
                .offset(x: viewState.width, y: viewState.height)
            CardView()
                .background(show ? Color.blue : Color.yellow)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -100 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .animation(.easeIn(duration: 0.9))
                .offset(x: viewState.width, y: viewState.height)
            
            CertificateView()
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .animation(.easeIn(duration: 0.7))
                .onTapGesture {
                    self.show.toggle()
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.viewState = value.translation
                        self.show = true
                    }
                    .onEnded { value in
                        self.viewState = .zero
                        self.show = false
                    }
            )
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            Text("Card Back")
        }
        .frame(width: 340.0, height: 220.0)
    }
}

struct CertificateView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Certificate")
                        .font(.body)
                        .foregroundColor(.white)
                        .cornerRadius(22)
                    Text("UI Design")
                        .font(.title)
                        .foregroundColor(.blue)
                    
                }
                .padding()
                Spacer()
                Image("aish")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .padding()
                
            }
            Spacer()
        }
        .frame(width: 340.0, height: 220.0)
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 20)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Spacer()
        }.padding()
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Rectangle()
                .frame(width: 60, height:6)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("This certificate is proof that ....")
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: 600)
    }
}
