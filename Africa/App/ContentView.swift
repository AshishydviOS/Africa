//
//  ContentView.swift
//  Africa
//
//  Created by Ashish Yadav on 28/04/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTY
    let animals : [Animal] = Bundle.main.decode("animals.json")
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .padding(.bottom, 8)
                
                ForEach(animals) { item in
                    NavigationLink {
                        //Destination
                        AnimalDetailView(animal: item)
                    } label: {
                        //Label
                        AnimalListItemView(animal: item)
                            .padding(.vertical, 8)
                            .listRowSeparator(Visibility.hidden)
                    }
                }
            }
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        }//: NavigationView
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
