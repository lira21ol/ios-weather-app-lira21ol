import SwiftUI

struct WeatherInfoView: View {
    
    @Binding var weather: WeatherManager
    
    private func isNightTime() -> Bool {
        let currentDate = Date()
        let calendar = Calendar.current
        let currentHour = calendar.component(.hour, from: currentDate)
        return currentHour < 6 || currentHour >= 22
    }
    
    // Function to map the weather code to an image
    private func weatherImage(forCode code: Int) -> String {
        switch code {
        case 0:
            return "sun.max.fill" // Clear sky
        case 1, 2, 3:
            return "cloud.sun.fill" // Partly cloudy
        case 45, 48:
            return "cloud.fog.fill" // Fog
        case 51...53:
            return "cloud.rain.fill" // Light rain
        case 61...63:
            return "cloud.rain.fill" // Moderate rain
        case 71...73:
            return "cloud.snow.fill" // Light snow
        case 80...82:
            return "cloud.snow.fill" // Snow showers
        default:
            return "cloud.fill" // Default fallback
        }
    }
    
    var body: some View {
        
        let image = isNightTime() ? "darkSky" : "clearSky"
        
        VStack {
            
            if weather.isLoading {
                ProgressView()
            } else {
                
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                    .frame(width: 380)
                    .overlay {
                        RoundedRectangle(cornerRadius: 100).stroke(.white, lineWidth: 6)
                    }
                    .shadow(radius: 50)
                    .scaleEffect(0.7)
                    .overlay(
                        VStack {
                            if let weatherData = weather.weatherData {
                                // Use the mapping function to get the weather image
                                Image(systemName: weatherImage(forCode: weatherData.current.weather_code))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 70)
                                    .foregroundColor(.white)
                                
                                let temperature = Int(weatherData.current.temperature_2m)
                                Text("\(temperature) °C")
                                    .foregroundColor(.white)
                                    .font(.system(size: 60))
                            }
                        }
                    )
                    .padding()
            }
        }
    }
}
