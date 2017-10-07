//
//  PhoneDetailNavigator.swift
//  TMDbCore
//
//  Created by Tomas Moyano on 07.10.17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit

final class PhoneDetailNavigator: DetailNavigator {
    
    //Para hacer la implementación del método showDetail, pienso que necesito? Un navigationcontroller y el viewcontroller que quiero pushear, el viewcontroller a pushear, tiene que ser creado aca porque depende del id y el mediaType, entonces hacemos un protocolo provider (DetailViewControllerProvider) para proveer el ViewController de forma reutilizable
    //Dependencias necesarias
    private let navigationController: UINavigationController?
    private unowned let viewControllerProvider: DetailViewControllerProvider
    
    init(navController: UINavigationController, viewControllerProvider: DetailViewControllerProvider) {
        self.navigationController = navController
        self.viewControllerProvider = viewControllerProvider
    }
    func showDetail(withIdentifier identifier: Int64, mediaType: MediaType) {
        navigationController?.pushViewController(viewControllerProvider.detailViewController(identifier: identifier, mediaType: mediaType), animated: true)
    }
}

