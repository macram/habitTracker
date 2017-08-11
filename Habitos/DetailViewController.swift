//
//  DetailViewController.swift
//  Habitos
//
//  Created by Manu Mateos on 10/8/17.
//  Copyright © 2017 Liquid Squad. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var viewModel = DetailViewModel()

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var thisWeekLabel: UILabel!
    @IBOutlet weak var thisMonthLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    func configureNavigation() {
        var titleForController = ""
        
        if viewModel.habit?.name != nil {
            titleForController = viewModel.habit!.name!
        }
        
        self.navigationController?.navigationItem.title = titleForController
        
    }
    
    func configureView() {
        totalLabel.text = "Total: \(viewModel.events.count)"
        todayLabel.text = "Hoy: \(viewModel.today)"
        thisWeekLabel.text = "Esta semana: \(viewModel.thisWeek)"
        thisMonthLabel.text = "Este mes: \(viewModel.thisMonth)"
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureNavigation()
        configureView()
    }

//    var detailItem: Habit? {
//        didSet {
//            // Update the view.
//            configureNavigation()
//        }
//    }
    
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let event = viewModel.events[indexPath.row]
        configureCell(cell: cell, withEvent: event)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func configureCell(cell: UITableViewCell, withEvent event: Event) {
        cell.textLabel!.text = event.timestamp?.description
    }
}


