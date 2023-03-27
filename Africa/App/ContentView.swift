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
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive : Bool = false
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Int = 1
    @State private var toolbarIcon : String = "square.grid.2x2"
    
    //MARK: FUNCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()),
                           count: (gridLayout.count % 3) + 1)
        gridColumn = gridLayout.count
        print("Grid Number : \(gridColumn)")
        
        //TOOLBAR IMAGE
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
        
    }
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
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
                            }//: Navigation Link
                        }//: Loop
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    }//: List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout,
                                  alignment: .center,
                                  spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalGridItemView(animal: animal)
                                }//: Link
                            }//: Loop
                        }//: LazyVGrid
                                  .padding(10)
                                  .animation(.easeIn)
                    }//: Scrollview
                }//: Condition
            }//: Group
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        //List
                        Button {
                            print("List view button is clicked")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        //Grid
                        Button {
                            print("Grid view button is clicked")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                            
                        }


                    }//: HStack
                }//: Buttons
            }//: toolbar
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
