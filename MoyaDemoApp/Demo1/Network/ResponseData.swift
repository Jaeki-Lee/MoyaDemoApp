//
//  ResponseData.swift
//  MoyaDemoApp
//
//  Created by jaeki lee on 2022/07/13.
//

import Foundation
import Moya

struct ResponseData<Model: Codable> {
    // Common response에 responseCode, message, result 형식으로 표현하지만 예제 데이터에 따라 다르게 처리함
    struct CommonResponse: Codable {
        let result: Model
    }
    
    //response 를 처리하는 processResponse 메소드
    static func processResponse(_ result: Result<Response, MoyaError>) -> Result<Model?, Error> {
        switch result {
        case .success(let response):
            do {
                // status code 가 200 ... 299인 경우만 success 로 체크 (아니면 예외발생)
                _ = try response.filterSuccessfulStatusCodes()
                
                let commonResponse = try JSONDecoder().decode(CommonResponse.self, from: response.data)
                
                return .success(commonResponse.result)
            } catch {
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
    
    //CommonResponse 모델을 따르지 않는 모델을 처리하기 위한 함수
    static func processJSONResponse(_ result: Result<Response, MoyaError>) -> Result<Model?, Error> {
        switch result {
        case .success(let response):
            do {
                let model = try JSONDecoder().decode(Model.self, from: response.data)
                
                return .success(model)
            } catch {
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    
    }
}
