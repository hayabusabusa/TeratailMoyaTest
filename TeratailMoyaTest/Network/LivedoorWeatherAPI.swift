import Moya

enum LivedoorWeatherAPI {
    case city(CityParam)
    case tokyo
    case osaka
}

extension LivedoorWeatherAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "http://weather.livedoor.com/forecast/webservice/json/v1") else {
            fatalError("base URL error")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .city:
            return ""
        case .tokyo:
            return ""
        case .osaka:
            return ""
        }
    }
    
    var method: Method {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var parameters: [String: Any] {
        switch self {
        case .city(let param):
            let parameter = [
                "city": param.id
            ] as [String: Any]
            return parameter
        case .tokyo:
            let parameter = [
                "city": "130010"
            ] as [String: Any]
            return parameter
        case .osaka:
            let parameter = [
                "city": "270000"
            ] as [String: Any]
            return parameter
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .city, .tokyo, .osaka:
            return Moya.URLEncoding.queryString
        }
    }
    
    var task: Task {
        switch self {
        case .city, .tokyo, .osaka:
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
