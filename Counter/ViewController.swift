//
//  ViewController.swift
//  Counter
//
//  Created by Anastasiia Ki on 15.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var storyTextView: UITextView!
    
    private var count: Int = 0 {
        willSet(number) {
            counterLabel.text = "Значение счётчика: \(number)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = "Значение счётчика: \(count)"
        storyTextView.text = "История изменений:"
        
    }

    @IBAction private func increase(_ sender: Any) {
        count += 1
        addItemStory(action: "increase")
    }
    
    @IBAction private func decrease(_ sender: Any) {
        if count >= 1 {
            count -= 1
            addItemStory(action: "decrease")
        } else {
            addItemStory(action: "zero")
        }
    }
    
    @IBAction private func reset(_ sender: Any) {
        count = 0
        addItemStory(action: "reset")
    }
    
    private func addItemStory(action: String){
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

