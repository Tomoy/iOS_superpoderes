@testable import TMDbCore

import RxSwift
import PlaygroundSupport
import Kingfisher

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let assembly = CoreAssembly()

//Mucho mas largo sin el assembly y necesito importar Kingfisher
/*let webService = WebService(configuration: .default)
let imageRepository = ImageRepository(webService: webService, imageManager: KingfisherManager.shared)*/


let imageRepository = assembly.imageLoadingAssembly.imageRepository

imageRepository.image(at: "ncEmkHADNggjR0dlerOIHqmiY0O.jpg", size: .w300)
	.subscribe(onNext: {
		let image = $0
		print(image)
	})
	.disposed(by: disposeBag)
