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
                
//                var duration =
                
                ForEach(0..<numberOfStripes, id: \.self)
                {
                    i in
                    Rectangle()
                        .frame(width: stripeWidth, height: stripeHeight)
                        .position(x: isOn ? CGFloat(i) * stripeWidth + stripeWidthOffset : geometry.size.width / 2 + (CGFloat(i) * stripeWidth + stripeWidthOffset), y: stripeHeightOffset)
                        .animation(.easeInOut(duration: !isOn ? 0.2  * Double(numberOfStripes - i) : 0.2 * Double(i + 1))
                        )
                }
            }
            .frame(width: geometry.size.width)
            
        }
        .ignoresSafeArea()
        .gesture(tap)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
