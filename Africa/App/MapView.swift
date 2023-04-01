//
//  MapView.swift
//  Africa
//
//  Created by Ashish Yadav on 28/04/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: PROPERTIES
    @State private var region : MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286,
                                                    longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0,
                                            longitudeDelta: 70.0)
        var mapRegion : MKCoordinateRegion = MKCoordinateRegion(center: mapCoordinates,
                                                             span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let location : [NationParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: BODY
    var body: some View {
        //MARK: - NO1 BASIC MAP
        //Map(coordinateRegion: $region)
        
        //MARK: - No2 ADVANCED MAP
        Map(coordinateRegion: $region,
            annotationItems: location) { item in
            // (A) PIN: OLD STYLE (always static)
            // MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (B) CUSTOME BASIC ANNOTATION (it could be interactive)
            // MapAnnotation(coordinate: item.location) {
            //     Image("logo")
            //         .resizable()
            //         .scaledToFit()
            //         .frame(width: 32, height: 32, alignment: .center)
            // }//: ANNOTATION
            
            // (C) CUSTOM ADVANCE ANNOTATION (It could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }//: MAP
        }
            .overlay (
                HStack(alignment: .center, spacing: 12) {
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        HStack {
                            Text("Latitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(Color.accentColor)
                            Spacer()
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .foregroundColor(Color.white)
                        }
                        Divider()
                        HStack {
                            Text("longitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(Color.accentColor)
                            Spacer()
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .foregroundColor(Color.white)
                        }
                    }//: VStack
                }//: HStack
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                    .padding(), alignment: .top
            )//: Overlay
            
    }
}

//MARK: PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
