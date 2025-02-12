import SwiftUI

struct MenuView: View {
    
    @Binding var weather: WeatherManager
    @Binding var locationManager: LocationManager
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Color.white.frame(height: 4)
                
                HStack {
                    
                    NavigationLink(
                        destination: CurentWeatherInfoView(weather: $weather, locationManager: $locationManager),
                        label: {
                        Image(systemName: "map.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 30)
                            .foregroundColor(.white)
                    })
                    
                    Spacer()
                    
                   
                    
                }
                .padding()
                
            }
            .background(Color.black)
        }
    }
}
