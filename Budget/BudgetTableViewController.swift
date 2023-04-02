//
//  BudgetTableViewController.swift
//  Budget

import UIKit

class BudgetTableViewController: UITableViewController {
//    var budgetAmount: Double = 0.0
    var budgetAmount: [Double] = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    let Months = ["January", "February", "March", "April", "May", "June","July", "August", "September", "October", "November", "December"]
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let budget = defaults.array(forKey: "key") as? [Double] {
            budgetAmount = budget
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        title = "My Budget"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Months.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = Months[indexPath.row]
        if budgetAmount[indexPath.row] == 0.0 {
            cell.detailTextLabel?.text = "Tap to set budget"
        }
        else {
            cell.detailTextLabel?.text = String(format: "%.2f", budgetAmount[indexPath.row])
        }
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var textField = UITextField()
        // show alert with text field
        let alert = UIAlertController(title: "Set Budget",
                                        message: "Enter your monthly budget",
                                        preferredStyle: .alert)
          
          let saveAction = UIAlertAction(title: "Save",
                                         style: .default) {_ in
//              tableView.cellForRow(at: indexPath.row).
//              self.budgetAmount = Double(textField.text!)!
//              self.tableView.reloadData()
//              let textF = alert.textFields?.first
//              if let text = textF!.text{
//                  var textnum = Double(text)
//                  print(textnum! as Any)
//                  print(indexPath.row)
//                  self.budgetAmount[indexPath.row] = textnum!
//              } else{print(0)}
              let budget = Double(textField.text!) ?? 0.0
              self.budgetAmount[indexPath.row] = budget
              self.defaults.set(self.budgetAmount, forKey: "key")
              self.tableView.reloadData()
          }
          let cancelAction = UIAlertAction(title: "Cancel",
                                           style: .cancel)
//        alert.addTextField()
        alert.addTextField{(alertTextField) in
            textField = alertTextField
        }
          
          alert.addAction(saveAction)
          alert.addAction(cancelAction)
          
          present(alert, animated: true)
    }
    func addBudget() -> Double {
        return 0
    }
    
}

