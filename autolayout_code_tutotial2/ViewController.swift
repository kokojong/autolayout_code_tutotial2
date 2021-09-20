//
//  ViewController.swift
//  autolayout_code_tutotial2
//
//  Created by kokojong on 2021/09/20.
//

import UIKit

class ViewController: UIViewController {

    var someViewBottomConstraint : NSLayoutConstraint?
    
    override func loadView() {
        super.loadView()
        print("loadView")
        
        
        view.backgroundColor = UIColor(named: "myBlue")
        
        let someView = UIView()
        someView.backgroundColor = UIColor(named: "myPink")
        someView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(someView)
        
        someView.layer.cornerRadius = 8
        NSLayoutConstraint.activate([
            someView.widthAnchor.constraint(equalToConstant: 100),
            someView.heightAnchor.constraint(equalToConstant: 50),
            someView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            someView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
        
        someViewBottomConstraint = NSLayoutConstraint(item: someView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0)
        someViewBottomConstraint?.isActive = true
        
        let moveUpButton = UIButton(type: .system)
        moveUpButton.translatesAutoresizingMaskIntoConstraints = false
        moveUpButton.backgroundColor = .white
        moveUpButton.setTitle("위로 올리기", for: .normal)
        moveUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        moveUpButton.setTitleColor(.black, for: .normal)
        moveUpButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        moveUpButton.layer.cornerRadius = 8
        moveUpButton.addTarget(self, action: #selector(moveViewUp), for: .touchUpInside)
        
        self.view.addSubview(moveUpButton)
        moveUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        moveUpButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 100).isActive = true
        
        
    }
    
    @objc fileprivate func moveViewUp (){
        print("moveViewUp")
        someViewBottomConstraint?.constant -= 100
        
        UIViewPropertyAnimator(duration: 1, curve: .linear, animations: { [weak self] in
            guard let self = self else {return}
            self.view.layoutIfNeeded()
            
        }).startAnimation()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}


#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    // update
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    // makeui
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}
        
struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
        .edgesIgnoringSafeArea(.all)
        .previewDisplayName("미리보기")
    }
}


#endif
