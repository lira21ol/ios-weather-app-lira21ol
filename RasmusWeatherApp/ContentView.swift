import SwiftUI

struct ContentView: View {
    @State private var weatherManager = WeatherManager()
    @State private var locationManager = LocationManager()
    
    var body: some View {
        Group {
            switch locationManager.authorizationStatus {
            case .notDetermined:
                RequestLocationView {
                    locationManager.requestLocationPermission()
                }
            case .restricted, .denied:
                LocationDeniedView()
            case .authorizedWhenInUse, .authorizedAlways:
                VStack {
                    // Add MenuView here, passing the bindings
                    MenuView(weather: $weatherManager, locationManager: $locationManager)
                    
                    WeatherView(
                        weatherManager: weatherManager,
                        locationManager: locationManager
                    )
                }
            @unknown default:
                Text("Unknown authorization status")
            }
        }
        .onAppear {
            locationManager.weatherManager = weatherManager
        }
    }
}

struct RequestLocationView: View {
    let requestPermission: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Weather App Needs Your Location")
                .font(.title2)
            Text("Please allow location access to see weather information")
                .foregroundColor(.secondary)
            Button("Allow Location Access", action: requestPermission)
                .buttonStyle(.borderedProminent)
        }
        .padding()
        .multilineTextAlignment(.center)
    }
}

struct LocationDeniedView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "location.slash")
                .font(.largeTitle)
                .foregroundColor(.red)
            Text("Location Access Required")
                .font(.title2)
            Text("Please enable location access in Settings")
                .foregroundColor(.secondary)
        }
        .padding()
        .multilineTextAlignment(.center)
    }
}

#Preview {
    ContentView()
}
