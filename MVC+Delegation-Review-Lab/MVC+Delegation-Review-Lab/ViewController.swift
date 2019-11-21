//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var currentFrontSize1 = CGFloat(20) {
        didSet {
            tableView.reloadData()
        }
    }
    
    var didSetMovieVC = [Movie]() {
        didSet {
            tableView.reloadData()
            
        }
        
    }

  override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func loadData() {
        didSetMovieVC = Movie.allMovies
    }

}
extension ViewController: UITableViewDataSource {
    //MARK: number of Rows in sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return didSetMovieVC.count
    }
    //MARK: cell for row at
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
       
        let movieCellForRow = didSetMovieVC[indexPath.row]
        //textlabel.text = the subtitle in the cell on the storyboard
    
        
        //MARK: title Font
        //textLabel represent the title in the cell
        cell.textLabel?.text = movieCellForRow.name
        cell.textLabel?.font = UIFont(name: "Times New Roman", size: currentFrontSize1)
        //MARK: Subtitle Font
        // this represents the subtitle in the cell
        cell.detailTextLabel?.text = movieCellForRow.year.description
        cell.detailTextLabel?.font = UIFont(name: "Time New Roman", size: currentFrontSize1)
        
        return cell
    }
}

