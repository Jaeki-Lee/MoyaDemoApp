//
//  ListUserAPI.swift
//  MoyaDemoApp
//
//  Created by jaeki lee on 2022/07/14.
//

import Moya

struct ListUserAPI: Networkable {
    typealias Target = ListUserTarget
    
    static func getUserList(request: ListUserRequest, completion: @escaping (_ succeed: ListUser?, _ failed: Error?) -> Void) {
        /*provider.request(tagetType) {
         
         }
         */
        makeProvider().request(.list(request)) { result in
            switch ResponseData<ListUser>.processResponse(result) {
            case .success(let model): return completion(model, nil)
            case .failure(let error): return completion(nil, error)
            }
        }
        
    }
}
