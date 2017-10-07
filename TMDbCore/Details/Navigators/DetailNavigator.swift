//
//  DetailNavigator.swift
//  TMDbCore
//
//  Created by Tomas Moyano on 07.10.17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

//Con protocolo, para poder reutilizarlo en distintos tipos de navegaciones, por ej iPad / iPhone modal, push
protocol DetailNavigator {
    
    func showDetail(withIdentifier identifier: Int64, mediaType: MediaType)
}
