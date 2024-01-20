//
//  Routines.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 20/11/2023.
//

import UIKit

protocol RoutinesVCDelegate: AnyObject {
    func changeTableView()
}

class RoutinesVC: GFDataLoadingVC {
    
    var daysButton = GYMPopUpButton()
    var tableView = UITableView(frame: .zero, style: .insetGrouped)
    var routine: [ExercisesByMuscle] = DailyRoutinesByMuscle.day1
    
    var dataSource: UITableViewDiffableDataSource<Muscle, ExerciseAssigned>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isAppFirstLaunch() {
            configureDB()
        }
        configureViewController()
        configureDaysButton()
        configureTablenView()
        configureDataSource()
        updateData(on: routine)
    }
    
    
    func isAppFirstLaunch() -> Bool {
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: "isAppFirstLaunch") {
            print("App already launched")
            return false
        } else {
            defaults.set(true, forKey: "isAppFirstLaunch")
            print("App launched first time")
            return true
        }
    }
    
    
    func configureDB() {
        for exercise in Constants.listOfAllExercises {
        SQLiteManager.shared.insert(name: exercise.name, weight: 0)
        }
    }
    
    
    func configureViewController(){
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .secondarySystemBackground
    }
    
    
    func configureDaysButton() {
        daysButton.delegate = self
        daysButton.tintColor = .label
        daysButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        daysButton.configuration?.imagePadding = 50
        daysButton.semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
    }
    
    func configureTablenView() {
        let headerTableView = TableViewHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 87), button: daysButton)

        view.addSubview(tableView)
        tableView.tableHeaderView = headerTableView
        tableView.delegate = self
        tableView.sectionHeaderHeight = 30
        tableView.sectionFooterHeight = 5
        tableView.alwaysBounceVertical = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ExerciseCell.self, forCellReuseIdentifier: ExerciseCell.reuseID)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),      
        ])
    }
    
    
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Muscle, ExerciseAssigned>(tableView: tableView, cellProvider: { (tableView, indexPath, exercise) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseCell.reuseID, for: indexPath) as! ExerciseCell
            cell.set(exercise: exercise)
            return cell
        })
        dataSource.defaultRowAnimation = .fade
    }
    
    
    func updateData(on exercises: [ExercisesByMuscle]) {
        var snapshot = NSDiffableDataSourceSnapshot<Muscle, ExerciseAssigned>()

        for exercisesByMuscle in exercises {
            snapshot.appendSections([exercisesByMuscle.muscle])
            snapshot.appendItems(exercisesByMuscle.exercises)
        }
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}



extension RoutinesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let exercise = routine[indexPath.section].exercises[indexPath.row]
        let destVC =  ExerciseInfoVC(exerciseSelected: exercise)
        let navController   = UINavigationController(rootViewController: destVC)

        if let sheet = navController.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        
        present(navController, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let markAsDone = UIContextualAction(style: .normal, title: "Realizado") { [weak self] (action, view, success) in
            guard let self else { return }
        
            routine[indexPath.section].exercises.remove(at: indexPath.row)
            if routine[indexPath.section].exercises.isEmpty { routine.remove(at: indexPath.section) }
            updateData(on: routine)
            
            if routine.isEmpty { self.showEmptyStateView(with: "¡Felicidades!", with: "Completaste la rutina del día. Sigue así.", in: tableView) }
        }
        markAsDone.backgroundColor = .systemGreen
        let swipeActions = UISwipeActionsConfiguration(actions: [markAsDone])
        return swipeActions
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)
        label.textColor = .secondaryLabel
        label.text = "   " + routine[section].muscle.rawValue.uppercased()
        return label
    }
}


extension RoutinesVC: RoutinesVCDelegate {
    
    func changeTableView() {
        switch daysButton.currentTitle! {
        case "Día 1  " :
            routine = DailyRoutinesByMuscle.day1
            break
        case "Día 2  ":
            routine = DailyRoutinesByMuscle.day2
            break
        case "Día 3  ":
            routine = DailyRoutinesByMuscle.day3
            break
        case "Día 4  ":
            routine = DailyRoutinesByMuscle.day4
            break
        default:
            break
        }
        if emptyStateView != nil {
            emptyStateView.removeFromSuperview()
        }
        tableView.didMoveToSuperview()
        updateData(on: routine)
    }
}
