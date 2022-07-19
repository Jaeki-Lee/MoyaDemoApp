//
//  ListUserRequest.swift
//  MoyaDemoApp
//
//  Created by jaeki lee on 2022/07/14.
//

import Foundation

//`?page=2` 이므로 codable을 준수하는 struct 정의
struct ListUserRequest: Codable {
    let page: Int
}
