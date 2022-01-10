//
//  DetailVC.swift
//  Viper_Demo
//
//  Created by Alican Kurt on 10.01.2022.
//

import UIKit

protocol DetailViewProtocol{
    var presenter: DetailPresenterProtocol? {get set}
    func showCryptoDetail(withCrypto crypto: CryptoModel)
    func showCryptoError(withError error: Error)
}

class DetailVC: UIViewController, DetailViewProtocol {

    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    func showCryptoDetail(withCrypto crypto: CryptoModel) {
        print(crypto)
    }
    
    func showCryptoError(withError error: Error) {
        print(error)
    }
    
    
    



}
