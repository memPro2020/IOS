//
//  HomeViewController.swift
//  memPro
//
//  Created by DS on 2020/06/15.
//  Copyright © 2020 HJ. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var moviePickerView: UIPickerView!
    @IBOutlet weak var genreName: UILabel!
    @IBOutlet weak var Toolbar: UIToolbar!
    
    let MAX_ARRAY_NUM = 3
    var imageArray = [UIImage?]()
    let PICKER_VIEW_COLUMN = 1
    var imageFileName = ["Action","Romance","Horror"]
    
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
                //self.view.layer.UIToolbar(gradient, at: 0)
        
        genreName.text = imageFileName[0]
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return PICKER_VIEW_COLUMN
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
        
        let img = UIImage(named: imageFileName[row])
        let imageView = UIImageView(image:img)
        
        //imageView.frame = CGRect(x:0, y:0, width:100, height:50)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, InComponent component: Int) {
        genreName.text = imageFileName[row]
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
