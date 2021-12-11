//
//  WeatherClass.swift
//  myWeatherIOSCLASSAPP
//
//  Created by user209830 on 11/21/21.
//

import Foundation

class myWeatherClass{
    var name:String
    var region:String
    var country:String
    var lat:Double
    var lon:Double
    var tz_id: String
    var localtime: String
    var last_updated_epoch: Int
    var last_updated: String
    var temp_c: Double
    var temp_f: Double
    var is_day: Int
    var wind_mph: Double
    var wind_kph: Double
    var wind_degree: Int
    var wind_dir: String
    var pressure_mb: Double
    var pressure_in: Double
    var precip_mm: Double
    var precip_in: Double
    var humidity: Int
    var cloud: Int
    var feelslike_c: Double
    var feelslike_f: Double
    var vis_km: Double
    var vis_miles: Double
    var uv: Double
    var gust_mph: Double
    var gust_kph: Double
    var text: String
    var icon: String
    var code: Int
    var url:String
    var citysaved:String
    init(){
        self.name = "temporarystring"
        self.region = "temporarystring"
        self.country = "temporarystring"
        self.lat = 0
        self.lon = 0
        self.tz_id = "temporarystring"
        self.localtime = "temporarystring"
        self.last_updated_epoch = 0
        self.last_updated = "temporarystring"
        self.temp_c = 0
        self.temp_f = 0
        self.is_day = 0
        self.text = "temporarystring"
        self.icon = "temporarystring"
        self.code = 0
        self.wind_mph = 0
        self.wind_kph = 0
        self.wind_degree = 0
        self.wind_dir = "temporarystring"
        self.pressure_mb = 0
        self.pressure_in = 0
        self.precip_mm = 0
        self.precip_in = 0
        self.humidity = 0
        self.cloud = 0
        self.feelslike_c = 0
        self.feelslike_f = 0
        self.vis_km = 0
        self.vis_miles = 0
        self.uv = 0
        self.gust_mph = 0
        self.gust_kph = 0
        self.url = "temporarystring"
        self.citysaved = "temporarystring"
    }
    func filldata(completion: @escaping (Bool) -> Void ){
        url = "https://api.weatherapi.com/v1/current.json?key=a011d2752ea64f838ed21205211511&q="
        url += citysaved
        url += "&aqi=no"
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data,error == nil else{
                print("Something went wrong")
                return
            }
            var result:Response?
            do{
                result=try     JSONDecoder().decode(Response.self,from:data)
            }
            catch{
                print("failed to convert \(error.localizedDescription)")
            }
            guard let json = result else{
                return
            }
            self.name = json.location.name
            self.region = json.location.region                                          
            self.country = json.location.country
            self.lat = json.location.lat
            self.lon = json.location.lon
            self.tz_id = json.location.tz_id
            self.localtime = json.location.localtime
            self.last_updated_epoch = json.current.last_updated_epoch
            self.last_updated = json.current.last_updated
            self.temp_c = json.current.temp_c
            self.temp_f = json.current.temp_f
            self.is_day = json.current.is_day
            self.text = json.current.condition.text
            self.icon = json.current.condition.icon
            self.code = json.current.condition.code
            self.wind_mph = json.current.wind_mph
            self.wind_kph = json.current.wind_kph
            self.wind_degree = json.current.wind_degree
            self.wind_dir = json.current.wind_dir
            self.pressure_mb = json.current.pressure_mb
            self.pressure_in = json.current.pressure_in
            self.precip_mm = json.current.precip_mm
            self.precip_in = json.current.precip_in
            self.humidity = json.current.humidity
            self.cloud = json.current.cloud
            self.feelslike_c = json.current.feelslike_c
            self.feelslike_f = json.current.feelslike_f
            self.vis_km = json.current.vis_km
            self.vis_miles = json.current.vis_miles
            self.uv = json.current.uv
            self.gust_mph = json.current.gust_mph
            self.gust_kph = json.current.gust_kph
            completion(true)
        })
        task.resume();
    }
    
    func setCity(city:String){
        citysaved = city.replacingOccurrences(of: " ", with: "%20")
    }
}


struct Response: Codable {
    let location: myLocation
    let current: myCurrent
}

struct myLocation: Codable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tz_id: String
    //let localtime_ephoch: Int?
    let localtime: String
}

struct myCurrent: Codable {
    let last_updated_epoch: Int
    let last_updated: String
    let temp_c: Double
    let temp_f: Double
    let is_day: Int
    let condition: myCondition
    let wind_mph: Double
    let wind_kph: Double
    let wind_degree: Int
    let wind_dir: String
    let pressure_mb: Double
    let pressure_in: Double
    let precip_mm: Double
    let precip_in: Double
    let humidity: Int
    let cloud: Int
    let feelslike_c: Double
    let feelslike_f: Double
    let vis_km: Double
    let vis_miles: Double
    let uv: Double
    let gust_mph: Double
    let gust_kph: Double
}

struct myCondition: Codable {
    let text: String
    let icon: String
    let code: Int
}
