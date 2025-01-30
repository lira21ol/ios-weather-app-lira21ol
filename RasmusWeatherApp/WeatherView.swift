import SwiftUI

struct WeatherView: View {
    @Bindable var weatherManager: WeatherManager
    @Bindable var locationManager: LocationManager

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    if weatherManager.isLoading {
                        ProgressView()
                    } else if let weather = weatherManager.weatherData {
                        // Current Weather
                        CurrentWeatherView(weather: weather)
                        
                        Divider()
                        
                        // 7-Day Forecast
                        VStack(alignment: .leading, spacing: 10) {
                            Text("7-Day Forecast")
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            ForEach(0..<7, id: \.self) { index in
                                NavigationLink(destination: DailyForecastDetailView(
                                    date: weather.daily.time[index],
                                    maxTemp: weather.daily.temperature_2m_max[index],
                                    minTemp: weather.daily.temperature_2m_min[index],
                                    weatherCode: weather.daily.weather_code[index]
                                )) {
                                    DailyForecastRow(
                                        date: weather.daily.time[index],
                                        maxTemp: weather.daily.temperature_2m_max[index],
                                        minTemp: weather.daily.temperature_2m_min[index],
                                        weatherCode: weather.daily.weather_code[index]
                                    )
                                }
                            }
                        }
                        .padding()
                    } else {
                        Text("No weather data available")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle(locationManager.address?.locality ?? "Weather")
            .refreshable {
                if let location = locationManager.location {
                    await weatherManager.loadWeather(
                        latitude: location.coordinate.latitude,
                        longitude: location.coordinate.longitude
                    )
                }
            }
        }
    }
}
