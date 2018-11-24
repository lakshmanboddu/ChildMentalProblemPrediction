//
//  Question.swift
//  ChildMentalProblemPrediction
//
//  Created by Lakshman Babu Boddu on 25/11/18.
//  Copyright © 2018 Lakshman Babu Boddu Lakshman Babu Boddu. All rights reserved.
//

import UIKit

struct Option {
    let title : String
    let value : Int
    static func buildOptions(from arr: Array<Dictionary<String, Any>>) -> [Option]{
        return arr.map { (dic) -> Option in
            return Option(title: dic["title"] as! String, value: dic["value"] as! Int)
        }
    }
}

struct Question {
  
    let question : String
    let options : [Option]
    
    init(info : Dictionary<String,Any>) {
        question = info["question"] as! String
        options = Option.buildOptions(from: info["options"] as! Array<Dictionary<String, Any>>)
        
    }
    
    static func buildQuestions(from plistName : String) -> [Question]{
        let url = Bundle.main.url(forResource: plistName, withExtension: "plist")!
        let data = try! Data(contentsOf: url)
        let plist = try! PropertyListSerialization.propertyList(from: data, options: [], format: nil)
        guard let questions = plist as? Array<Dictionary<String, Any>> else{
            return []
        }
        return questions.map { (dic) -> Question in
            
            let question = Question(info: dic)
            return question
        }
       
    }
    
}
