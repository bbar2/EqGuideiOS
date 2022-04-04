//
//  DmsInput.swift
//  EqGuide
//
//  Display and edit binding to a float for decimalDegrees - using integer
//  Degrees, ArcMinutes and ArcSeconds
//  Although not mathematically necessary, force Deg, Min, and Sec to have the
//  same sign by using  a Sign Button for the group of input fields.
//  Use of Sign Button also addresses .decimalPad lack of sign key.
//  Encapsulate the string conversions here
//  Update the bound value:Float on every keystroke
//  Could add keyboard filtering, but being lazy and relying on .keyboardType
//  Parent must dismiss the view to terminate this editing session
//

import SwiftUI

struct DmsInputView: View {
  @Binding var decimalDegrees: Float
  var prefix = String("")
  
  @State var degString = String(33)
  @State var minString = String(11)
  @State var secString = String(44)
  @State var isPos = true
  
  var body: some View {
    HStack {
      if prefix != "" {
        Text(prefix)
      }
      Spacer()
      
      SignButton(isPos: $isPos)
        .onChange(of: isPos) { _ in
          reBuildFloatInput()
        }
      
      HStack {
        Text("D")
        TextField("dd", text: $degString)
          .frame(width:60)
          .border(.black)
          .onChange(of: degString) { _ in
            reBuildFloatInput()
          }
        
        Spacer()
        Text("M")
        TextField("dd", text: $minString)
          .frame(width:50)
          .border(.black)
          .onChange(of: minString) { _ in
            reBuildFloatInput()
          }
        
        Spacer()
        Text("S")
        TextField("dd", text: $secString)
          .frame(width:50)
          .border(.black)
          .onChange(of: secString) { _ in
            reBuildFloatInput()
          }
        
        Spacer()
      }
      .keyboardType(.numberPad)
      .onAppear() {
        let dms = Dms(deg: decimalDegrees)
        degString = String(abs(dms.deg))
        minString = String(abs(dms.min))
        secString = String(abs(dms.sec))
        isPos = (dms.sign > 0 ? true : false)
      }
    }
    .font(.title)
    .multilineTextAlignment(.center)
  }
  
  func reBuildFloatInput() {
    decimalDegrees = Dms(d: Int(degString) ?? 0,
                         m: Int(minString) ?? 0,
                         s: Int(secString) ?? 0).degrees
    decimalDegrees *= (isPos ? 1.0 : -1.0)
  }
  
}

struct DmsInputView_Previews: PreviewProvider {
  @State static var angle = Float(-90.5)
  
  static var previews: some View {
    DmsInputView(decimalDegrees: $angle)
  }
}
