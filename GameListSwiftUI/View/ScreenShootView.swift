//
//  ScreenShootView.swift
//  GameListSwiftUI
//
//  Created by Macbook Pro  on 08/09/21.
//

import SwiftUI

struct ScreenShootsView: View {
    @ObservedObject var screen: ScreenShootsViewModel
    var body: some View {
        ImageViewScreenShoots(image: screen.screenshoots)
        
    }
}

