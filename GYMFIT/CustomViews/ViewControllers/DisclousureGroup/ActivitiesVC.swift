//
//  ActivitiesVC.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 27/01/2024.
//

import UIKit
protocol ActivitiesVCDelegate: AnyObject {
    func updateConstraints(activitiesHeight: CGFloat)
}

class ActivitiesVC: DisclousureTableView {

    var plans = ["Actividades", "  Morón", "  Belgrano", "  Obelisco", "  Olivos", "  Flores"]
    weak var delegate: ActivitiesVCDelegate!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PlanCell.self, forCellReuseIdentifier: PlanCell.reuseID)
    }

    
    func expandAndCollapse() {
        var indexPaths = [IndexPath]()
        for row in 1...plans.count-1 {
            let indexPath = IndexPath(row: row, section: 0)
            indexPaths.append(indexPath)
        }
        
        tableView.beginUpdates()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! HeaderCell
        cell.changeChevron()
        if isExpandableCellsHidden {
            tableView.insertRows(at: indexPaths, with: .fade)
        } else {
            tableView.deleteRows(at: indexPaths, with: .top)
        }
        isExpandableCellsHidden.toggle()
        tableView.endUpdates()
        delegate.updateConstraints(activitiesHeight: tableView.contentSize.height)
    }
}


extension ActivitiesVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isExpandableCellsHidden {
            return 1
        }
        else {
            return plans.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = HeaderCell()
            cell.clipsToBounds = true
            cell.backgroundColor = .secondarySystemGroupedBackground
            cell.set(plan: plans[indexPath.row])
            return cell
            
        } else {
            let cell = PlanCell()
            cell.clipsToBounds = true
            cell.backgroundColor = .secondarySystemGroupedBackground
            cell.set(plan: plans[indexPath.row])
            return cell
        }
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            expandAndCollapse()
        } else {
            expandAndCollapse()
        }
    }
}
