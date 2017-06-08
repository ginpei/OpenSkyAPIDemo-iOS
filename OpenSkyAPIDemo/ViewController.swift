//
//  ViewController.swift
//  OpenSkyAPIDemo
//
//  Created by Ginpei on 2017-06-06.
//  Copyright © 2017 Ginpei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func fetch_touchUpInside(_ sender: UIButton) {
        print("loading...")
        
        var request = URLRequest(url: URL(string: "https://opensky-network.org/api/states/all")!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {data, response, err in
            if err != nil {
                print("ERR")
            }
            else {
                do {
                    let states = try self.pickUpData(from: data)
                    for state in states {
                        if let long = state.longitude, let lat = state.latitude {
                            print("\(state.originCountry) [\(long),\(lat)]")
                        }
                        else {
                            print("\(state.originCountry) (Unknown place)")
                        }
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
        }.resume()
    }
    
    func pickUpData(from data: Data?) throws -> [OpenSkyState] {
        var states = [OpenSkyState]()
        
        let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
        if let stateList = json["states"] as? [[Any]] {
            for row in stateList {
                if let state = OpenSkyState.from(array: row) {
                    print("yay \(state.originCountry)")
                    states.append(state)
                }
            }
        }
        return states
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

