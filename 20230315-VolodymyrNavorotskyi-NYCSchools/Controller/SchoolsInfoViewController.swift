//
//  SchoolsInfoViewController.swift
//  20230315-VolodymyrNavorotskyi-NYCSchools
//
//  Created by Imac on 3/15/23.
//

import UIKit

class SchoolsInfoViewController: UIViewController {
    
    var schools: Schools?
    
    @IBOutlet weak var schoolNameLbl: UILabel!
    @IBOutlet weak var schoolCityLbl: UILabel!
    @IBOutlet weak var schoolStateLbl: UILabel!
    @IBOutlet weak var schoolZipLbl: UILabel!
    @IBOutlet weak var schoolContactNumberLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let school = schools {
            schoolNameLbl.text = school.name ?? "Unknown"
            schoolCityLbl.text = "City:  \(school.city ?? "No Data")"
            schoolStateLbl.text = "State: \(school.state ?? "No Data")"
            schoolZipLbl.text = "Zip: \(school.zip ?? "No Data")"
            schoolContactNumberLbl.text = "Phone: \(school.contact_number ?? "No Data")"
        }
       
    }
    

    

}
