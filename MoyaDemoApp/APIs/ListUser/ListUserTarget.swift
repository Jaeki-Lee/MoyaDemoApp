//
//  ListUserTarget.swift
//  MoyaDemoApp
//
//  Created by jaeki lee on 2022/07/14.
//

import Moya

//특정 API 에 대한 Target case 는 하나의 end-point
enum ListUserTarget {
    case list(ListUserRequest)
}

extension ListUserTarget: BaseTargetType, AccessTokenAuthorizable {

    //end-point 의 path
    var path: String {
        switch self {
        case .list: return "/api/users"
        }
    }
    
    var method: Method {
        switch self {
        case .list: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .list(let request):
            //structure 를 쿼리파라미터로 변경
            return .requestParameters(parameters: request.toDictionary(), encoding: URLEncoding.queryString)
            //body 를 추가하는 data 라면
            //return .requestJSONEncodable(request)
        }
    }
    
    // bearer token이 필요한 경우 `AccessTokenAuthorizable` 프로토콜을 준수 후 authorizationType 프로퍼티에 .bearer 리턴
    var authorizationType: AuthorizationType? {
        return .bearer
    }
    
}

