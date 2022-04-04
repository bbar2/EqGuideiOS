//
//  ContentView.swift
//  Guide
//
//  Created by Barry Bryant on 12/18/21.
//

import SwiftUI


struct ContentView: View {
  
 @EnvironmentObject var guideModel:GuideModel
  
  var body: some View {
    // ToDo - Add Tab View with GuideView() and FocusControl() as tabs.
    GuideView()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(GuideModel())
      .previewDevice(PreviewDevice(rawValue: "iPhone Xs"))
      .previewInterfaceOrientation(.portrait)
  }
}

