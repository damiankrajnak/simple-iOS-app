//
//  SecondViewController.swift
//  myFirstApp
//
//  Created by Damián Krajňák on 18/05/2020.
//  Copyright © 2020 Damián Krajňák. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var XCoordinateArray: [Int] = [0];
    var YCoordinateArray: [Int] = [0];
    var currentDirection: String = "up";
    var numberOfPoints: Int = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    
    @IBOutlet weak var result: UILabel!
    
    
    @IBAction func left(_ sender: Any) {
        numberOfPoints += 1
        let input: String = textField.text!
        textField.text = ""
        if let num = Int(input) {
            switch currentDirection {
            case "up":
                YCoordinateArray.append(YCoordinateArray.last! + num)
                XCoordinateArray.append(XCoordinateArray.last!)
                currentDirection = "left"
            case "down":
                YCoordinateArray.append(YCoordinateArray.last! - num)
                XCoordinateArray.append(XCoordinateArray.last!)
                currentDirection = "right"
            case "right":
                XCoordinateArray.append(XCoordinateArray.last! + num)
                YCoordinateArray.append(YCoordinateArray.last!)
                currentDirection = "up"
            case "left":
                XCoordinateArray.append(XCoordinateArray.last! - num)
                YCoordinateArray.append(YCoordinateArray.last!)
                currentDirection = "down"
            default:
                ()
            }
        }
    }
    
    @IBAction func right(_ sender: Any) {
        numberOfPoints += 1
        let input: String = textField.text!
        textField.text = ""
        if let num = Int(input) {
            switch currentDirection {
            case "up":
                YCoordinateArray.append(YCoordinateArray.last! + num)
                XCoordinateArray.append(XCoordinateArray.last!)
                currentDirection = "right"
            case "down":
                YCoordinateArray.append(YCoordinateArray.last! - num)
                XCoordinateArray.append(XCoordinateArray.last!)
                currentDirection = "left"
            case "right":
                XCoordinateArray.append(XCoordinateArray.last! + num)
                YCoordinateArray.append(YCoordinateArray.last!)
                currentDirection = "down"
            case "left":
                XCoordinateArray.append(XCoordinateArray.last! - num)
                YCoordinateArray.append(YCoordinateArray.last!)
                currentDirection = "up"
            default:
                ()
            }
        }
    }
    
    @IBAction func end(_ sender: Any) {
        if(XCoordinateArray.min()! < 0) {
            let temp: Int = XCoordinateArray.min()! * -1
            let help = XCoordinateArray.count - 1
            for index in 0...help {
                XCoordinateArray[index] += temp
            }
        }
        if(YCoordinateArray.min()! < 0) {
            let temp: Int = YCoordinateArray.min()! * -1
            let help = YCoordinateArray.count - 1
            for index in 0...help {
                YCoordinateArray[index] += temp
            }
        }
        var area: Int = 0
        var j: Int = numberOfPoints - 1
        
        for index in 0...j {
            area += (XCoordinateArray[j] + XCoordinateArray[index]) * (YCoordinateArray[j] - YCoordinateArray[index])
            j = index
            area = area / 2
        }
        result.text = "Area: \(area) cm2"
        textField.text = ""
        area = 0
        numberOfPoints = 1
        XCoordinateArray = [0]
        YCoordinateArray = [0]
        currentDirection = "up"
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
