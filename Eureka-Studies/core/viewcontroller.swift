//
//  form.swift
//  Eureka-Studies
//
//  Created by Mauricio Leal on 1/6/18.
//  Copyright © 2018 Mauricio Leal. All rights reserved.
//

import Foundation
import UIKit

class NFormViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    public var tableView: UITableView!
    
    // UITableView DATA SOURCE DATA SOURCE DATA SOURCE DATA SOURCE DATA SOURCE DATA SOURCE
    //  DATA SOURCE DATA SOURCE DATA SOURCE DATA SOURCE DATA SOURCE DATA SOURCE DATA SOURCE
    
    // >>>> CONFIGURING A TABLE VIEW
    
    // REQUIRED:
    // Asks the data source of a cell to insert in a particular location of the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
    }
    
    //    Asks the data source to return the number of section in the table view
//    func numberOfSections(in tableView: UITableView) -> Int {
//
//    }
    
    // REQUIRED:
    // Tells the data source to return the number of rows in a given section of a table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    //    Asks the data source for the title of the header of the specificed section of the table view
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//    }
    
    //    Asks the data source for the title of the footer of the specified section of the table view
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//
//    }
    
    // >>>> Inserting or Deleting Table Rows
    
    // >>>> Reordering Table Rows
    
    // >>>> Configuring an Index
    
    
    
    
    // UITableView DELEGATE DELEGATE DELEGATE DELEGATE DELEGATE DELEGATE DELEGATE DELEGATE
    //   DELEGATE DELEGATE DELEGATE DELEGATE DELEGATE DELEGATE DELEGATE DELEGATE DELEGATE
    
    // >>>> Configuring Rows for the Table View
    
    // >>>> Managing Accessory Views
    
    // >>>> Managing Selections
    
    // >>>> Modifying the Header and Footer of Sections
    
    // >>>> Editing Table Rows
    
    // >>>> Reordering Table Rows
    
    // >>>> Tracking the Removal of Views
    
    // >>>> Copying and Pasting Row Content
    
    // >>>> Managing Table View Highlighting
    
    // >>>> Managing Table View Focus
    
    // >>>> Handling Swipe Actions
    
    
    
}
