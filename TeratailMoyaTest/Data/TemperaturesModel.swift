import Foundation

//    以下の部分のパース
//
//    "temperature":
//    {
//        "min":
//        {
//            "celsius":"23",
//            "fahrenheit":"73.4"
//
//        },
//        "max":
//        {
//            "celsius":"31",
//            "fahrenheit":"87.8"
//        }
//
//    }

struct TemperaturesModel: Decodable {
    
    var min: TemperatureModel?
    var max: TemperatureModel?
    
    private enum CodingKeys: String, CodingKey {
        case min
        case max
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        min = try container.decodeIfPresent(TemperatureModel.self, forKey: .min)
        max = try container.decodeIfPresent(TemperatureModel.self, forKey: .max)
    }
}

struct TemperatureModel: Decodable {
    
    let celsius: String
    let fahrenheit: String
    
    private enum CodingKeys: String, CodingKey {
        case celsius
        case fahrenheit
    }
}
