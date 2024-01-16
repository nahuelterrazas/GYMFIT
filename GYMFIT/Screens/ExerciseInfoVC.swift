//
//  ExerciseInfoVC.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 04/01/2024.
//

import UIKit

class ExerciseInfoVC: UIViewController {
    
    
    let weights: [Double] = [2.5, 5, 7.5, 10, 12.5, 15, 17.5, 20, 22.5, 25, 27.5, 30, 32.5, 35, 37.5, 40, 42.5, 45, 47.5, 50,
                          52.5, 55, 57.5, 60, 62.5, 65, 67.5, 70, 72.5, 75, 77.5, 80, 82.5, 85, 87.5, 90, 92.5, 95, 97.5, 100]
    let imageView = UIImageView()
    let label = UILabel()
    let pickerView = UIPickerView()
    var selectedRow = 0
    let stackView = UIStackView()
    var selectedExercise: ExerciseAssigned!

    
    init(exerciseSelected: ExerciseAssigned) {
        super.init(nibName: nil, bundle: nil)
        selectedExercise = exerciseSelected
        navigationItem.title = exerciseSelected.exercise.name
        imageView.image = exerciseSelected.exercise.image
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureImageView()
        if selectedExercise.exercise.muscle != "Abdominales" {
            configureStack()
            configureLabel()
            configurePickerView()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        getSavedWeight()
    }
    

    func configure() {
        view.backgroundColor = .systemBackground
        let dismissButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = dismissButton
    }

    
    func configureImageView() {
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    
    func configureStack() {
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(pickerView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 125)
        ])
    }
    
    
    func configureLabel() {
        label.text = "Peso: "
    }
    
    
    func configurePickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(selectedRow, inComponent: 0, animated: true)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pickerView.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    
    @objc func dismissVC() {
        selectedRow = pickerView.selectedRow(inComponent: 0)
        saveWeight()
        dismiss(animated: true)
    }
    
    
    func saveWeight() {
        SQLiteManager.shared.update(weight: pickerView.selectedRow(inComponent: 0), where: selectedExercise.exercise.name)
    }
    
    
    func getSavedWeight() {
        let data = SQLiteManager.shared.readWhere(name: selectedExercise.exercise.name)
        selectedExercise = convertFromSQL(data: data.first!)
        pickerView.selectRow(selectedExercise.weight, inComponent: 0, animated: true)
        
    }
    
    
    func convertFromSQL(data: ExerciseSQL) -> ExerciseAssigned {
        let exercise = createExercise(name: data.name)
        let exerciseAssigned = ExerciseAssigned(exercise: exercise, serires: selectedExercise.serires, reps: selectedExercise.reps, weight: data.weightRow)
        return exerciseAssigned
    }
    
    
    func createExercise(name: String) -> Exercise {
        let exercise = Constants.listOfAllExercises.filter { exercise in
            exercise.name == name
        }
        return exercise.first!
    }
}


extension ExerciseInfoVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weights.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(weights[row]) kg"
    }
}
