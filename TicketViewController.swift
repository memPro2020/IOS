//
//  TicketViewController.swift
//  memPro
//
//  Created by DS on 2020/06/15.
//  Copyright © 2020 HJ. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    func addTargetForAction(target: AnyObject, action: Selector) {
        self.target = target
        self.action = action
    }
}

class TicketViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var genrePicker = ["Action","Romance","Horror"]
    var action01Picker = ["사극","첩보","현대액션"]
    var drama01Picker = ["코미디","로맨스","가족"]
    var horror01Picker = ["악마/귀신","살인자"]
    var action02Picker = ["1:1","N:N"]
    var drama02Picker = ["잔잔", "발랄"]
    var horror02Picker = ["아시아","할리우드"]
    var pickerItems = [String]()
    var select = ""
    var flag = 0
    
    @IBOutlet weak var genreText: UITextField!
    @IBOutlet weak var category01Text: UITextField!
    @IBOutlet weak var category02Text: UITextField!
    @IBOutlet weak var dateText: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var genreButton: UIButton!
    @IBOutlet weak var submit: UIBarButtonItem!
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var popUpPicker: UIPickerView!
    
    @IBAction func clickGenre(_ sender: UIButton) {
        self.view.addSubview(popUpView)
        pickerItems = genrePicker
        self.popUpPicker.reloadAllComponents()
        self.submit.addTargetForAction(target: self, action: #selector(clickSubmit(_:)))
    }
   
    @IBAction func clickSubmit(_ sender: UIBarButtonItem) {
        print("hello")
        genreButton.setTitle(select, for: .normal)
        genreButton.setTitleColor(.black, for: .normal)
        
    }
    @IBAction func dateValue(_ sender: UIDatePicker) {
        let datePickerView = sender // 전달된 인수 저장
            
        let formatter = DateFormatter() // DateFormatter 클래스 상수 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" // formatter의 dateFormat 속성을 설정
        dateText.text = formatter.string(from: datePickerView.date)
        // 데이트 피커에서 선택한 날짜를 format에서 설정한 포맷대로 string 메서드를 사용하여 문자열(String)로 변환
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpPicker.delegate = self
        popUpPicker.dataSource = self
       
        
        popUpView.frame = CGRect(x:0,y:view.frame.size.height-view.frame.size.height/4,width: view.frame.size.width, height: view.frame.size.height/4)
        //pickerItems = genrePicker
       
        
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
        
     // 피커뷰 툴바추가
        let pickerToolbar : UIToolbar = UIToolbar()
        pickerToolbar.barStyle = .default
        pickerToolbar.isTranslucent = true  // 툴바가 반투명인지 여부 (true-반투명, false-투명)
        pickerToolbar.backgroundColor = .lightGray
        pickerToolbar.sizeToFit()   // 서브뷰만큼 툴바 크기를 맞춤
        // 피커뷰 툴바에 확인/취소 버튼추가
        let btnDone = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(onPickDone))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let btnCancel = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(onPickCancel))
        pickerToolbar.setItems([btnCancel , space , btnDone], animated: true)   // 버튼추가
        pickerToolbar.isUserInteractionEnabled = true   // 사용자 클릭 이벤트 전달
        
        genreText.inputView = popUpPicker // 피커뷰 추가
        genreText.inputAccessoryView = pickerToolbar // 피커뷰 툴바 추가
        category01Text.inputView = popUpPicker
        category01Text.inputAccessoryView = pickerToolbar
        category02Text.inputView = popUpPicker
        category02Text.inputAccessoryView = pickerToolbar
        dateText.inputView = datePicker
        dateText.inputAccessoryView = pickerToolbar
        
    }
        
        @objc func onPickDone(){
            if flag == 1 {
                genreText.text = select
                genreText.resignFirstResponder()
                flag += 1
                //select = ""
            }
            if flag == 2 {
                if genreText.text == "Action"{
                    pickerItems = action01Picker
                    self.popUpPicker.reloadAllComponents();
                    
                }
                //select=""
                flag += 1
            }
            else if flag == 3 {
                if genreText.text == "Action"{
                    category01Text.text = select
                    category01Text.resignFirstResponder()
                    pickerItems = action02Picker
                    self.popUpPicker.reloadAllComponents()
                    
                }
                flag += 1
            }
            else if flag == 4 {
               category02Text.text = select
               category02Text.resignFirstResponder()
                
           }
            
            dateText.resignFirstResponder()
            select = ""

            //select value ->
            //exception
        }
        
        @objc func onPickCancel() {
            genreText.resignFirstResponder()
            select = ""
        }
        
        public func numberOfComponents(in pickerView: UIPickerView) -> Int {
             return 1
         }
         public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
             return pickerItems.count
         }
         func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           // if genreText.text == "Action"{
             //   pickerItems = action01Picker
               // self.popUpPicker.reloadAllComponents();
           // }
             return pickerItems[row]
         }
         func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
             select = pickerItems[row]
         }
    

    
     
      
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



