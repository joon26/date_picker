//
//  ViewController.swift
//  date_picker
//
//  Created by D7703_19 on 2018. 4. 18..
//  Copyright © 2018년 s22dfg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myDatePicker: UIDatePicker!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var currentTimeLabel: UILabel!
    var myTimer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in self.updateTime()
        })
    }
/*
    func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        currentTimeLabel.text = formatter.string(from: date)
        
        if currentTimeLabel.text == timeLabel.text {
            view.backgroundColor = UIColor.red
        }
    }
 */
    @IBAction func changeDatePicker(_ sender: Any) {
        print("change Date Picker")
        print(myDatePicker.date)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
    }
    
    @IBAction func stopAlert(_ sender: Any) {
        
    }
    
    @objc func updateTime() {
        
        let date1 = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd a HH:mm:ss EEE"
        let time1 = formatter.string(from: date1)
        currentTimeLabel.text = time1
        
        if timeLabel.text == currentTimeLabel.text {
            view.backgroundColor = UIColor.red
            
            let alertController = UIAlertController(title: "알람", message: "지정된시간입니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            let DestructiveAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
                print("취소")
                
            }
            
            let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("확인")
                self.view.backgroundColor = UIColor.white
                
            }
            alertController.addAction(DestructiveAction)
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)

        }
    }
}
