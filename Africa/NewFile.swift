//
//  NewFile.swift
//  Africa
//
//  Created by Ashish Yadav on 10/05/22.
//

/*
 Africa


 - In SwiftUI, Color is a view, so we can add different modifiers to it similarly other UI Components
 - @State is mandatory requirement if we want to create a map in SwiftUI,  because maps are using bindings to keep track of any changes  that may occur in the maps region,  such as  road tracking, panning, spinning, or zooming in or out
 ————————————————————————————————————————————————————————————————————————————————
 MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 14.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))

 - MKCoordinateRegion : We must provide at least two additional piece of information about how the map should work

 CLLocationCoordinate2D(latitude: 6.600286, longitude: 14.4377599)
 - This information is map coordinate that contains the data of the lat and long

 MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)
 - The second information that the map should know is the Zoom level then smaller the value of span the higher the zoom level
 ————————————————————————————————————————————————————————————————————————————————
 Haptics
 It is used to enhance user experience    with your iPhone by implementing a sense of touch as you interact with your iPhone.
 In other words, some of your actions on your iPhone, will trigger a haptic also called a tectile feedback.
 ————————————————————————————————————————————————————————————————————————————————
 GeometryReader
 GeometryReader { geometry in
             Text("Height: \(Int(geometry.size.height)) Width: \(Int(geometry.size.width))")
         }

 With this GeometryReader container, we can measure not only the screen size, but any views size if we wish
 Basically it gives us access to their size and position of the parent to you to see it in action.

 The above code will give us the height and width of screen in points

 IMP:
 When we wrapped any view into our geometry container, then the origin point will be changed from centre to top left
 ————————————————————————————————————————————————————————————————————————————————

 var randomCircle = Int.random(in: 12...16)

 When we use the close range in the ForEach, then we always have to provide some kind of identification

 ForEach(0...randomCircle, id: \.self) { item in
                 //Some code will be here
             }//: ForEach

 ————————————————————————————————————————————————————————————————————————————————

 Drawing Group

 Bydefault Swift uses core animation for its rendering. Which offers great performance out of the box.
 The the DrawingGroup modifier, the complex rendering  of the motion animation won’t slowed down,
 Because this tells the swiftUI that it should render the contents of the view into sequential still images,
 Which are significantly faster than real time rendering.
 Behind the scene, this operation is powered by Metal that is high level framework for working directly with GPU.
 And with this tiny addition, the motion effect won’t suffer any performance reduction.

 ————————————————————————————————————————————————————————————————————————————————

 Grid View

 Simple possible grid is made up of three things
 1. Raw data
 2. Array of grid item describing the layout we want
 3. Either lazy vertical grid or a lazy horizontal grid -> that brings together data and layout


 
 */
