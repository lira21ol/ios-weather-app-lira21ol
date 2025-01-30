import SwiftUI
import SwiftUI
struct CurrentWeatherView: View {
    let weather: WeatherData
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(Int(round(weather.current.temperature_2m)))°")
                .font(.system(size: 70))
                .fontWeight(.bold)
            
            HStack(spacing: 20) {
                Label("\(Int(round(weather.daily.temperature_2m_max[0])))°", 
                      systemImage: "thermometer.sun.fill")
                Label("\(Int(round(weather.daily.temperature_2m_min[0])))°", 
                      systemImage: "thermometer.snowflake")
            }
            .foregroundColor(.secondary)
        }
        .padding()
    }
} 
