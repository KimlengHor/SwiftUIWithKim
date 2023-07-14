//
//  CarouselView.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 7/14/23.
//

import SwiftUI

struct CarouselView: View {
    @State var timerAdded: Bool = false
    @State var selection: Int = 0
    
    let imageUrls = [
        "https://images.unsplash.com/photo-1591946614720-90a587da4a36?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80",
        "https://images.unsplash.com/photo-1505628346881-b72b27e84530?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
        "https://images.unsplash.com/photo-1541364983171-a8ba01e95cfc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
        "https://images.unsplash.com/photo-1573435567032-ff5982925350?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80",
        "https://images.unsplash.com/photo-1543852786-1cf6624b9987?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
    ]
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(0..<imageUrls.count, id: \.self) { index in
                AsyncImage(url: URL(string: imageUrls[index]), content: { content in
                    content.image?
                        .resizable()
                        .scaledToFill()
                        .tag(index)
                        
                      
                })
            }
            .edgesIgnoringSafeArea(.all)
        }
        .tabViewStyle(.page)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            if timerAdded == false {
                addTimer()
            }
        }
    }
    
    //MARK: FUNCTIONS
    func addTimer() {
        timerAdded = true
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            withAnimation(.default) {
                if selection == imageUrls.count - 1 {
                    selection = 0
                } else {
                    selection = selection + 1
                }
            }
        }
        
        timer.fire()
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
