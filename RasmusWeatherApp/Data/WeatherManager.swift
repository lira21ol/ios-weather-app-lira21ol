import Foundation
import CoreLocation
import Observation

@Observable
class WeatherManager {
    var weatherData: WeatherData?
    var isLoading = false

    func loadWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async {
        isLoading = true
        
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&current=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto"
        
        if let url = URL(string: urlString),
           let (data, _) = try? await URLSession.shared.data(from: url) {
            weatherData = try? JSONDecoder().decode(WeatherData.self, from: data)
        }
        
        isLoading = false
    }
}
