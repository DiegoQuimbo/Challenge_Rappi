//
//  MainViewController.swift
//  Challenge_Diego
//
//  Created by Diego Quimbo on 2/7/17.
//  Copyright © 2017 Diego Quimbo. All rights reserved.
//

import UIKit
import AlamofireImage

class MainViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Variables
    var applications: [Application] = []
    var applicationSelected: Application!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Load Applications from server
        self.getApplications(limit: 20)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    // MARK: - Private Methods
    
    func getApplications(limit: Int)  {
        
        ConnectionManager.getApplications(20) { (error, message, applicationsList) in
            
            if error == nil {
                
                self.applications = applicationsList
                
                self.tableView.reloadData()
                self.collectionView.reloadData()
            }else{
                
                self.showError()
            }
        
        }
        
    }
    
    func showError() {
        let alertController = UIAlertController(title: "Error", message: "Error with the Internet connection", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancel = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        let retry = UIAlertAction(title: "Retry", style: UIAlertActionStyle.default){(result : UIAlertAction) -> Void in
            self.getApplications(limit: 20)
        }
        
        alertController.addAction(retry)
        alertController.addAction(cancel)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func goToDetailApplicationController(application: Application) {
        // Save application selected to pass DetailApplicationViewController
        self.applicationSelected = application
        
        // Push DetailApplicationViewController
        performSegue(withIdentifier: "ShowDetail", sender: nil)
        
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowDetail" {
            let detailApplicationViewController = segue.destination as! DetailApplicationViewController
            detailApplicationViewController.application = self.applicationSelected
            
        }
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableView
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.applications.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ApplicationTableViewCell") as! ApplicationTableViewCell
        
        let application = self.applications[indexPath.row]
        cell.loadElementsInCell(_application: application, index: indexPath.row)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Show Detail
        self.goToDetailApplicationController(application: self.applications[indexPath.row])
        
    }
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Collection View
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.applications.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ApplicationCollectionViewCell", for: indexPath) as! ApplicationCollectionViewCell
        
        let application = self.applications[indexPath.row]
        cell.loadElementsInCell(_application: application, index: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Show Detail
        self.goToDetailApplicationController(application: self.applications[indexPath.row])
    }
    
}
