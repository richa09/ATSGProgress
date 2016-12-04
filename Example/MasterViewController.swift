//
//  MasterViewController.swift
//  Example
//
//  Created by Antonio Serrano on 3/12/16.
//  Copyright © 2016 ASG APPS S.L. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var objects = ["Default loader", "Loader with message","Customized Loader"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "ATSGProgress"

    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 35
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel!.text = "Default loader"
        } else if indexPath.row == 1 {
            cell.textLabel!.text = "Loader with message"
        } else if indexPath.row == 2 {
            cell.textLabel!.text = "Customized Loader"
        }else {
            cell.textLabel!.text = "Custom Indicator \(indexPath.row - 3)"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            showBasicProgress()
        } else if indexPath.row == 1 {
            showBasicProgressWithMessage()
        } else if indexPath.row == 2 {
            showCustomProgress()
        }else {
            showCustomIndicator(index: indexPath.row - 2)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        autodismiss()
        
    }
    
    fileprivate func showBasicProgress() {
        
        // Display basic loader
        ATSGProgress.showLoadingViewWithMessage()
        
    }
    
    fileprivate func showBasicProgressWithMessage(){
    
        // Display loader with message
        ATSGProgress.showLoadingViewWithMessage(msg: "Loading...")
        
    }
    
    fileprivate func showCustomProgress(){
        
        // Set styles
        ATSGProgress.font = UIFont(name: "Verdana-Bold", size: 15)
        ATSGProgress.textColor = UIColor.white
        ATSGProgress.backColor = UIColor(colorLiteralRed: 61.0/255.0, green: 172.0/255.0, blue: 227.0/255.0, alpha: 1)
        ATSGProgress.backSize  = 120
        ATSGProgress.backRadius = 24
        
        ATSGProgress.showLoadingViewWithMessage(msg: "Loading...")
        
    }
    
    fileprivate func showCustomIndicator(index:Int){
        
        // Set styles
        ATSGProgress.textColor = UIColor.white
        ATSGProgress.backColor = UIColor(colorLiteralRed: 61.0/255.0, green: 172.0/255.0, blue: 227.0/255.0, alpha: 1)
        ATSGProgress.backSize  = 120
        ATSGProgress.backRadius = 8
        ATSGProgress.indicatorStyle = IndicatorStyle(raw:index)
        
        ATSGProgress.showLoadingViewWithMessage()
        
    }
    
    
    fileprivate func autodismiss(){
        
        let deadlineTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
            
            ATSGProgress.dismiss()
            self.resetSettings()
            
        }
    
    }
    
    fileprivate func resetSettings(){
    
        ATSGProgress.font = UIFont(name: "HelveticaNeue", size: 13)
        ATSGProgress.textColor = UIColor.white
        ATSGProgress.backColor = UIColor.black
        ATSGProgress.backSize  = 120
        ATSGProgress.backRadius = 8
        ATSGProgress.indicatorStyle = nil
    
    }

}

