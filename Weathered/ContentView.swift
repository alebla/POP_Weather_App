//
//  ContentView.swift
//  Weathered
//
//  Created by aB on 4/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var input: String = ""
    var body: some View {
        VStack {
            TextField("Enter City", text: $input)
                .font(.title)
            
            Divider()
            
            Text(input)
                .font(.body)
        }
        .padding()
        .onAppear {
            OpenWeatherMapController().fetchWeatherData(city: "chicago") { (weather, error) in
                if let weather = weather {
                    print(weather)
                }
                
                if let error = error {
                    print(error)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
