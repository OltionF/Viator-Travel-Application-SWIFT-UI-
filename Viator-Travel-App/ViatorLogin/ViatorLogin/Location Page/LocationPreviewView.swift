//
//  LocationPreviewView.swift
//  ViatorMainViewPrototype
//
//  Created by Oltion Fazliu on 10/02/2022.
//
// References:
// https://www.youtube.com/watch?v=Ca0SisRHYuY&list=PLwvDm4Vfkdpha5eVTjLM0eRlJ7-yDDwBk&index=7
// https://www.fivestars.blog/articles/custom-view-styles/

import SwiftUI

struct LocationPreviewView: View {
    
    // Properties
    @EnvironmentObject private var viewModel: LocationsViewModel
    let location: Location
    
    var body: some View {
        // Layout of the preview entity
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading,spacing: 16.0) {
                titleSection // Preview title
                learnMoreButton // Learn more button
                nextButton // Next button
            }
            VStack(spacing: 8){
                imageSection // Shown image for location
            }
        }
        .padding(20)
        .background(
            // Modifiers for preview background
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .offset(y: 0)
        )
        .cornerRadius(10)
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack{
            // Location array contains array of images of single location
            // Show first image in the array
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 145, height: 145)
                    .cornerRadius(10)
                    .padding(.bottom)
            }
        }
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading,spacing: 4) {
            // Reference location name and city from location array
            Text(location.name)
                .font(Font.system(size: 25, weight: .medium, design: .serif))
            Text(location.cityName)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            // Action taken -> go to detailed view of location
            viewModel.sheetLocation = location
        }label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 150, height: 50)
                .foregroundColor(.white)
        }
        .background(Color.black)
        .cornerRadius(10)
    }
    
    private var nextButton: some View {
        Button {
            // Action taken -> proceed to next location in stack
            viewModel.nextButtonPressed()
        }label: {
            Text("Next")
                .font(.headline)
                .frame(width: 150, height: 50)
                .foregroundColor(.white)
        }
        .background(Color.black)
        .cornerRadius(10)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations[0])
                .padding()
        }
        .environmentObject(LocationsViewModel())
    }
}
