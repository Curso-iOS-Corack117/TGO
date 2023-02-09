//
//  HeaderView.swift
//  TGO
//
//  Created by Sergio Ordaz Romero on 03/02/23.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    let imageHeight: CGFloat = 80
    lazy var headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.snp.makeConstraints { make in
            make.width.equalTo(imageHeight)
            make.height.equalTo(imageHeight)
        }
        imageView.layer.cornerRadius = imageHeight/2
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()
    
    lazy var textStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            subtitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 4.0
        return stackView
    }()
    
    lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            headerImageView,
            textStackView])
        stackView.axis = .horizontal
        stackView.spacing = 16.0
        stackView.alignment = .center
        return stackView
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(hStackView)
        hStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-24)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        configure(title: "John Smith", subtitle: "Lorem Ipsum", image: nil)
    }
    
    func configure(title: String, subtitle: String, image: UIImage?) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        headerImageView.image = image
    }
}

#if DEBUG
import SwiftUI

@available(iOS 14, *)
struct HeaderView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        HeaderView().showPreview()
    }
}
#endif


//class ImageCardWithButton: UIView {
//    
//    lazy var cardImage: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false // To flag that we are using Constraints to set the layout
//        image.image = UIImage(systemName: "camera")
//        image.contentMode = .scaleAspectFit
//        return image
//    }()
//    
//    lazy var gradientView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false // IMPORTANT IF YOU ARE USING CONSTRAINTS INSTEAD OF FRAMES
//        return view
//    }()
//    
//    // VStack equivalent in UIKit
//    lazy var contentStack: UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .vertical
//        stack.distribution = .fillProportionally // Setting the distribution to fill based on the content
//        return stack
//    }()
//    
//    lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.numberOfLines = 0 // Setting line number to 0 to allow sentence breaks
//        label.text = "Let your curiosity do the booking"
//        label.font = UIFont(name: "Raleway-Semibold", size: 20) // Custom font defined for the project
//        label.textColor = .white
//        return label
//    }()
//    
//    lazy var cardButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .white
//        button.setTitle("I'm flexible", for: .normal)
//        button.setTitleColor(.blue, for: .normal)
//        //        button.addTarget(self, action: #selector(someObjcMethod), for: .touchUpInside) <- Adding a touch event and function to invoke
//        return button
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        commonInit()
//    }
//    
//    private func commonInit() {
//        self.addSubview(cardImage) // Adding the subview to the current view. i.e., self
//        
//        // Setting the corner radius of the view
//        self.layer.cornerRadius = 10
//        self.layer.masksToBounds = true
//        
//        NSLayoutConstraint.activate([
//            cardImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            cardImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            cardImage.topAnchor.constraint(equalTo: self.topAnchor),
//            cardImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//        ])
//        
//        setupGradientView()
//        addTextAndButton()
//    }
//    
//    private func setupGradientView() {
//        let height = self.frame.height * 0.9 // Height of the translucent gradient view
//        
//        self.addSubview(gradientView)
//        NSLayoutConstraint.activate([
//            gradientView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            gradientView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            gradientView.heightAnchor.constraint(equalToConstant: height)
//        ])
//        
//        // Adding the gradient
//        let colorTop =  UIColor.clear
//        let colorBottom = UIColor.black
//        
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
//        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.frame = CGRect(
//            x: 0,
//            y: self.frame.height - height,
//            width: self.frame.width,
//            height: height)
//        gradientView.layer.insertSublayer(gradientLayer, at:0)
//        print(self.frame)
//    }
//    
//    private func addTextAndButton() {
//        
//        // Adding the views to the stackview
//        contentStack.addArrangedSubview(titleLabel)
//        contentStack.addArrangedSubview(cardButton)
//        
//        gradientView.addSubview(contentStack)
//        NSLayoutConstraint.activate([
//            contentStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
//            contentStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),    // Negative for leading and bottom constraints
//            contentStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),        // Negative for leading and bottom constraints
//            
//            cardButton.heightAnchor.constraint(equalToConstant: 60)
//        ])
//        
//        cardButton.layer.cornerRadius = 30 // Half of the height of the button
//    }
//    
//}
