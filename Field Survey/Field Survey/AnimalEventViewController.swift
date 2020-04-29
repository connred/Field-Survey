//
//  AnimalEventViewController.swift
//  Field Survey
//
//  Created by Connor Redmond on 4/29/20.
//  Copyright © 2020 Connor Redmond. All rights reserved.
//

import UIKit

class AnimalEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let animalEvents = AnimalEventsJSONLoader.load(fileName: "field_observations")
    let dateFormatter = DateFormatter()

    @IBOutlet weak var animalETableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalEvents.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalEventCell" , for: indexPath)
        if let cell = cell as? AnimalEventTableViewCell {
            let animalOB = animalEvents[indexPath.row]
            cell.animlaIconImage.image = animalOB.animalClass.image
            cell.animalNameLabel.text = animalOB.animalName
            
            cell.animalDateLabel.text = dateFormatter.string(from: animalOB.date)
            
        }
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? AnimalEventDetailViewController,
            let row = animalETableView.indexPathForSelectedRow?.row {
            dest.animalEvent = animalEvents[row]
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
