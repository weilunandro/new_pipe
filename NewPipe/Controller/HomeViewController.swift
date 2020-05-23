//
//  File.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/23.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation
import UIKit
import RxAlamofire
import RxSwift

class HomeViewController: UIViewController{

    lazy var contentTabView :UITableView  = UITableView(frame: self.view.bounds)

    override func viewDidLoad() {
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        RxAlamofire.request(.get, "https://www.youtube.com/results?search_query=test&pbj=1")
        .responseString()
            .debug()
            .observeOn(MainScheduler.instance)
            .subscribe { print($0) }
    }
    
    

    private func setupViews() {
        contentTabView.backgroundColor = .yellow
        self.view.addSubview(contentTabView)
    }
}
