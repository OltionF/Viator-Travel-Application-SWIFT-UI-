//
//  LocationMapAnnotationView.swift
//  ViatorMainViewPrototype
//
//  Created by Oltion Fazliu on 10/02/2022.
//
// References:
// https://www.youtube.com/watch?v=javFZbCYGfc&list=PLwvDm4Vfkdpha5eVTjLM0eRlJ7-yDDwBk&index=7


import SwiftUI

struct LocationMapAnnotationView: View {
    
    // Custom Annotation pin for map view used from reference with modifiers
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(.blue)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 40)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            LocationMapAnnotationView()
        }
    }
}
