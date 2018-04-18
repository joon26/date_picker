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

    func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        currentTimeLabel.text = formatter.string(from: date)
        
        if currentTimeLabel.text == timeLabel.text {
            view.backgroundColor = UIColor.red
        }
    }
    
    @IBAction func changeDatePicker(_ sender: Any) {
        print("change Date Picker")
        print(myDatePicker.date)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        timeLabel.text = formatter.string(from: myDatePicker.date)
    }
    
    @IBAction func stopAlert(_ sender: Any) {
        view.backgroundColor = UIColor.white
    }
    
}

