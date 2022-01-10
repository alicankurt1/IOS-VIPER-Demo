//
//  CryptoInfoRouter.swift
//  Viper_Demo
//
//  Created by Alican Kurt on 8.01.2022.
//

import Foundation
import UIKit


// Entry Point + Comminication
// Class, Protocol


protocol CryptoRouterProtocol{
    var vC: UIViewController? {get set}
    static func createFirstModule() -> UIViewController
    func pushToCryptoDetailModule(withCrypto crypto: CryptoModel)
}


class CryptoInfoRouter: CryptoRouterProtocol{
    
    var vC: UIViewController?
      
    static func createFirstModule() -> UIViewController {
        
        let view = mainStoryBoard.instantiateViewController(withIdentifier: "FirstViewController") as! CryptosInfoVC
        
        var presenter: CryptoPresenterProtocol = CryptoInfoPresenter()
        var interactor: CryptoInteractorProtocol = CryptoInfoInteractor()
        let router = CryptoInfoRouter()
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.vC = view
        
        return navigation
    }
    
    static var mainStoryBoard: UIStoryboard = {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }()
    
    func pushToCryptoDetailModule(withCrypto crypto: CryptoModel) {
        
        let cryptoDetailModule = DetailRouter.CreateModule(withCrypto: crypto)
        vC?.navigationController?.pushViewController(cryptoDetailModule, animated: true)
    }
    
    
}

