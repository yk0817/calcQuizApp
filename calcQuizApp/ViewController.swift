//
//  ViewController.swift
//  calcQuizApp
//
//  Created by 山本　憲 on 2018/08/26.
//  Copyright © 2018年 山本　憲. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    
    // 足し算に使う変数を用意します。
    var a = 0
    var b = 0
    var correct = 0
    // 出題をする関数
    func question(){
        // ランダムに問題を作ります
        a = Int(arc4random() % 100)
        b = Int(arc4random() % 100)
        correct = a + b
        // ラベルに問題を表示します。
        myLabel.text = "\(a) + \(b) = ?"
        // テキストフィールドを空にします。
        myTextField.text = ""
    }
    
    @IBAction func tapButton(_ sender: Any) {
        // 整数が入力されているか
        guard let answer = Int(myTextField.text!) else {
            return
        }
        // 答え合わせ
        var check = "間違い"
        if answer == correct {
            check = "正解"
        }
        
        // ダイアログを作る
        let alert = UIAlertController(title: "足し算クイズ", message: check, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler:{action in
            // 正解なら次の出題
            if answer == self.correct {
                self.question()
            }
        })
        alert.addAction(defaultAction)
        // ダイアログを表示します。
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 出題をする関数を呼び出します。
        question()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

