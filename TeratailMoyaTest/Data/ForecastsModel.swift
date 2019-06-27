import Foundation

//    以下の部分のパース
//    image は取っていません
//
//    "forecasts":
//        [
//            {
//                "dateLabel":"\u4eca\u65e5",
//                "telop":"\u96e8\u306e\u3061\u66c7",
//                "date":"2019-06-27",
//                "temperature":
//                    {
//                        "min":null,
//                        "max":
//                            {
//                                "celsius":"29",
//                                "fahrenheit":"84.2"
//                            }
//                    },
//            }, ...
//        ]

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
