//
//  UIViewController+Alerts.swift
//  FetchRewards-Recipes-App
//
//  Created by Juan Ceballos on 10/2/21.
//

import UIKit

extension UIViewController {
  public func showAlert(title: String?, message: String?) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
    alertController.addAction(okAction)
    present(alertController, animated: true)
  }
}

