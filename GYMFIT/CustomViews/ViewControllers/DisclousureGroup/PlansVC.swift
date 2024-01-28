//
//  PlansVC.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 27/01/2024.
//

import UIKit

protocol PlansVCDelegate: AnyObject {
    func updateConstraints(plansHeight: CGFloat)
}

class PlansVC: DisclousureTableView {

    var plans = ["Plan 2", "  Plan 1", "  Plan 2", "  Plan 3"]
    weak var delegate: PlansVCDelegate!

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
        delegate.updateConstraints(plansHeight: tableView.contentSize.height)
    }
    
    func expandAndCollapseSameImage() {
        var indexPaths = [IndexPath]()
        for row in 1...plans.count-1 {
            let indexPath = IndexPath(row: row, section: 0)
            indexPaths.append(indexPath)
        }
        
        tableView.beginUpdates()

        if isExpandableCellsHidden {
            tableView.insertRows(at: indexPaths, with: .fade)
        } else {
            tableView.deleteRows(at: indexPaths, with: .top)
        }
        isExpandableCellsHidden.toggle()
        tableView.endUpdates()
        delegate.updateConstraints(plansHeight: tableView.contentSize.height)
    }
}


extension PlansVC: UITableViewDataSource, UITableViewDelegate {

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
            tableView.beginUpdates()
            plans[0] = "Plan \(indexPath.row)"
            tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
            tableView.endUpdates()
            expandAndCollapseSameImage()
        }
    }
}
