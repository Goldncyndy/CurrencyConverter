//
//  ViewController.swift
//  CurrencyCalculator
//
//  Created by Cynthia D'Phoenix on 8/4/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hamburgerButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var fromCurrencyDropdown: UIButton!
    @IBOutlet weak var toCurrencyDropdown: UIButton!
    
    @IBOutlet weak var conversionArrow: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    @IBOutlet weak var currencyTitleLabel: UILabel!
    @IBOutlet weak var marketButton: UIButton!
    
    @IBOutlet weak var toCurrencyView: UIView!
    @IBOutlet weak var fromCurrencyView: UIView!
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var marketView: UIView!
    
    @IBOutlet weak var contentView: UIView!
    let scrollView = UIScrollView()
//    let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hamburgerButton.setTitle("", for: .normal)
        fromCurrencyDropdown.setTitle("", for: .normal)
        toCurrencyDropdown.setTitle("", for: .normal)
        conversionArrow.setTitle("", for: .normal)
        infoButton.setTitle("", for: .normal)
        setupTitleLabel()
        setupMarketButton()
        setupCurrencyViews()
        
    }

    func setupTitleLabel() {
        currencyTitleLabel.numberOfLines = 0
       
        let line1 = "Currency"
        let line2 = "Converter"
        let dot = "."

        let fullText = "\(line1)\n\(line2)\(dot)"
        let attributedText = NSMutableAttributedString(string: fullText)

        // Style "Currency"
        attributedText.addAttributes([
            .foregroundColor: UIColor.systemBlue,
            .font: UIFont.boldSystemFont(ofSize: 35)
        ], range: NSRange(location: 0, length: line1.count))

        // Style "Converter"
        let converterStart = line1.count + 1 // +1 for \n
        attributedText.addAttributes([
            .foregroundColor: UIColor.systemBlue,
            .font: UIFont.boldSystemFont(ofSize: 35)
        ], range: NSRange(location: converterStart, length: line2.count))

        // Style the dot
        attributedText.addAttributes([
            .foregroundColor: UIColor.systemGreen,
            .font: UIFont.boldSystemFont(ofSize: 35)
        ], range: NSRange(location: fullText.count - 1, length: 1))

    
        currencyTitleLabel.attributedText = attributedText
        
        currencyTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        

    }
    
    func setupMarketButton() {
        let title = "Mid-market exchange rate at 13:38 UTC"
            let attributes: [NSAttributedString.Key: Any] = [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .foregroundColor: UIColor.systemBlue // set color
            ]
            
            let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        marketButton.setAttributedTitle(attributedTitle, for: .normal)
    }
    

    func setupCurrencyViews() {
        toCurrencyView.layer.borderWidth = 1
        toCurrencyView.layer.borderColor = UIColor.lightGray.cgColor
        toCurrencyView.layer.cornerRadius = 5
        
        fromCurrencyView.layer.borderWidth = 1
        fromCurrencyView.layer.borderColor = UIColor.lightGray.cgColor
        fromCurrencyView.layer.cornerRadius = 5
        
        marketView.layer.cornerRadius = 25
        marketView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    
        marketView.clipsToBounds = true
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        // Constrain scroll view to the full screen
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Content view constraints inside scroll view
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            // Important: width equal to scroll view width
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }

}

