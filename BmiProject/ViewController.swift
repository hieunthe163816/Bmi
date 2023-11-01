//
//  ViewController.swift
//  BmiProject
//
//  Created by Hiếu đang cáu on 19/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelW: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var valueHeight: UISlider!
    @IBOutlet var tapGesFemale: UITapGestureRecognizer!
    @IBOutlet var tapGesMale: UITapGestureRecognizer!
    @IBOutlet weak var btnCal: UIButton!
    @IBOutlet weak var plusAge: UIImageView!
    @IBOutlet weak var subAge: UIImageView!
    @IBOutlet weak var plusWeight: UIImageView!
    @IBOutlet weak var subWeight: UIImageView!
    @IBOutlet weak var viewAge: UIView!
    @IBOutlet weak var viewWeight: UIView!
    @IBOutlet weak var viewHeight: UIView!
    @IBOutlet weak var viewFemale: UIView!
    @IBOutlet weak var viewMale: UIView!
    
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet var tapPlusAge: UITapGestureRecognizer!
    @IBOutlet var tapSubAge: UITapGestureRecognizer!
    @IBOutlet var tapGesPlusWeight: UITapGestureRecognizer!
    @IBOutlet var tapGesSubWeight: UITapGestureRecognizer!
    @IBAction func valueChange(_ sender: Any) {
        var heightShow :String = String( Int(valueHeight.value)) + " CM"
        labelHeight.text = heightShow
        
    }
    let colorPress :UIColor = UIColor(_colorLiteralRed: 38/255, green: 38/255, blue: 58/255, alpha: 1)
    let colorNoPress :UIColor = UIColor(_colorLiteralRed: 53/255, green: 56/255, blue: 67/255, alpha: 1)
    let radius :CGFloat = 10
    
    var weight: Int = 50
    var age: Int = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBodyView()
        // Do any additional setup after loading the view.
        tapGesMale.addTarget(self, action: #selector(onclickMale))
        tapGesFemale.addTarget(self,  action: #selector(onclickFemale))
    }
    
    func setUpBodyView(){
        viewMale.layer.cornerRadius = radius
        viewAge.layer.cornerRadius = radius
        viewWeight.layer.cornerRadius = radius
        viewFemale.layer.cornerRadius = radius
        viewHeight.layer.cornerRadius = radius
        btnCal.layer.cornerRadius = radius
        plusAge.layer.cornerRadius = CGFloat(20)
        plusWeight.layer.cornerRadius = CGFloat(20)
        subAge.layer.cornerRadius = CGFloat(20)
        subWeight.layer.cornerRadius = CGFloat(20)
    }
    
    @objc func onclickMale(){
        viewMale.backgroundColor = colorPress
        viewFemale.backgroundColor = colorNoPress
        print("on click male")
    }
    
    @objc func onclickFemale(){
        viewMale.backgroundColor = colorNoPress
        viewFemale.backgroundColor = colorPress
        print("on click female")
    }
    
    func calculateBMI(weight: Double, height: Double) -> Double {
        let bmi = weight / (height * height)
        return bmi
    }
    
    func addSubFunction(status: String!,value: Int? = 0) -> Int{
        var result: Int = 1
        if status == "sub" {
            if value == 20 {
                result = 20
            } else {
                result = (value ?? 20) - 1
            }
        }else{
            result += value ?? 20
        }
        return result
    }
    
    @IBAction func onclickSubW(_ sender: Any) {
        print("click sub")
        var weight1 : Int = 50
        weight1 = weight
        weight1 = addSubFunction(status: "sub", value: weight)
        weight = weight1
        labelW.text = String(weight1)
    }
    
    
    @IBAction func onclickAddW(_ sender: Any) {
        var weight1 : Int = 50
        weight1 = weight
        weight1 = addSubFunction(status: "s", value: weight)
        weight = weight1
        labelW.text = String(weight1)
    }
    
    
    
    @IBAction func onclickBtn(_ sender: Any) {
        var height: Double = Double(valueHeight.value)/100
        var realW: Double = Double(weight)
        //var x: Double = calculateBMI(weight: realW, height: height)
        print("Height : \(height), Weight: \(realW)")
        print(calculateBMI(weight: realW, height: height))
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let destinationVC = storyboard.instantiateViewController(withIdentifier: "ViewControllerScreen2") as! ViewControllerScreen2
               destinationVC.x = calculateBMI(weight: realW, height: height)
        destinationVC.modalPresentationStyle = .fullScreen
        self.present(destinationVC, animated: true, completion: nil)
    }
    
    @IBAction func onclickSubA(_ sender: Any) {
        var weight1 : Int = 50
        weight1 =  age
        weight1 = addSubFunction(status: "s", value: age)
        age = weight1
        labelAge.text = String(weight1)
    }
    @IBAction func onclickAddA(_ sender: Any) {
        var weight1 : Int = 50
        weight1 =  age
        weight1 = addSubFunction(status: "sub", value: age)
        age = weight1
        labelAge.text = String(weight1)
    }
}

