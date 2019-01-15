//
//  Weather.swift
//  Fashion Flick
//
//  Created by Ryan Nguyen on 1/15/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import Foundation

struct Weather: Decodable{
    
    let temperature: Double?
    let summary: String?
    
    enum CodingKeys: String, CodingKey {
        case temperature
        case summary
    }
    enum WeatherKeys: String, CodingKey{
        case currently
    }
    
    init(from decoder: Decoder) throws{
        let values = try decoder.container(keyedBy: WeatherKeys.self)
        let weatherValues = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .currently)
        temperature = try weatherValues.decode(Double.self, forKey: .temperature)
        summary = try? weatherValues.decode(String.self, forKey: .summary)
    }
}

