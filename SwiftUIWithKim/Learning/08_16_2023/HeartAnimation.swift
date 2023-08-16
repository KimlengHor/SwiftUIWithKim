//
//  WaterAnimation.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 8/16/23.
//

import SwiftUI

struct HeartAnimation: View {
    @State private var percent = 0.0
    @State private var waveOffset = Angle(degrees: 0)
    @State var timerAdded: Bool = false
    
    var body: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .foregroundColor(.red)
            .frame(width: 200, height: 200)
            .mask {
                Wave(offSet: Angle(degrees: waveOffset.degrees), percent: percent)
                    .fill(Color.blue)
                    .ignoresSafeArea(.all)
            }
        .onAppear {
            withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
            }
            
            if timerAdded == false {
                addTimer()
            }
        }
    }
    
    //MARK: FUNCTIONS
    func addTimer() {
        timerAdded = true
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if percent >= 120 {
                percent = 0
            }
            self.percent = self.percent + 0.5
        }
        
        timer.fire()
    }
}

struct Wave: Shape {
    
    var offSet: Angle
    var percent: Double
    
    var animatableData: Double {
        get { offSet.degrees }
        set { offSet = Angle(degrees: newValue) }
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let lowestWave = 0.02
        let highestWave = 1.00
        
        let newPercent = lowestWave + (highestWave - lowestWave) * (percent / 100)
        let waveHeight = 0.015 * rect.height
        let yOffSet = CGFloat(1 - newPercent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offSet
        let endAngle = offSet + Angle(degrees: 360 + 10)
        
        p.move(to: CGPoint(x: 0, y: yOffSet + waveHeight * CGFloat(sin(offSet.radians))))
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            p.addLine(to: CGPoint(x: x, y: yOffSet + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        
        p.addLine(to: CGPoint(x: rect.width, y: rect.height))
        p.addLine(to: CGPoint(x: 0, y: rect.height))
        p.closeSubpath()
        
        return p
    }
}

struct WaterAnimation_Previews: PreviewProvider {
    static var previews: some View {
        HeartAnimation()
    }
}
