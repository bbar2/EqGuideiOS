//
//  GuideDataBlock.swift
//  EqGuide
//
//  Created by Barry Bryant on 4/2/22.
//
//  Structure received from Mount microcontroller via Bluetooth receive operation.
//  Ensure 32 bit sized words to match 32 bit microcontroller.
//
//  The mount arm rotates in Right Ascension.
//  The mount disk rotates in Declination.
//  The relationship is dependent on arm hemisphere determined by RA vs LST
//    If RA >= LST (Local Sidereal Time)
//      armAngle = LST + 90 - RA
//      diskAngle = DEC
//    Else If RA <= LST
//      armAngle = LST - 90 - RA
//      diskAngle = -DEC

import Foundation

// Must match Arduino project enum in NAppBleLogic.hpp
enum MountState:Int32 {
  case PowerUp = 0
  case ReadyOffset
  case ReadyMark
  case ReadyGuide
  case Guiding
  case GuideComplete
  case Pointing
  case PointComplete
  case Stopping
  case ReadyShutter
  case ShutterControl
  case StateError
}

struct GuideDataBlock {
  var armDegPerStep: Float32 = 1.0    // really, Degrees per MicroStep
  var diskDegPerStep: Float32 = 1.0   // Again, Degrees per MicroStep
  var raRateOffsetDegPerSec: Float32 = 0.0
  var mountState: Int32 = MountState.PowerUp.rawValue
  var markRefNowInt: Int32 = 0
  var trackingPaused: Int32 = 0
  var mountTimeMs: UInt32 = 0
  var armCount: Int32 = 0
  var diskCount: Int32 = 0

  // Conversions from BLE Communication driven types to iOS Application native types
  var markReferenceNow: Bool {
    return markRefNowInt != 0
  }
  
  var armCountDeg: Double {
      return Double(armCount) * Double(armDegPerStep)
  }
  
  var diskCountDeg: Double {
    return Double(diskCount) * Double(diskDegPerStep)
  }
  
}

