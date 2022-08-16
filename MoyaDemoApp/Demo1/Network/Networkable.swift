//
//  Networkable.swift
//  MoyaDemoApp
//
//  Created by jaeki lee on 2022/07/13.
//

import Moya

//MoyaProvider 를 생성하는 Networkable 프로토콜
protocol Networkable {
    //TargetType: baseURL, path, method 등을 정의하는 네트워크 레이어?
    associatedtype Target: TargetType
    static func makeProvider() -> MoyaProvider<Target>
}

extension Networkable {
    static func makeProvider() -> MoyaProvider<Target> {
        /// authPlugin: bearer 토큰 세팅 전용의 플러그인
        let authPlugin = AccessTokenPlugin { _ in
            return "bear-access-token-sample"
        }
        /// LoggerPlugin: response, request 로그를 확인할 수 있는 플러그인
        let loggerPlugin = NetworkLoggerPlugin()
        
        return MoyaProvider<Target>(plugins: [authPlugin, loggerPlugin])
    }
}
