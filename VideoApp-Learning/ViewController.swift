//
//  ViewController.swift
//  VideoApp-Learning
//
//  Created by Sumit Makkar on 08/08/26.
//

import UIKit
import Supabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        let dbConnector = SupabaseConnector.activeInstance
        dbConnector.connect()
        print(dbConnector)
        Task {
            try? await dbConnector.getData(type: [VideosData].self)
        }
        super.viewDidLoad()
    }
}
