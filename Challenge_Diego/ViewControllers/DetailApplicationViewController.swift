//
//  DetailApplicationViewController.swift
//  Challenge_Diego
//
//  Created by Diego Quimbo on 2/8/17.
//  Copyright © 2017 Diego Quimbo. All rights reserved.
//

import UIKit
import Spring

class DetailApplicationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SummaryTableViewCellDelegate {
    
    // IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    var application: Application!
    
    var heightCellSummary: CGFloat = 160.0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Eliminate Extra separators below UITableView
        self.tableView.tableFooterView = UIView()
        
        self.tableView.sectionHeaderHeight = 150
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    // MARK: - UITableView
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // Add header in TableView
        let headerView = HeaderDetailTableView.instanceFromNib()
        headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 150)
        headerView.titleLabel.text = self.application.name
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 134
        case 1:
            return self.heightCellSummary
        case 2:
            return 65
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailBaseTableViewCell") as! DetailBaseTableViewCell
        
        cell.loadElementsInCell(_application: self.application)
        
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailBaseTableViewCell") as! DetailBaseTableViewCell
            
            cell.loadElementsInCell(_application: self.application)
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryTableViewCell") as! SummaryTableViewCell
            cell.delegate = self
            
            cell.loadElementsInCell(_summary: self.application.summary)
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCategoryTableViewCell") as! DetailCategoryTableViewCell
            
            cell.loadElementsInCell(_application: self.application)
            
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            return cell
 
        }
        
    }
    
    // MARK: - SummaryTableViewCellDelegate
    
    func updateHeightInSummaryCell(size: CGSize) {
        
        // Show all summary on Cell
        self.heightCellSummary = size.height + 35
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
