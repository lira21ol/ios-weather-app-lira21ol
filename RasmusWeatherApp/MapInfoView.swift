//
//  MapInfoView.swift
//  RasmusWeatherApp
//
//  Created by Rasmus Lindholm on 2025-02-12.
//

import SwiftUI
import MapKit

struct MapInfoView: View {
    
    @Binding var locationManager: LocationManager
    
    var body: some View {
        Map(initialPosition: .region(region))
            .preferredColorScheme(.dark)
            .overlay(
                VStack {
                    Spacer()
                    Color.white.frame(height: 4)
                }
            )
    }

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: locationManager.location?.coordinate.latitude ?? 57.7826137,
                longitude: locationManager.location?.coordinate.longitude ?? 14.1617876
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.2,
                longitudeDelta: 0.2
            )
        )
    }
}
