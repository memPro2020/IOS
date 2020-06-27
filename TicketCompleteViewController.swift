//
//  TicketCompleteViewController.swift
//  memPro
//
//  Created by DS on 2020/06/15.
//  Copyright © 2020 HJ. All rights reserved.
//

import UIKit

class TicketCompleteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
                gradient.frame = view.bounds
                gradient.colors = [
                    UIColor(named: "blue")?.cgColor ?? (0,0,0),
                    UIColor(named: "purple")?.cgColor ?? (0,0,0)
                ]
                gradient.locations = [0.6, 0.9]
        //        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        //        gradient.endPoint = CGPoint(x: 0.5, y: 0.5)
                self.view.layer.insertSublayer(gradient, at: 0)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
