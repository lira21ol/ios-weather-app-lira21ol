import SwiftUI
import CoreLocation
import WidgetKit

struct WeatherView: View {
    @StateObject private var weatherManager = WeatherManager()
    
    var body: some View {
        VStack {
            if weatherManager.isLoading {
                ProgressView("Laddar väder...")
            } else if let weather = weatherManager.weatherData {
                VStack(spacing: 10) {
                    Text("Väderinformation")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Temperatur: \(String(format: "%.1f", weather.current.temperature_2m))°C")
                        .font(.headline)
                    
                    HStack {
                        Text("Max: \(String(format: "%.1f", weather.daily.temperature_2m_max.first ?? 0.0))°C")
                        Text("Min: \(String(format: "%.1f", weather.daily.temperature_2m_min.first ?? 0.0))°C")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
            } else {
                Text("Inget väderdata tillgängligt")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .onAppear {
            Task {
                do {
                    try await weatherManager.loadWeather(latitude: 52.52, longitude: 13.41)
                } catch {
                    print("Fel vid hämtning av väderdata: \(error)")
                }
            }
        }
    }
}