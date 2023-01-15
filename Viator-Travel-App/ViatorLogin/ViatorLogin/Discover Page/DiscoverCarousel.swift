//
//  DiscoverCarousel.swift
//  ViatorLogin
//
//  Created by Oltion Fazliu on 20/04/2022.
//
// References:
// https://developer.apple.com/documentation/uikit/uiscrollview
// https://developer.apple.com/documentation/swiftui/uihostingcontroller
// https://stackoverflow.com/questions/56819063/in-swiftui-how-to-use-uihostingcontroller-inside-an-uiview-or-as-an-uiview

import SwiftUI

struct DiscoverCarousel : UIViewRepresentable {
    
    // Coordinator function
    func makeCoordinator() -> Coordinator {
        
        return DiscoverCarousel.Coordinator(parent1: self)
    }
    
    // Properties
    @Binding var data : [TravelData]
    @Binding var index : Int
    @Binding var show : Bool
    var size : CGRect
    
    // UIscroll view clips the content to its frame, which generally (but not necessarily) coincides with that of the application's main window
    func makeUIView(context: Context) -> UIScrollView {
        
        let view = UIScrollView()
        // Because each view takes full width so content size will be * total count
        view.contentSize = CGSize(width: size.width * CGFloat(data.count), height : size.height)
        
        // Creates hosting controller where it is wrapped around DiscoverHScrollView
        let child = UIHostingController(rootView: DiscoverHScrollView(data: self.$data, show: self.$show, size: self.size))
        child.view.backgroundColor = .clear
        
        // Same here
        child.view.frame = CGRect(x: 0, y: 0, width: size.width * CGFloat(data.count), height: size.height)
        
        view.addSubview(child.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        // Dynamically update size when new data is added
        for i in 0..<uiView.subviews.count{
            uiView.subviews[i].frame = CGRect(x: 0, y: 0, width: size.width * CGFloat(data.count), height: size.height)
        }
        uiView.contentSize = CGSize(width: size.width * CGFloat(data.count), height : size.height)
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent : DiscoverCarousel
        
        init(parent1 : DiscoverCarousel) {
            
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let index = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            
            parent.index = index
        }
    }
}
