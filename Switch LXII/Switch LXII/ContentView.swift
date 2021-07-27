//
//  ContentView.swift
//  Switch LXII
//
//  Created by Oleg Frolov on 24.07.2021.
//

import SwiftUI

struct ContentView: View
{
    @State private var isOn: Bool = true
    
    let numberOfStripes: Int = 10
    let baseDuration: Double = 0.15
    let colorOn: Color = Color(red: 0.39, green: 0.77, blue: 0.44)
    let colorOff: Color = Color(red: 0.91, green: 0.91, blue: 0.92)
    
    var body: some View
    {
        let tap = TapGesture().onEnded()
        {
            isOn = !isOn
        }
        GeometryReader
        {
            
            geometry in ZStack
            {
                let stripeWidth = geometry.size.width / 2 / CGFloat(numberOfStripes)
                let stripeWidthOffset = stripeWidth / 2
                let stripeHeight = geometry.size.height
                let stripeHeightOffset = stripeHeight / 2
                
                ForEach(0 ..< numberOfStripes, id: \.self)
                {
                    i in
                    Rectangle()
                        .frame(width: stripeWidth, height: stripeHeight)
                        .position(x: isOn ? CGFloat(i) * stripeWidth + stripeWidthOffset : geometry.size.width / 2 + (CGFloat(i) * stripeWidth + stripeWidthOffset),
                                  y: stripeHeightOffset)
                        .animation(.easeInOut(duration: !isOn ? baseDuration  * Double(numberOfStripes - i) : baseDuration * Double(i + 1))
                        )
                        .foregroundColor(.white)
                }
            }
            .background(isOn ? colorOff : colorOn)
            .frame(width: geometry.size.width)
            .animation(.easeInOut(duration: Double(numberOfStripes) * baseDuration))
            
            
        }
        .ignoresSafeArea()
        .gesture(tap)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
            ContentView()
        }
    }
}
