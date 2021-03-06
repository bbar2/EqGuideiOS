//
//  SignButton.swift
//  EqGuide
//
//  Created by Barry Bryant on 3/31/22.
//
// Button to set sign of a numeric value input via a TextField.
//

import SwiftUI

struct SignButton: View {
  @Binding var isPos:Bool
  
  @EnvironmentObject var viewOptions: ViewOptions
  
  var body: some View {
    Button() {
      isPos = !isPos
    } label: {
      Text(isPos ? "＋" : "−")
        .font(.title)
        .bold()
        .foregroundColor(viewOptions.appActionColor)
    }
  }
}

struct SignButton_Previews: PreviewProvider {
  @State static var trueBinding = true
  @State static var falseBinding = false
  static var previews: some View {
    Group {
      SignButton(isPos: $trueBinding)
      SignButton(isPos: $falseBinding)
    }
    .previewLayout(.fixed(width: 300, height: 50))
    .environmentObject(ViewOptions())
    .preferredColorScheme(.dark)
  }
}
