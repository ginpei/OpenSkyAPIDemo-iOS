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
        
        let req = OpenSkyRequest()
        req.fetch() {data, res, err in
            if err != nil {
                print("ERR \(err!)")
                return
            }
            
            for s in data! {
                self.printState(s)
            }
        }
    }
    
    func printState(_ s: OpenSkyState) {
        if let long = s.longitude, let lat = s.latitude {
            print("\(s.originCountry) [\(long),\(lat)]")
        }
        else {
            print("\(s.originCountry) (Unknown place)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

