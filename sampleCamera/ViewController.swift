//
//  ViewController.swift
//  sampleCamera
//
//  Created by Eriko Ichinohe on 2018/01/24.
//  Copyright © 2018年 Eriko Ichinohe. All rights reserved.
//

import UIKit

//カメラ撮影に必要なプロトコルを追加
class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var pictureImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //カメラボタンが押された時（撮影モードになる）
    @IBAction func tapCamera(_ sender: UIBarButtonItem) {
    
        //カメラが使えるかどうか判別するための情報を取得(列挙体:enum)
        let camera = UIImagePickerControllerSourceType.camera
        
        //カメラが使える場合、撮影モードの画面を表示
        // isSourceTypeAvailable:型メソッド...インスタンス化していなくても使えるメソッド。インスタンス化しなくても、わかる普遍の情報を扱う際使用
        if UIImagePickerController.isSourceTypeAvailable(camera){
            //ImagePickerControllerオブジェクトを生成
            let picker = UIImagePickerController()
            
            //カメラモードに設定
            picker.sourceType = camera
            
            //デリゲートの設定（撮影後のメソッドをViewControllerに記述するため）
            picker.delegate = self
            
            //撮影モード画面の表示（モーダル表示）
            present(picker, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    //カメラで撮影し終わった後に発動するメソッド(P.263)
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //info:撮影した写真や、選択した写真の情報が格納されている変数
        
        //撮影した写真を変数に保存(P.271)
        let takenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        //撮影した写真を画面上のimageViewに設定し、表示
        pictureImageView.image = takenImage
        
        //自分のデバイス（このプログラムが動いてる場所）に写真を保存（カメラロール）
        UIImageWriteToSavedPhotosAlbum(takenImage, nil, nil, nil)
        
        // モーダルで表示している撮影モードの画面を閉じる（前の画面に戻る）
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

