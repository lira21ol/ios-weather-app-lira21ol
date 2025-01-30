import SwiftUI
import Foundation

struct DailyForecastRow: View {
    let date: String
    let maxTemp: Double
    let minTemp: Double
    let weatherCode: Int
    
    var body: some View {
        HStack {
            Text(formatDate(date))
                .frame(width: 100, alignment: .leading)
            
            Spacer()
            
            Image(systemName: weatherIconName(for: weatherCode))
                .foregroundColor(.blue)
            
            Spacer()
            
            Text("\(Int(round(minTemp)))° - \(Int(round(maxTemp)))°")
                .frame(width: 100, alignment: .trailing)
        }
        .padding(.vertical, 8)
    }
    
    private func formatDate(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: dateString) else { return dateString }
        
        formatter.dateFormat = "EEE, MMM d"
        return formatter.string(from: date)
    }
    
    private func weatherIconName(for code: Int) -> String {
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
} 