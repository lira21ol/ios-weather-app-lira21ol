import SwiftUI

struct LocationView: View {
    @Bindable var locationManager: LocationManager

    var body: some View {
        VStack(spacing: 20) {
            Text("Location")
                .font(.title2)
                .fontWeight(.bold)

            Group {
                if let location = locationManager.location {
                    VStack(spacing: 10) {
                        Text("Current Location:")
                            .font(.headline)
                        Text("Latitude: \(String(format: "%.4f", location.coordinate.latitude))")
                        Text("Longitude: \(String(format: "%.4f", location.coordinate.longitude))")
                    }
                } else {
                    Text("No location available")
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical)

            if let city = locationManager.address?.locality {
                Text("City: \(city)")
                    .font(.title3)
                    .fontWeight(.semibold)
            }

            Button {
                locationManager.requestLocationPermission()
            } label: {
                HStack {
                    Image(systemName: "location.fill")
                    Text("Update Location")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }
}
