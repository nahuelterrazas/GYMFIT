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
    
    let daysButton = GYMPopUpButton()
    var tableView = UITableView(frame: .zero, style: .insetGrouped)
    var routine: [Muscle] = DailyRoutines.day1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTablenView()
    }

    
    func configureViewController(){
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .secondarySystemBackground
    }
    
    
    func configureTablenView() {
        let headerTableView = TableViewHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 87), button: daysButton)
        daysButton.delegate = self

        view.addSubview(tableView)
        tableView.tableHeaderView = headerTableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ExerciseCell.self, forCellReuseIdentifier: ExerciseCell.reuseID)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),      
        ])
    }
}


extension RoutinesVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        routine[section].title
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        routine.count
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        routine[section].exercises.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseCell.reuseID, for: indexPath) as! ExerciseCell
        let exercise = routine[indexPath.section].exercises[indexPath.row]
        cell.set(exercise: exercise)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let markAsDone = UIContextualAction(style: .normal, title: "Realizado") { [weak self] (action, view, success) in
            guard let self else { return }
        
            routine[indexPath.section].exercises.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
            if routine[indexPath.section].exercises.isEmpty {
                routine.remove(at: indexPath.section)
                tableView.deleteSections([indexPath.section], with: .automatic)
            }
            
            if routine.isEmpty {
                self.showEmptyStateView(with: "¡Felicidades!", with: "Completaste la rutina del día. Sigue así.", in: tableView)
            }
        }
        markAsDone.backgroundColor = .systemGreen
        let swipeActions = UISwipeActionsConfiguration(actions: [markAsDone])
        return swipeActions
    }
}


extension RoutinesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let exercise = routine[indexPath.section].exercises[indexPath.row]
        let destVC =  ExerciseInfoVC(title: exercise.title, image: exercise.image)
        
        if let sheet = destVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        present(destVC, animated: true)
    }
}


extension RoutinesVC: RoutinesVCDelegate {
    func changeTableView() {
        switch daysButton.currentTitle! {
        case "Día 1" :
            routine = DailyRoutines.day1
            break
        case "Día 2":
            routine = DailyRoutines.day2
            break
        case "Día 3":
            routine = DailyRoutines.day3
            break
        case "Día 4":
            routine = DailyRoutines.day4
            break
        default:
            break
        }
        if emptyStateView != nil {
            emptyStateView.removeFromSuperview()
        }
        tableView.didMoveToSuperview()
        tableView.reloadData()
    }
}
