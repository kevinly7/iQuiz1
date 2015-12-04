//
//  ViewController.swift
//  iQuiz1
//
//  Created by Kevin Ly on 12/3/15.
//  Copyright © 2015 Kevin Ly. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    let textCellIdentifier = "quizCell"
    let quizzes = [("Mathematics", "Test your arithmetic skills."), ("Marvel Super Heros", "How well do you know your super heroes?"), ("Science", "All things science!")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let (quizName, quizSubHeading) = quizzes[indexPath.row]
        cell.textLabel?.text = quizName
        cell.detailTextLabel?.text = quizSubHeading
        var image = UIImage(named: "")
        switch quizName {
        case "Mathematics":
            image = UIImage(named: "math");
        case "Marvel Super Heros":
            image = UIImage(named: "marvel");
        default:
            image = UIImage(named: "science");
        }
        cell.imageView?.image = image
        cell.imageView?.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        return cell
    }
    
    func tableView(tableView : UITableView,  titleForHeaderInSection section: Int)->String? {
        return "Quizzes"
    }
    
    
    
    @IBAction func settings(sender: UIButton) {
        let alertController = UIAlertController(title: "Settings", message: "Settings will go here", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
}

