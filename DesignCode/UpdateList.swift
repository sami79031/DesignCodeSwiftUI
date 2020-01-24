//
//  UpdateList.swift
//  DesignCode
//
//  Created by Sami Ali on 1/20/20.
//  Copyright © 2020 Sami Ali. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    
    var updates = updateData
    var body: some View {
        NavigationView {
            List(updates) { item in
                
                NavigationLink(destination: UpdateDetail(item: item)) {
                    HStack(spacing: 12.0) {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .background(Color("background"))
                            .cornerRadius(20)
                        
                        VStack(alignment: .leading) {
                            Text("\(item.title)")
                                .font(.headline)
                            Text("\(item.text)")
                                .lineLimit(2)
                                .lineSpacing(3)
                                .font(.subheadline)
                                .padding(.trailing)
                                .padding(.top)
                                .padding(.bottom)
                            
                            Text("\(item.date)")
                                .font(.caption)
                        }
                    }
                }
                .padding(.vertical, 8.0)
            }
            .navigationBarTitle(Text("Updates"))
            .navigationBarItems(trailing:
                Button(action: {
                    print("button pressed")
                    
                }) {
                    Image("IconSettings")
                }
            )
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}



struct Update: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var text: String
    var date: String
}

let updateData = [
    Update(title: "Build an App1",
           image: "Illustration1",
           text: "bla bla",
           date: "Jun 26"),
    
    Update(title: "Build an App2",
           image: "Illustration2",
           text: "oooss",
           date: "Jul 13"),
    
    Update(title: "Build an App3",
           image: "Illustration1",
           text: "pakjsfjsehfjhsekjhfkjshekjfhjkhfkjhrjkghdrjkhdhrjlghjrdhlghdjrhgjdhrjghdjrhgjldrhgldhrjghrjhdkjrhgkjdrhjkghdrjhgkdrjhgdjkrhgjrhgdjhglsjjefhjsefsfjspakjsfjsehfjhsekjhfkjshekjfhjkhfkjhrjkghdrjkhdhrjlghjrdhlghdjrhgjdhrjghdjrhgjldrhgldhrjghrjhdkjrhgkjdrhjkghdrjhgkdrjhgdjkrhgjrhgdjhglsjjefhjsefsfjs",
           date: "Jan 1"),
    
    Update(title: "Build an App4",
           image: "Illustration1",
           text: "background3",
           date: "Dec 2"),
    
    Update(title: "Build an App5",
           image: "Illustration1",
           text: "Olllaa",
           date: "Sep 15")
]
