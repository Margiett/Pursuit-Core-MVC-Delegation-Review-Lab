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
    
    var currentFrontSize1 = CGFloat (20){
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let movieDVC = segue.destination as? MovieDetailTableView else { fatalError("did not segue. failed to downcast as MovieDVC") }
        
        movieDVC.currentFontSize = currentFrontSize1
        
        //Step 4 - set the delegate of movieDVC to this view controller. since this happens, this view controller must conform to our custom delegate
        // this listence for calls on the delegate og the movieDetailVC
        movieDVC.delegate = self
    }
    
    //MARK: unwind Segue Button
    @IBAction func unwindSegueButton(segue: UIStoryboardSegue) {
    print("unwindSegue")

    guard let movieDetailTable = segue.source as? MovieDetailTableView else {
    return
    }
        
        currentFrontSize1 = movieDetailTable.currentFontSize!//17
      
}
    
}

//Step 5 - conform your vc to your customDelegate, and use the required functions
extension ViewController: FontSizeDelegate{
    
    //Step 6 - use the func you created, alongside its "stored" parameters
    func fontSizeChanged(_ viewController: MovieDetailTableView, _ fontSize: CGFloat) {
        
        self.currentFrontSize1 = fontSize
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
        
    
        
        //MARK: title Font
        //textLabel represent the title in the cell
        cell.textLabel?.text = movieCellForRow.name
        cell.textLabel?.font = UIFont(name: "Times New Roman", size: currentFrontSize1)
        
        
        //MARK: Subtitle Font
        // this represents the subtitle in the cell
        cell.detailTextLabel?.text = movieCellForRow.year.description
        cell.detailTextLabel?.font = UIFont(name: "Times New Roman", size:  currentFrontSize1 )
        
        return cell
    }
}


