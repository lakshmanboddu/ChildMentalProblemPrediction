//
//  TestViewController.swift
//  ChildMentalProblemPrediction
//
//  Created by Lakshman Babu Boddu on 25/11/18.
//  Copyright © 2018 Lakshman Babu Boddu Lakshman Babu Boddu. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblCount : UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    let questions = Question.buildQuestions(from: "Questions")
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buildQuestionPreviewer()
        prepareQuestion(at: currentIndex)
    }
    
    func buildQuestionPreviewer(){
        questions.forEach { (question) in
            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            containerView.backgroundColor = UIColor.clear

            stackView.addArrangedSubview(containerView)
            NSLayoutConstraint.activate([
                            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
                            ])

            let spacing : CGFloat = 20.0
            let height : CGFloat = 50.0
            var view : UIView?
            question.options.forEach({ (option) in

                let optionview = OptionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
                optionview.translatesAutoresizingMaskIntoConstraints = false
                optionview.lblTitle.text = option.title
                optionview.isSelected = false
                containerView.addSubview(optionview)
                
                NSLayoutConstraint.activate([
                    optionview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                    optionview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                    optionview.heightAnchor.constraint(equalToConstant: height),
                    optionview.topAnchor.constraint(equalTo: view != nil ? view!.bottomAnchor : containerView.topAnchor, constant: spacing)
                    ])
                view = optionview
            })
        }
    }
    
    func prepareQuestion(at index: Int){
        let question = questions[index]
        
    }
    @IBAction func btnNextPressed(_ sender: Any) {
    }
    
}
