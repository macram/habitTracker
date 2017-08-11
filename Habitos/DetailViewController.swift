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

    func configureNavigation() {
        var titleForController = ""
        
        if viewModel.habit?.name != nil {
            titleForController = viewModel.habit!.name!
        }
        
        self.navigationController?.navigationItem.title = titleForController
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureNavigation()
    }

//    var detailItem: Habit? {
//        didSet {
//            // Update the view.
//            configureNavigation()
//        }
//    }


}

