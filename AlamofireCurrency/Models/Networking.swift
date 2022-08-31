//
//  Model.swift
//  AlamofireCurrency
//
//  Created by Admin on 20.08.2022.
//

struct PairModel {
    let base: String
    let date: String
    let rates: [String: Double]
    let success: Bool
    let timestamp: Int
}

struct Rates: Decodable {
    let value: String
}

extension PairModel: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case base
        case date
        case rates
        case success
        case timestamp
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        base = try container.decode(String.self, forKey: .base)
        date = try container.decode(String.self, forKey: .date)
        rates = try container.decode([String: Double].self, forKey: .rates)
        success = try container.decode(Bool.self, forKey: .success)
        timestamp = try container.decode(Int.self, forKey: .timestamp)
    }
}
