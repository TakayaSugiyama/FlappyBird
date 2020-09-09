//
//  GameScenc.swift
//  FlappyBird
//
//  Created by 杉山貴哉 on 2020/09/10.
//  Copyright © 2020 TakayaSugiyama. All rights reserved.
//

import UIKit
import SpriteKit

class GameScene: SKScene {
    //SKView上にシーンが表示されたときに呼ばれるメソッド
    override func didMove(to view: SKView) {
        //背景色を設定
        backgroundColor = UIColor(red: 0.15, green: 0.75, blue: 0.90, alpha: 1)
        
        //スクロールするスプライトの親ノード
        let scrollNode = SKNode()
        addChild(scrollNode)
        
        //地面の画像を読み込む
        let groundTexture = SKTexture(imageNamed: "ground")
        groundTexture.filteringMode = .nearest
        
        //必要な枚数を計算
        let needNumber = Int(self.frame.size.width / groundTexture.size().width) + 2
        
        //スクロールするアクションを作成
        //左方向に画像一枚スクロールさせるアクション
        let moveGround = SKAction.moveBy(x: -groundTexture.size().width, y: 0, duration: 5)
        //元の位置に戻すアクション
        let resetGround = SKAction.moveBy(x: groundTexture.size().width, y: 0, duration: 0)
        
        let repeactScrollGround = SKAction.repeatForever(SKAction.sequence([moveGround, resetGround]))
        
        for i in 0..<needNumber {
           //テクスチャを指定してスプライトを作成する
           let groundSprite = SKSpriteNode(texture: groundTexture)
           
           //スプライトの表示する位置を指定する
           groundSprite.position = CGPoint(
               x: groundTexture.size().width / 2 + groundTexture.size().width * CGFloat(i),
               y: groundTexture.size().height / 2
           )
            
           groundSprite.run(repeactScrollGround)
           
           //スプライトを追加する
           scrollNode.addChild(groundSprite)
        }
    }
}
