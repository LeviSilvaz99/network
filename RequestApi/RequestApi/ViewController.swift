//
//  ViewController.swift
//  RequestApi
//
//  Created by André Levi Oliveira Silva on 06/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://api.chucknorris.io/jokes/random"
        getData(from: url)
    }
    
    private func getData(from url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let responseData = data else { return }
            
            if let responseString = String(data: responseData, encoding: .utf8) {
                print(responseString)
            }
            
        })
        
        task.resume()
        
    }

}
