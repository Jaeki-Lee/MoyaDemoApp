//
//  NetworkLoggerPlugin.swift
//  MoyaDemoApp
//
//  Created by trost.jk on 2022/07/13.
//

import Moya

//NetworkLoggerPlugin: Provider 이용해 네트워크를 호출 하는데, provider 를 생성할 때 plugin 을 넣어주면 willSend, didReceive 를 통해 log 를 확인 할 수 있다.
struct NetworkLoggerPlugin: PluginType {
    /// Called immediately before a request is sent over the network (or stubbed).
    func willSend(_ request: RequestType, target: TargetType) {
        guard let httpRequest = request.request else {
            print("HTTP Request invalid request")
            return
        }
        
        //url 주소
        let url = httpRequest.description
        //request method
        let method = httpRequest.httpMethod ?? "unknown method"
        
        //target 사용하는 custom Target
        var httpLog = """
                    [HTTP Request]
                    URL: \(url)
                    TARGET: \(target)
                    METHOD: \(method)\n
                    """
        /// HTTP Request Header
        httpLog.append("HEADER: [\n")
        httpRequest.allHTTPHeaderFields?.forEach {
            httpLog.append("\t\($0): \($1)\n")
        }
        httpLog.append("]\n")
        
        /// HTTP Request Body
        if let body = httpRequest.httpBody, let bodyString = String(bytes: body, encoding: String.Encoding.utf8) {
            httpLog.append("[HTTP Request End]")
        }
        
        print(httpLog)
        
    }
    /// Called after a response has been received, but before the MoyaProvider has invoked its completion handler.
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        <#code#>
    }
    
    
}
