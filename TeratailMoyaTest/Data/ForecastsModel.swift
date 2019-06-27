import Foundation

struct ForecastsModel: Decodable {
    
    let forecasts: [ForecastModel]
    
    private enum CodingKeys: String, CodingKey {
        case forecasts
    }
}

struct ForecastModel: Decodable {
    
    let dateLabel: String
    let telop: String
    let date: String
    let temperature: TemperaturesModel
    
    private enum CodingKeys: String, CodingKey {
        case dateLabel
        case telop
        case date
        case temperature
    }
}
