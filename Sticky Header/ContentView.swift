//
//  ContentView.swift
//  Sticky Header
//
//  Created by Adam Jemni on 11/29/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    let loremIpsum : String = "Lorem ipsum dolor sit amet consectetur adipiscing elit donec, gravida commodo hac non mattis augue duis vitae inceptos, laoreet taciti at vehicula cum arcu dictum. Cras netus vivamus sociis pulvinar est erat, quisque imperdiet velit a justo maecenas, pretium gravida ut himenaeos nam. Tellus quis libero sociis class nec hendrerit, id proin facilisis praesent bibendum vehicula tristique, fringilla augue vitae primis turpis.Sagittis vivamus sem morbi nam mattis phasellus vehicula facilisis suscipit posuere metus, iaculis vestibulum viverra nisl ullamcorper lectus curabitur himenaeos dictumst malesuada tempor, cras maecenas enim est eu turpis hac sociosqu tellus magnis. Sociosqu varius feugiat volutpat justo fames magna malesuada, viverra neque nibh parturient eu nascetur, cursus sollicitudin placerat lobortis nunc imperdiet. Leo lectus euismod morbi placerat pretium aliquet ultricies metus, augue turpis vulputa te dictumst mattis egestas laoreet, cubilia habitant magnis lacinia vivamus etiam aenean."
    
    // 1
    private func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
    
    // 2
    private func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        
        // Image was pulled down
        if offset > 0 {
            return -offset
        }
        
        return 0
    }
    
    // 3
    private func getHeightForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        let imageHeight = geometry.size.height
        
        if offset > 0 {
            return imageHeight + offset
        }
        
        return imageHeight
    }
    
    // MARK: - BODY
    
    var body: some View {
        
        ScrollView {
            
            GeometryReader { geometry in
                
                // MARK: - Solution 1: Image
                
                //                Image("background")
                //                    .resizable()
                //                    .scaledToFill()
                //                    .frame(width: geometry.size.width, height: self.getHeightForHeaderImage(geometry)) // 2
                //                    .clipped()
                //                    .offset(x: 0, y: self.getOffsetForHeaderImage(geometry)) // 3
                
                // MARK: - Solution 2: Color + Text
                
                ZStack {
                    Color.yellow
                    VStack (alignment: .leading, spacing: 10) {
                        HStack {
                            Image("image")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(20)
                            
                            VStack (alignment: .leading, spacing: 10) {
                                Text("Title")
                                    .font(.avenirNext(size: 28))
                                    .bold()
                            }
                        }
                        Text(loremIpsum)
                            .lineLimit(5)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 50)
                    
                }
                .frame(width: geometry.size.width, height: self.getHeightForHeaderImage(geometry)) // 2
                .offset(x: 0, y: self.getOffsetForHeaderImage(geometry)) // 3
                
                
                
                
                
            }
            .frame(height: 400)
            
            VStack (alignment: .leading, spacing: 10) {
                
                HStack {
                    
                    Image("user")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                    
                    VStack(alignment: .leading) {
                        Text("Alexander Miller")
                            .font(.avenirNext(size: 17))
                            .bold()
                        
                        Text("Munich - GERMANY")
                            .font(.avenirNext(size: 13))
                            .foregroundColor(.gray)
                        
                    }
                }
                
                Text("02 January 2019 • 5 min read")
                    .font(.avenirNextRegular(size: 12))
                    .foregroundColor(.gray)
                
                Text("How to build a parallax scroll view")
                    .font(.avenirNext(size: 28))
                    .bold()
                
                Text(loremIpsum + loremIpsum + loremIpsum)
                    .lineLimit(nil)
                    .font(.avenirNextRegular(size: 17))
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

extension Font {
    static func avenirNext(size: Int) -> Font {
        return Font.custom("Avenir Next", size: CGFloat(size))
    }
    static func avenirNextRegular(size: Int) -> Font {
        return Font.custom("AvenirNext-Regular", size: CGFloat(size))
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
