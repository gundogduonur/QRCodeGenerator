//
//  ViewController.swift
//  QRCode
//
//  Created by Onur Gündoğdu on 15.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var qrImage: UIImageView!
    @IBOutlet weak var titleText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func generateClicked(_ sender: Any) {
        let title = titleText.text
        if let inputTitle  = title
        {
            let qrValues="\(inputTitle)\n\(Date())"
            qrImage.image=generate(Name: qrValues)
        }
        
    }
    func generate(Name:String) -> UIImage?
    {
        let data=Name.data(using: String.Encoding.ascii)
        if let filter = CIFilter(name : "CIQRCodeGenerator")
        {
            filter.setValue(data, forKey: "inputMessage")
            let scale=CGAffineTransform(scaleX: 3, y: 3)
            if let output=filter.outputImage?.transformed(by: scale)
            {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
}

