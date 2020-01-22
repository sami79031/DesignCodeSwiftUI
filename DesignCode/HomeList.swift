//
//  HomeList.swift
//  DesignCode
//
//  Created by Sami Ali on 1/20/20.
//  Copyright © 2020 Sami Ali. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    
    @State var showingDetail = false
    var courser = coursesData
    
    var body: some View {
        
        VStack {
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Courses")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Text("22 Courses")
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.leading, 70)
            .padding(.bottom, 40)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(coursesData) { item in
                        Button(action: {
                            self.showingDetail.toggle()
                        }) {
                            CourseView(title: item.title,
                                       image: item.image,
                                       color: item.color,
                                       shadowColor: item.shadowCollor)
                        }.sheet(isPresented: self.$showingDetail) {
                            ContentView()
                        }
                    }
                    
                }
                .padding(.leading, 40)
            }
            
            Spacer()
        }
        .padding(.top, 79)
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    var title = ""
    var image = ""
    var color = Color.white
    var shadowColor = Color.white
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(20)
                .lineLimit(4)
                .padding(.trailing, 50)
            
            Spacer()
            Image(image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom, 30)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
        .padding(.bottom, 100)
    }
}


struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowCollor: Color
}

let coursesData = [
    Course(title: "Build an App",
           image: "Illustration1",
           color: Color("background3"),
           shadowCollor: Color("backgroundShadow3")),
    
    Course(title: "Build an App",
           image: "Illustration2",
           color: Color("background2"),
           shadowCollor: Color("backgroundShadow3")),
    
    Course(title: "Build an App",
           image: "Illustration1",
           color: Color("background3"),
           shadowCollor: Color("backgroundShadow3")),
    
    Course(title: "Build an App",
           image: "Illustration1",
           color: Color("background3"),
           shadowCollor: Color("backgroundShadow3")),
    
    Course(title: "Build an App",
           image: "Illustration1",
           color: Color("background3"),
           shadowCollor: Color("backgroundShadow3"))
]
