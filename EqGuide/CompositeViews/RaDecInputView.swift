//
//  RaInputView.swift
//  EqGuide
//
//  Created by Barry Bryant on 3/27/22.
//

import SwiftUI

struct RaDecInputView: View {
  
  var label:String
//  @ObservedObject var coord:RaDec
  @Binding var coordRa: Float
  @Binding var coordDec: Float
  
  @State private var tempRaDec = RaDec()
  @State private var editInFloat = true
  @Environment(\.dismiss) private var dismissView
  
  var body: some View {
    
    VStack {
      Text(label).font(.title)
      
      VStack {
        if editInFloat {
          FloatInputView(floatValue: $tempRaDec.ra, prefix: "RA")
          FloatInputView(floatValue: $tempRaDec.dec, prefix: "DEC")
        } else {
          DmsInputView(decimalDegrees: $tempRaDec.ra, prefix: "RA")
          DmsInputView(decimalDegrees: $tempRaDec.dec, prefix: "DEC")
        }
      }
      Button() {
        editInFloat = !editInFloat
      } label: {
        Text(editInFloat ? "Switch to DMS" : "Switch To Float")
          .font(.title2)
          .bold()
      }
      .onAppear() {
        tempRaDec.ra = coordRa
        tempRaDec.dec = coordDec
      }
      
      BigButton(label:"Apply") {
        coordRa  = tempRaDec.ra
        coordDec = tempRaDec.dec
        dismissView()
      }
    }
    
    Spacer()
  }
}

struct RaInputView_Previews: PreviewProvider {
  //  @StateObject static var crap = RaDec(ra:97.5, dec: 0.25)
//  @StateObject static var testCoord = RaDec(ra: 97.5, dec: 0.25)
  @State static var testRa = Float(97.5)
  @State static var testDec = Float(0.25)
  static var previews: some View {
    RaDecInputView(label: "Enter RA/DEC Pair",
                   coordRa: $testRa,
                   coordDec: $testDec)
  }
}

