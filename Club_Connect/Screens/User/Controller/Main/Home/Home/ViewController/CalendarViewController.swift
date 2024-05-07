//
//  ScannerViewController.swift
//  Club_Connect
//
//  Created by student on 02-05-2024.
//

//import UIKit

import FSCalendar
import UIKit

class CalendarViewControllers:UIViewController, FSCalendarDelegate, FSCalendarDataSource{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCalendar()
        view.backgroundColor = .white
    }
    
    private func createCalendar() {
        let calendar = FSCalendar(frame: CGRect(x: 10, y: 40, width: view.frame.size.width, height: 800))
        calendar.dataSource = self
        calendar.delegate = self
        view.addSubview(calendar)
    }
    
    // MARK: - FSCalendarDelegate
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        print("Selected date: \(formatter.string(from: date))")
    }
}
