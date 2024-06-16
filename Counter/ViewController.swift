//
//  ViewController.swift
//  Counter
//
//  Created by Anastasiia Ki on 15.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var storyTextView: UITextView!
    
    var count: Int = 0 {
        willSet(number) {
            counterLbl.text = "Значение счётчика: \(number)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLbl.text = "Значение счётчика: \(count)"
        storyTextView.text = "История изменений:"
        
    }

    @IBAction func increaseBtn(_ sender: Any) {
        count += 1
        addItemStory(action: "increase")
    }
    
    @IBAction func decreaseBtn(_ sender: Any) {
        if count >= 1 {
            count -= 1
            addItemStory(action: "decrease")
        } else {
            addItemStory(action: "zero")
        }
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        count = 0
        addItemStory(action: "reset")
    }
    
    func addItemStory(action: String){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm:ss"
        let dateTime = dateFormatter.string(from: date)
        
        switch action {
        case "increase":
            storyTextView.text += "\n\(dateTime): значение изменено на +1"
        case "decrease":
            storyTextView.text += "\n\(dateTime): значение изменено на -1"
        case "reset":
            storyTextView.text += "\n\(dateTime): значение сброшено"
        case "zero":
            storyTextView.text += "\n\(dateTime): попытка уменьшить значение счётчика ниже 0"
        default:
            break
        }
    }
    
}

