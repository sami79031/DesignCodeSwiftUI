//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by Sami Ali on 1/24/20.
//  Copyright © 2020 Sami Ali. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var item: Update?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(item?.title ?? "")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Image(item?.image ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            Text(item?.text ?? "")
                .lineLimit(nil)
            
            Spacer()
        }
        .padding(30)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
