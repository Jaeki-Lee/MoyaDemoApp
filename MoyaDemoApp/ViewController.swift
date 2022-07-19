//
//  ViewController.swift
//  MoyaDemoApp
//
//  Created by trost.jk on 2022/07/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let request = ListUserRequest(page: 2)
        ListUserAPI.getUserList(request: request) { response, error in
            guard let response = response else {
                print(error ?? #function)
                return
            }
            
            let listUser = response
            print(listUser)
        }
    }


}

