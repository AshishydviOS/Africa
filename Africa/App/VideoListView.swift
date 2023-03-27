//
//  VideoListView.swift
//  Africa
//
//  Created by Ashish Yadav on 28/04/22.
//

import SwiftUI

struct VideoListView: View {
    //MARK: PROPERTIES
    @State var videos : [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: {
                        VideoPlayerView(videoSelected: item.id,
                                        videoTitle: item.name)
                    }) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                } //: Loop
            } //: List
            .listStyle(.grouped)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        } //: NavigationView
    }
}

//MARK: PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
