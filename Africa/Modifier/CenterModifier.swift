//
//  CenterModifier.swift
//  Africa
//
//  Created by Ashish Yadav on 18/05/22.
//

import SwiftUI

struct CenterModifier : ViewModifier {
    func body(content : Content) -> some View {
        HStack() {
            Spacer()
            content
            Spacer()
        }
        
    }
}
