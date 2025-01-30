import Foundation

struct WeatherData: Decodable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let current: Current
    let daily: Daily
    
    struct Current: Decodable {
        let time: String
        let temperature_2m: Double
        let weather_code: Int
    }
    
    struct Daily: Decodable {
        let time: [String]
        let weather_code: [Int]
        let temperature_2m_max: [Double]
        let temperature_2m_min: [Double]
    }
}

