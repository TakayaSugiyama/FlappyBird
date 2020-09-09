//
//  ViewController.swift
//  FlappyBird
//
//  Created by 杉山貴哉 on 2020/09/10.
//  Copyright © 2020 TakayaSugiyama. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //SKViewに型を変換する
        let skView = self.view as! SKView
        //FPSを表示する
        skView.showsFPS = true
        //ノード数を表示する
        skView.showsNodeCount = true
        //ビューと同じサイズでシーンを作成する
        let scence = GameScene(size: skView.frame.size)
        //ビューにシーンを表示する
        skView.presentScene(scence)
    }


}

