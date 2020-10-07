//
//  roopPlayMovieViewController.swift
//  UnitStudyProject
//
//  Created by 阪井　洋樹 on 2020/10/07.
//

import UIKit
import AVKit

class RoopPlayMovieViewController: UIViewController {
    
    let bundleDataName: String = ""
    let bundleDataType: String = "mov"

    @IBAction func vcDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moviePath: String? = Bundle.main.path(forResource: bundleDataName, ofType: bundleDataType)
        playMovieFromPath(moviePath: moviePath)
    }
    
    func playMovieFromUrl(movieUrl: URL?) {
        if let movieUrl = movieUrl {
            let videoPlayer = AVPlayer(url: movieUrl)
            videoPlayer.play()
            
            // AVPlayer用のLayerを生成
            let playerLayer = AVPlayerLayer(player: videoPlayer)
            playerLayer.frame = view.bounds
            playerLayer.videoGravity = .resizeAspectFill
            playerLayer.zPosition = -1 // ボタン等よりも後ろに表示
            view.layer.insertSublayer(playerLayer, at: 0) // 動画をレイヤーとして追加
            
            // 最後まで再生したら最初から再生する
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: videoPlayer.currentItem, queue: .main) { [weak playerLayer] _ in
                playerLayer?.player?.seek(to: CMTime.zero)
                playerLayer?.player?.play()
            }
        } else {
            print("cannot play")
        }
    }

    func playMovieFromPath(moviePath: String?) {
        if let moviePath = moviePath {
            print("fileあるよ")
            self.playMovieFromUrl(movieUrl: URL(fileURLWithPath: moviePath))
        } else {
            print("no such file")
        }
    }

}
