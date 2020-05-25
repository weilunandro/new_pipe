//
//  File.swift
//  NewPipe
//
//  Created by Lun Wei on 2020/5/23.
//  Copyright © 2020 Lun Wei. All rights reserved.
//

import Foundation
import UIKit
import Moya
import RxSwift
import SwiftyJSON

class HomeViewController: UIViewController{

    lazy var contentTabView :UITableView  = UITableView(frame: self.view.bounds)
    let disposableBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let provider = MoyaProvider<YoutubeTargetType>()

        provider.rx.request(.trending(local: "CN"))
            .subscribe( { event in
                switch event {
                case .success(let element) :
                    print(element.statusCode)
                    let json = JSON(element.data)
                    YoutubeHttpResouce.parseStreamInfoFrom(json: json)
                case .error(let error) :
                        print(error)
                }
            }).disposed(by: self.disposableBag)
//        RxAlamofire.request(.get, "https://www.youtube.com/results?search_query=test&pbj=1")
//            .responseString()
//            .debug()
//            .observeOn(MainScheduler.instance)
//            .subscribe(onNext: { (response, data) in
//                print(data)
//            }, onError: { error in
//                print(error)
//            })
    }
    
    

    private func setupViews() {
        contentTabView.backgroundColor = .yellow
        self.view.addSubview(contentTabView)
    }
}
