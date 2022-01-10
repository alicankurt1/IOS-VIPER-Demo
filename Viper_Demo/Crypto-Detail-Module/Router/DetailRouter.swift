//
//  DetailRouter.swift
//  Viper_Demo
//
//  Created by Alican Kurt on 10.01.2022.
//

import Foundation
import UIKit

protocol DetailRouterProtocol{
    static func CreateModule(withCrypto crypto: CryptoModel) -> DetailVC
}

class DetailRouter: DetailRouterProtocol{
    
    static func CreateModule(withCrypto crypto: CryptoModel) -> DetailVC {
        
             
        let view = mainStoryBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailVC
        
        var presenter: DetailPresenterProtocol = DetailPresenter()
        var interactor: DetailInteractorProtocol = DetailInteractor()
        let router = DetailRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        presenter.crypto = crypto
        
        return view
    }
    
    static var mainStoryBoard: UIStoryboard = {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }()
    
    
}
