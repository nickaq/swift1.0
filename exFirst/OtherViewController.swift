//
//  OtherViewController.swift
//  exFirst
//
//  Created by STC on 27.02.2024.
//

import UIKit

class OtherViewController: UIViewController {
    
    @IBOutlet weak var descriptionTextField: UITextField!
    var descriptions: ((String?) -> ())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextField.textAlignment = .left
        descriptionTextField.contentVerticalAlignment = .top
        
    }
    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapSave () {
        descriptions?(descriptionTextField.text ?? "")
        dismiss(animated: true, completion: nil)
    }
    
}
