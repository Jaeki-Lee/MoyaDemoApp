//
//  Encodable.swift
//  MoyaDemoApp
//
//  Created by jaeki lee on 2022/07/14.
//

import Foundation

extension Encodable {
    //model 을 json 으로 serialization 하는 함수
    func toDictionary() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            let dic = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            return dic ?? [:]
        } catch {
            return [:]
        }
    }
}
