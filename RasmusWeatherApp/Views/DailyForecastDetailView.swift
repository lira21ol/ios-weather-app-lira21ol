import SwiftUI
struct DailyForecastDetailView: View {
    let date: String
    let maxTemp: Double
    let minTemp: Double
    let weatherCode: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Text(formatDate(date))
                .font(.title)
                .fontWeight(.bold)
            
            Image(systemName: weatherIconName(for: weatherCode))
                .font(.system(size: 100))
                .foregroundColor(.blue)
            
            HStack(spacing: 20) {
                VStack {
                    Text("Min")
                        .foregroundColor(.secondary)
                    Text("\(Int(round(minTemp)))°")
                        .font(.title)
                }
                
                VStack {
                    Text("Max")
                        .foregroundColor(.secondary)
                    Text("\(Int(round(maxTemp)))°")
                        .font(.title)
                }
            }
            .padding()
            
            Text(weatherDescription(for: weatherCode))
                .foregroundColor(.secondary)
        }
        .padding()
        .navigationTitle("Daily Forecast")
    }
    
    private func formatDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: dateString) else { return dateString }
        
        formatter.dateFormat = "EEEE, MMMM d"
        return formatter.string(from: date)
    }
    
    private func weatherIconName(for code: Int) -> String {
        // Same implementation as in DailyForecastRow
        switch code {
        case 0: return "sun.max.fill"
        case 1, 2: return "cloud.sun.fill"
        case 3: return "cloud.fill"
        case 45, 48: return "cloud.fog.fill"
        case 51, 53, 55: return "cloud.drizzle.fill"
        case 61, 63, 65: return "cloud.rain.fill"
        case 71, 73, 75: return "cloud.snow.fill"
        case 77: return "snow"
        case 80, 81, 82: return "cloud.heavyrain.fill"
        case 85, 86: return "cloud.snow.fill"
        case 95: return "cloud.bolt.rain.fill"
        case 96, 99: return "cloud.bolt.fill"
        default: return "cloud.fill"
        }
    }
    
    private func weatherDescription(for code: Int) -> String {
        switch code {
        case 0: return "Clear sky"
        case 1, 2: return "Partly cloudy"
        case 3: return "Cloudy"
        case 45, 48: return "Foggy"
        case 51, 53, 55: return "Drizzle"
        case 61, 63, 65: return "Rain"
        case 71, 73, 75, 77: return "Snow"
        case 80, 81, 82: return "Heavy rain"
        case 85, 86: return "Snow showers"
        case 95: return "Thunderstorm"
        case 96, 99: return "Thunderstorm with hail"
        default: return "Unknown weather"
        }
    }
} 
