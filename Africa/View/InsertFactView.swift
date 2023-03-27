//
//  InsertFactView.swift
//  Africa
//
//  Created by Ashish Yadav on 04/05/22.
//

import SwiftUI

struct InsertFactView: View {
    //MARK: - PROPERTY
    let animal : Animal
    
    //MARK: - BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact ,id: \.self) { item in
                    Text(item)
                }
            } //: TabView
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
            
            
        }//: GroupBox
    }
}

//MARK: - PREVIEW
struct InsertFactView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsertFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
