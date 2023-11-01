//
//  ViewControllerScreen2.swift
//  BmiProject
//
//  Created by Hiếu đang cáu on 30/10/2023.
//

import UIKit

class ViewControllerScreen2: UIViewController {
    
    @IBOutlet weak var infoResult: UILabel!
    @IBOutlet weak var textResult: UILabel!
    @IBOutlet weak var lbResult: UILabel!
    var x: Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(x ?? 0)
        changeValue(x: x ?? 0)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func changeValue(x: Double){
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        let k = formatter.string(from: NSNumber(value: x)) ?? ""
        print(k)
        let number = Double(k)
        print(number)
        lbResult.text = "\(k)"
        switch x {
            case 0..<18.5 :
                infoResult.text = "thiếu cân"
                infoResult.textColor = .blue
                textResult.text = "Bạn cần ăn nhiều hơn!"
                
                break
            case 18.5..<24.9 :
                infoResult.text = "cân đối"
                infoResult.textColor = .green
                textResult.text = "Bạn có cơ thể tuyệt vời hãy duy trì nó."
                break
            case 25..<29.99 :
                infoResult.text = "thừa cân"
                infoResult.textColor = .orange
                textResult.text = "Bạn hơi thừa cân hãy chú ý khẩu phần ăn"
                break
            case 30...34.99 :
                infoResult.text = "thừa cân"
                infoResult.textColor = .red
                textResult.text = "Bạn hơi thừa cân hãy chú ý khẩu phần ăn và tập luyện"
                break
            case 35..<99 :
                infoResult.text = "béo phì nguy hiểm"
                infoResult.textColor = .systemPink
                textResult.text = "hãy đi gặp bác sĩ ngay"
            default :
                break
            }
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
