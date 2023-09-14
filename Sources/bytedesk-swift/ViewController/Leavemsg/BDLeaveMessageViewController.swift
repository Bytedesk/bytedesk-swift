//
//  File.swift
//  
//
//  Created by 宁金鹏 on 2023/9/12.
//

import UIKit

class BDLeaveMessageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var type: String?
    var uid: String?
    // var mAdminUid: String?
    var imageUrl: String?

    var contentTextView: UITextView?
    var imageView: UIImageView?
    var mobileTextField: UITextField?

    var mIsPush: Bool = false
    var forceEnableBackGesture: Bool = false

    var mImagePickerController: UIImagePickerController?
    
    let deviceHeight = UIScreen.main.bounds.size.height
    let deviceWidth = UIScreen.main.bounds.size.width
    
    public func initWithType(type: String, uid: String, isPush: Bool) {
        NSLog("1.%@", #function)
        self.type = type
        self.uid = uid
        self.mIsPush = isPush
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("2.%@", #function)
        self.title = "留言"
        self.view.backgroundColor = UIColor.systemGroupedBackground
        if #available(iOS 13.0, *) {
            let mode = UITraitCollection.current.userInterfaceStyle
            if mode == .dark {
                self.view.backgroundColor = UIColor.black
            } else {
                self.view.backgroundColor = UIColor.white
            }
        }
        self.imageUrl = ""
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "我的留言", style: .plain, target: self, action: #selector(showLeaveRecords))
        if self.mIsPush {
            //
        } else {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(handleCloseButtonEvent))
        }
        self.forceEnableBackGesture = true
//        let singleTap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
//        singleTap.numberOfTapsRequired = 1
//        singleTap.numberOfTouchesRequired = 1
//        self.view.addGestureRecognizer(singleTap)
//        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
//        doubleTap.numberOfTapsRequired = 2
//        doubleTap.numberOfTouchesRequired = 1
//        self.view.addGestureRecognizer(doubleTap)
        self.mImagePickerController = UIImagePickerController()
        self.mImagePickerController!.delegate = self
        self.mImagePickerController!.allowsEditing = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NSLog("3.%@", #function)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        NSLog("4.%@", #function)
        contentTextView = UITextView(frame: CGRect(x: 10, y: 70, width: deviceWidth - 20, height: 100))
        contentTextView!.font = UIFont.systemFont(ofSize: 16)
//        contentTextView!.placeholder = "请输入留言内容"
        contentTextView!.layer.cornerRadius = 5.0
        contentTextView!.layer.masksToBounds = true
        contentTextView!.layer.borderColor = UIColor.systemGray.cgColor
        contentTextView!.layer.borderWidth = 0.5
        self.view.addSubview(contentTextView!)
        
        imageView = UIImageView(frame: CGRect(x: 10, y: 180, width: 100, height: 100))
        imageView!.image = UIImage(named: "AlbumAddBtn.png", in: .module, with: nil)
        imageView!.isUserInteractionEnabled = true
        imageView!.layer.cornerRadius = 5.0
        imageView!.layer.masksToBounds = true
        imageView!.layer.borderColor = UIColor.systemGray.cgColor
        imageView!.layer.borderWidth = 0.5
        self.view.addSubview(imageView!)
//        let singleTap = UITapGestureRecognizer(target: self, action: #selector(presentViewController(_:)))
//        singleTap.numberOfTapsRequired = 1
//        singleTap.numberOfTouchesRequired = 1
//        imageView!.addGestureRecognizer(singleTap)
        
        mobileTextField = UITextField(frame: CGRect(x: 10, y: 290, width: deviceWidth - 20, height: 40))
        mobileTextField!.placeholder = "请输入联系方式"
        mobileTextField!.layer.cornerRadius = 5.0
        mobileTextField!.layer.masksToBounds = true
        mobileTextField!.layer.borderColor = UIColor.systemGray.cgColor
        mobileTextField!.layer.borderWidth = 0.5
        self.view.addSubview(mobileTextField!)
        
        let submitButton = UIButton(frame: CGRect(x: 10, y: 340, width: deviceWidth - 20, height: 40))
        submitButton.backgroundColor = UIColor.systemOrange
        submitButton.setTitle("提交留言", for: .normal)
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonClicked), for: .touchUpInside)
        submitButton.layer.cornerRadius = 20.0
        submitButton.layer.masksToBounds = true
        submitButton.layer.borderColor = UIColor.systemGray.cgColor
        submitButton.layer.borderWidth = 0.5
        self.view.addSubview(submitButton)
    }
    
    @objc func submitButtonClicked() {
        let content = contentTextView?.text
        let mobile = mobileTextField?.text
        
        if (content!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty ||
            mobile!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty) {
            BDToast.show(message: "留言内容或手机号不能为空")
            return
        }
        
        BDUIApis.showTip(with: self, message: "留言中，请稍后")
        BDCoreApis.leaveMessage(type: type,
                                uid: uid,
                                mobile: mobile,
                                content: content,
                                imageUrl: imageUrl) { leaveMsgResult in
            BDToast.show(message: leaveMsgResult.message!)
            self.navigationController?.dismiss(animated: true)
        } onFailure: { error in
            BDToast.show(message: error)
        }
    }
    
    @objc func closeVC() {
        self.dismiss(animated: true)
    }
    
    @objc func showLeaveRecords() {
        let bdleaveRecordVC = BDLeaveHistoryViewController()
        self.navigationController?.pushViewController(bdleaveRecordVC, animated: true)
    }
    
    @objc func handleCloseButtonEvent() {
        self.navigationController?.dismiss(animated: true)
    }
    
    @objc func handleBackButtonEvent() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func dismissKeyboard() {
        
    }
    
}
