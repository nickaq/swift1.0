//
//  ViewController.swift
//  exFirst
//
//  Created by STC on 11.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabelDescription: UILabel!
    @IBOutlet weak var textNameField: UITextField!
    @IBOutlet weak var viewImage: UIImageView!
    
    struct Gallery {
        var arrayOfNames = ["Food", "Cat", "Forest", "Tree"]
        var arrayOfDescriptions = ["Description","Description","Description","Description"]
        var arrayOfImages = [UIImage(named: "tree.jpeg"),UIImage(named: "duy.jpeg"),UIImage(named: "pervaya.jpeg"),UIImage(named: "tretya.jpeg")]
        var indexOfImages = 0
    }
    
    var gallery = Gallery()
    
    @IBAction func nextButton(_ sender: UIButton) {
        gallery.indexOfImages += 1
        if gallery.indexOfImages >= gallery.arrayOfNames.count {
            gallery.indexOfImages = 0
        }
        updateImage()
    }
    
    @IBAction func prevButton(_ sender: UIButton) {
        gallery.indexOfImages -= 1
        if gallery.indexOfImages < 0 {
            gallery.indexOfImages = gallery.arrayOfNames.count - 1
        }
        updateImage()
    }
    func updateImage(){
        viewImage.image = gallery.arrayOfImages[gallery.indexOfImages]
        textNameField.text = gallery.arrayOfNames[gallery.indexOfImages]
        textLabelDescription.text = gallery.arrayOfDescriptions[gallery.indexOfImages]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "descriptionView" {
            if let vc = segue.destination as? OtherViewController {
                vc.descriptions = {
                    text in
                    self.textLabelDescription.text = text
                    self.gallery.arrayOfDescriptions[self.gallery.indexOfImages] = text ?? "Description"
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateImage()
        customTextLabelDescr()
    }
    func customTextLabelDescr() {
        textLabelDescription.layer.borderColor = UIColor.systemGray5.cgColor
        textLabelDescription.layer.borderWidth = 1
        textLabelDescription.layer.cornerRadius = 10
        textLabelDescription.textAlignment = .left
        textLabelDescription.sizeToFit()
        textNameField.isUserInteractionEnabled = false
    }
}

