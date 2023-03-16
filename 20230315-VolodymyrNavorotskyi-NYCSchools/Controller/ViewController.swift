//
//  ViewController.swift
//  20230315-VolodymyrNavorotskyi-NYCSchools
//
//  Created by Imac on 3/15/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var resultsData: Response?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup() {
        getResultData { [self] in
            reloadTable()
        }
            tableView.delegate = self
            tableView.dataSource = self
        }
    
        private func reloadTable(){
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
}

//MARK: - Extensions UITableViewDelegate, UITableViewDataSource


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        resultsData?.schools?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let school = resultsData?.schools
        cell.textLabel?.text = school![indexPath.row].name
        cell.detailTextLabel?.text = school![indexPath.row].city
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SchoolsInfoViewController") as! SchoolsInfoViewController
        vc.schools = resultsData?.schools?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
   //MARK: - API-Manager
    
    func getResultData(completion : @escaping () -> ()) {
        
        let url = URL(string:"https://code.org/schools.json")
        
        URLSession.shared.dataTask(with: url!) { [weak self] (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(Response.self, from: data)
                self?.resultsData = empData
                completion()
            }
        }.resume()
    }
    
}

