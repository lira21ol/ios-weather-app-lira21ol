import SwiftUI

struct LocationRow: View {
    
    @Bindable var weather: WeatherManager
    @Bindable var locationManager: LocationManager
    
    var body: some View {
        VStack {
            if weather.isLoading {
                ProgressView()
            } else {
                HStack {
                    Image(systemName: "mappin")
                        .foregroundColor(.white)
                    Text(locationManager.address?.locality ?? "Location unavailable")
                        .font(.title2)
                        .padding(10)
                        .foregroundColor(locationManager.address != nil ? .white : .red)
                }
            }
        }
    }
}
