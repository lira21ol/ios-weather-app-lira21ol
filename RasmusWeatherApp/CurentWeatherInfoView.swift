import SwiftUI

struct CurentWeatherInfoView: View {
    
    @Binding var weather: WeatherManager
    @Binding var locationManager: LocationManager
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                MapInfoView(locationManager: $locationManager)
                    .frame(height: 280)
                
                
                LocationRow(weather: weather, locationManager: locationManager)
                    .offset(y: -60)
                
                Spacer()
                
                MenuView(weather: $weather, locationManager: $locationManager)
                    .offset(y: -23)
            }
            .background(Color.black)
        }
    }
}
