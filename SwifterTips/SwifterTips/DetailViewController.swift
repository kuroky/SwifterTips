//
//  DetailViewController.swift
//  SwifterTips
//
//  Created by kuroky on 2018/8/28.
//  Copyright © 2018年 Kuroky. All rights reserved.
//

import UIKit
import Down

class DetailViewController: UIViewController {

    var fileName: String!
    var naviTitle: String!
    @IBOutlet weak var hudView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    func setupUI() {
        self.navigationItem.title = naviTitle
    }
    
    func setupData() {
        guard let json = loadResourceFile(fileName: fileName) else {
            let controller = UIAlertController(title: naviTitle, message: "no data", preferredStyle: .alert)
            let alerAction = UIAlertAction(title: "Back", style: .default) { action in
                self.navigationController?.popViewController(animated: true)
            }
            controller.addAction(alerAction)
            self.present(controller, animated: true)
            return
        }
        
        startHud()
        guard let contentView = try? DownView(frame: view.bounds, markdownString: json, didLoadSuccessfully: { [weak self] in
            self?.stopHud()
        }) else {
            stopHud()
            return
        }
        view.addSubview(contentView)
        view.bringSubview(toFront: hudView)
    }
    
    func startHud() {
        hudView.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    func stopHud() {
        view.isUserInteractionEnabled = true
        hudView.startAnimating()
        hudView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
