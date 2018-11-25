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
    var lastSeletecdOption : OptionView?
    
    let questions = Question.buildQuestions(from: "Questions")
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buildQuestionPreviewer()
        prepareQuestion(at: currentIndex)
        btnNext.layer.borderColor = UIColor.white.cgColor
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
                optionview.option = option
                optionview.addTarget(self, action: #selector(optionPressed(_:)), for: .touchUpInside)
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
        guard index < questions.count else {
            var arrVal : [Double] = []
            questions.forEach { (question) in
                question.options.forEach({ (option) in
                    if option.selected{
                        arrVal.append(Double(option.value))
                    }
                })
            }
            let outputVc = self.storyboard?.instantiateViewController(withIdentifier: "OutputViewController") as! OutputViewController
            outputVc.showOuptput(values: arrVal)
            self.navigationController?.pushViewController(outputVc, animated: true)
           
            return
        }
        let title =  index < (questions.count - 1) ? "Next Question" : "Done"
        btnNext.setTitle(title, for: .normal)
        let question = questions[index]
        lblCount.text = "\(index + 1) of \(questions.count)"
        lblQuestion.text = question.question
        lastSeletecdOption = nil
        let width = scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: width * CGFloat(index), y:  0.0), animated: true)
    }
    
    @objc
    func optionPressed(_ sender: OptionView){
        lastSeletecdOption?.isSelected = false
        lastSeletecdOption = sender
        lastSeletecdOption?.isSelected = true
        
    }
    
    @IBAction func btnNextPressed(_ sender: Any) {
        guard lastSeletecdOption != nil else {
            return
        }
        currentIndex = currentIndex + 1;
        prepareQuestion(at: currentIndex);
    }
    
}
