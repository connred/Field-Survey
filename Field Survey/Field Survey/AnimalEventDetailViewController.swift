//
//  AnimalEventDetailViewController.swift
//  Field Survey
//
//  Created by Connor Redmond on 4/29/20.
//  Copyright © 2020 Connor Redmond. All rights reserved.
//

import UIKit

class AnimalEventDetailViewController: UIViewController {

    var animalEvent: AnimalEvent?
    var dateFormatter = DateFormatter()
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var animailIconImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Observation"
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        animailIconImage.image = animalEvent?.animalClass.image
        classLabel.text = animalEvent?.animalName
        descLabel.text = animalEvent?.desc
        
        if let date = animalEvent?.date {
            dateLabel.text = dateFormatter.string(from: date)
        } else {
            dateLabel.text = ""
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

}
