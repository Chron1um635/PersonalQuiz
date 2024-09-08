//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    private var dogCount = 0
    private var catCount = 0
    private var rabbitCount = 0
    private var turtleCount = 0
    private var maxCount = 0
    private var animalAnswer: Animal!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton.toggle()
        findTheAnswer()
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

private extension ResultViewController {
    func findTheAnswer() {
        for answer in answers {
            switch answer.animal {
            case .dog:
                dogCount += 1
                desideAnimal(animal: .dog, count: dogCount)
            case .cat:
                catCount += 1
                desideAnimal(animal: .cat, count: catCount)
            case .turtle:
                turtleCount += 1
                desideAnimal(animal: .turtle, count: turtleCount)
            case .rabbit:
                rabbitCount += 1
                desideAnimal(animal: .rabbit, count: rabbitCount)
            }
        }
        resultLabel.text = "Вы - \(animalAnswer.rawValue)"
        descriptionLabel.text = animalAnswer.definition
    }
    func desideAnimal(animal: Animal, count: Int) {
        if count > maxCount {
            animalAnswer = animal
            maxCount = count
        }
    }
}
