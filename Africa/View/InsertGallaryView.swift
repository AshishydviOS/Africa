//
//  InsertGallaryView.swift
//  Africa
//
//  Created by Ashish Yadav on 04/05/22.
//

import SwiftUI

struct InsertGallaryView: View {
    //MARK: - PROPERTY
    let animal : Animal
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }//: LOOP
            }//: HStack
        }//: ScrollView
    }
}

//MARK: - PREVIEW
struct InsertGallaryView_Previews: PreviewProvider {
    static let animal : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsertGallaryView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
