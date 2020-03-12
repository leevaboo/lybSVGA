//
//  ViewController.swift
//  LearnSVGA
//
//  Created by Leo Ranbo on 2020/3/12.
//  Copyright © 2020 Leo Ranbo. All rights reserved.
//

import UIKit
import SVGAPlayer
class ViewController: UIViewController {

    lazy var player: SVGAPlayer =  {
      
        let player = SVGAPlayer()
        player.frame = CGRect.init(x: 20, y: 100, width: 300, height: 400);
        player.center = view.center
        player.loops = 3
        return player
    }()
    
    
    lazy var parser: SVGAParser = {
        let parser = SVGAParser()
        return parser
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(player)
    
    }
    
    func playAnimation1() {
        
        parser.parse(withNamed: "svga_launch", in: nil, completionBlock: { [weak self] (vedioItem) in

            self?.player.videoItem = vedioItem
            self?.player.startAnimation()

        }) { (error) in

        }
      
    }

    
    @objc func playAnimation2() {
        
        
        if let url = URL(string: "https://github.com/yyued/SVGA-Samples/blob/master/posche.svga?raw=true") {

            parser.parse(with: url, completionBlock: { [weak self] (vedioItem) in

                self?.player.videoItem = vedioItem
                self?.player.startAnimation()

            }) { (error) in
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        playAnimation1()
        self.perform(#selector(playAnimation2), with: nil, afterDelay: 3)
    }


}

