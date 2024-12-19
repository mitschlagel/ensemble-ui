//
//  Gradients.swift
//  ensemble
//
//  Created by Spencer Jones on 12/18/24.
//

import Foundation
import SwiftUI

public struct Gradients {
    static func programRadialGradient(_ programColor: Color) -> RadialGradient {
        RadialGradient(
            gradient: Gradient(colors: [programColor, programColor.opacity(0.50)]),
            center: .bottomLeading,
            startRadius: 0,
            endRadius: 500
        )
    }
}
