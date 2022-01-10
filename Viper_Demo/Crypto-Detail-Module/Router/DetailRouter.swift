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
        
             
        let view = detailStoryBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailVC
        
        var presenter: DetailPresenterProtocol = DetailPresenter()
        let router = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router        
        presenter.crypto = crypto
        
        return view
    }
    
    static var detailStoryBoard: UIStoryboard = {
        return UIStoryboard(name: "DetailStoryBoard", bundle: Bundle.main)
    }()
    
    
}
