//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Ashish Yadav on 05/05/22.
//

import SwiftUI

struct ExternalWeblinkView: View {
    //MARK: - PROPERTY
    let animal : Animal
    
    //MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.com")!)
                }
                .foregroundColor(.accentColor)
            }//: HStack
        }//: GroupBox
    }
}

//MARK: - PREVIEW
struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
