//
//  DetailAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 30/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

final class DetailAssembly {
	private let imageLoadingAssembly: ImageLoadingAssembly
    private let navigationController: UINavigationController

    init(imageLoadingAssembly: ImageLoadingAssembly, navigationController:UINavigationController) {
		self.imageLoadingAssembly = imageLoadingAssembly
        self.navigationController = navigationController
	}

	func detailHeaderPresenter() -> DetailHeaderPresenter {
		return DetailHeaderPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}

	func posterStripPresenter() -> PosterStripPresenter {
		return PosterStripPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}
    
    func detailNavigator() -> DetailNavigator {
        //Aca es dónde va la lógica que depende de la navegación (iphone/ipad) podría haber una clase factory que se encargue de esa lógica y me provea del navigator correspondiente
        return PhoneDetailNavigator(navController: navigationController, viewControllerProvider: self)
    }
}

extension DetailAssembly: DetailViewControllerProvider {
    
    // FIXME: Temporarly implementation of DetailPresenter
    private class DummyDetailPresenter: DetailPresenter {
        
        var view: DetailView?
        
        func didLoad() {}
        func didSelect(item: PosterStripItem) {}
    }
    
    func detailViewController(identifier: Int64, mediaType: MediaType) -> UIViewController {
        
        return DetailViewController(presenter: DummyDetailPresenter(),
                                    headerPresenter: detailHeaderPresenter(),
                                    posterStripPresenter: posterStripPresenter())
    }
}
