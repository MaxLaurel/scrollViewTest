//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by Максим on 13.04.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame.size = CGSize(width: 200, height: 200)
        scroll.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        scroll.layer.borderWidth = 2
        scroll.layer.borderColor = UIColor.black.cgColor
        //scroll.contentOffset = CGPoint(x: 50, y: 50)
        return scroll
    }()
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "image-1")
        imageView.contentMode = .scaleAspectFill
        imageView.frame.size = scrollView.contentSize
    return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollViewConstraints()
        //imageViewConstraints()
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 5
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //scrollView.setContentOffset(CGPoint(x: 100, y: 100), animated: true)
        //scrollView.contentInset = UIEdgeInsets(top: 300, left: 20, bottom: 20, right: 20)
        
    }
    
}
extension ViewController {
    private func scrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    private func imageViewConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true

    }
}
extension ViewController {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
extension ViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrolling is running")
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrolling stopped")
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("I put off my finger")
    }
}
