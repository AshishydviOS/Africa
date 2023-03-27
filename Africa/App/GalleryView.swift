//
//  GalleryView.swift
//  Africa
//
//  Created by Ashish Yadav on 28/04/22.
//

import SwiftUI

struct GalleryView: View {
    // MARK: PROPERTIES
    let animals : [Animal] = Bundle.main.decode("animals.json")
    @State private var selectedAnimal : String = "lion"
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: SIMPLE GRID DEFINITION
    // let gridLayout : [GridItem] = [
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible())
    // ]
    
    // EFFICIENT GRID DEFINITION
    // let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID LAYOUT
    
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    //initialize with only one Grid Item
    
    @State private var gridColumn : Double = 3.0
    //this will hold the number of the column inside the Grid
    
    //Thia will be called when we move the slider left or right
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                
                //MARK: IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 8))
                
                //MARK: SLIDER
                Slider(value: $gridColumn,
                       in: 2...4,
                       step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { newValue in
                        gridSwitch()
                    }
                
                //MARK: GRID
                LazyVGrid(columns: gridLayout,
                          alignment: .center,
                          spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 1))
    //                        .border(.white, width: 1) // this will add border to cell
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                }//: Grid
                          .animation(.easeIn)
                          .onAppear {
                              gridSwitch()
                          }
            }//: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

//MARK: PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
