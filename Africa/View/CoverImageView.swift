//
//  CoverImageView.swift
//  Africa
//
//  Created by Ashish Yadav on 30/04/22.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - PROPERTY
    let coverImages : [CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: - BODY
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//: Loop
        } //: Tabview
        .tabViewStyle(.page)
        
        
    }
}

//MARK: - PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
