//
//  ViewController.swift
//  GRPC Example
//
//  Created by Mert Gürcan on 27.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        GRPCHandler.shared.createClient()
        print(GRPCHandler.shared.getEvent() ?? "No event found")
    }


}

