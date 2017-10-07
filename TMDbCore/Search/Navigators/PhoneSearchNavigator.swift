//
//  PhoneSearchNavigator.swift
//  TMDbCore
//
//  Created by Tomas Moyano on 07.10.17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

final class PhoneSearchNavigator: SearchNavigator {
    
    private unowned let viewControllerProvider: SearchResultsViewControllerProvider
    private var searchController: UISearchController!
    
    init(viewControllerProvider: SearchResultsViewControllerProvider) {
        self.viewControllerProvider = viewControllerProvider
    }
    
    //Configuro e instalo la search bar en el viewcontroller que me pasen
    func installSearch(viewController: UIViewController) {
        
        let resultsViewController = viewControllerProvider.searchResultsViewController()
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController.searchResultsUpdater = resultsViewController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = NSLocalizedString("Search", comment: "")
        searchController.searchBar.searchBarStyle = .minimal
        
        viewController.navigationItem.titleView = searchController.searchBar
        viewController.definesPresentationContext = true
    }
}
