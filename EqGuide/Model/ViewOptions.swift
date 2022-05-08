//
//  ViewOptions.swift
//  EqGuide
//
//  Created by Barry Bryant on 4/23/22.
//

import SwiftUI

final class ViewOptions: ObservableObject {
  @Environment(\.colorScheme) var colorScheme
    
  @Published var forceDarkMode = false
  
  let appRedColor = Color(red:159/255, green: 0, blue: 0)
  let appActionColor = Color(red:200.0/255.0, green: 0, blue: 0)
  let appDisabledColor = Color(.gray)
  let confNoneColor = Color(.yellow)
  let confEstColor = Color(.orange)
  let thumbColor = Color(red: 0.2, green: 0.0, blue: 0.0)
  let thumbBarColor = Color(red: 0.05, green: 0.0, blue: 0.0)
  

  var fontColor : Color {
    return (forceDarkMode || colorScheme == .dark ? appRedColor : .black)
  }
    
  let appHeaderFont = Font.system(.title).monospacedDigit()
  let labelFont = Font.system(.title3)
  let bigValueFont = Font.system(.title2).bold().monospacedDigit()
  let noteFont =  Font.system(.body)
  
  let leadingPad = CGFloat(10)
  let trailingPad = CGFloat(10)
}
