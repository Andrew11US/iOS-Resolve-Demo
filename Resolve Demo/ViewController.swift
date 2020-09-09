//
//  ViewController.swift
//  Resolve Demo
//
//  Created by Andrew on 9/9/20.
//  Copyright © 2020 Andrii Halabuda. All rights reserved.
//

import UIKit
import Resolver

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Resolver.register { NetworkService() as NetworkServicing }
        Resolver.register { ViewModel() }.resolveProperties { (resolver, viewModel) in
            viewModel.service = resolver.optional()
        }
        
        let viewModel: ViewModel = Resolver.resolve()
        viewModel.loadData()
    }


}

class ViewModel {
    var service: NetworkServicing!
    
    func loadData() {
        service.getData()
    }
}

struct NetworkService: NetworkServicing {
    func getData() {
        print("Data has been fetched")
    }
}

protocol NetworkServicing {
    func getData()
}
