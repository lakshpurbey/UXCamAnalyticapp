//
//  ViewController.swift
//  UXcamAnalytic
//
//  Created by HAR-LAP046-080 on 12/04/2024.
//

import UIKit
import UXCamAnalyticSDK

class ViewController: UIViewController {
    
    @IBOutlet weak var btn_StartSession: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btn_StartSession(_ sender: UIButton) {
        
        print("sender", sender.titleLabel?.text ?? "")
        
        let setbuttoncond = sender.titleLabel?.text
        
        if setbuttoncond == "Start Session" {
            
            btn_StartSession.setTitle("End Session", for: .normal)
            SessionManager.shared.startSession()
            
            // Log an event with properties

            EventTrack.shared.trackEvent(name: "ExpenseTrack", properties: ["item": "Macbook Pro", "price": 19990.99])

        }
        else {
            
            btn_StartSession.setTitle("Start Session", for: .normal)
            SessionManager.shared.endSession()

        }
        // Start session
        
        if SessionManager.shared.isSessionActive() {
            print("Session is active")
        } else {
            print("Session is not active")
        }

    }
    

}

