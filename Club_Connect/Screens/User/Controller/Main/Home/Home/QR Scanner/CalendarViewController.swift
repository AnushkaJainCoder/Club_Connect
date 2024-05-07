//
//  CalendarViewController.swift
//  Club_Connect
//
//  Created by student on 06-05-2024.
//

import UIKit
import FSCalendar
import UIKit
class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    var eventsData: [String: (name: String, time: String)] = [
        "2024-05-08": (name: "Shoe Fest", time: "10:00 AM - 5:00 PM"),
        "2024-05-09": (name: "Beats by DJ Rocky", time: "8:00 PM - 12:00 AM"),
        "2024-05-10": (name: "K Drame by c2s2", time: "7:00 PM - 10:00 PM"),
        "2024-05-11": (name: "Classic by c2s2", time: "7:00 PM - 10:00 PM"),
        "2024-05-12": (name: "Classic by c2s2", time: "7:00 PM - 10:00 PM"),
        "2024-05-13": (name: "Classic by c2s2", time: "7:00 PM - 10:00 PM"),
        "2024-05-14": (name: "Classic by c2s2", time: "7:00 PM - 10:00 PM"),
        "2024-05-15": (name: "Classic by c2s2", time: "7:00 PM - 10:00 PM"),
        "2024-05-16": (name: "Classic by c2s2", time: "7:00 PM - 10:00 PM"),
        "2024-05-17": (name: "Classic by c2s2", time: "7:00 PM - 10:00 PM"),
        "2024-05-18": (name: "Classic by c2s2", time: "7:00 PM - 10:00 PM"),
        "2024-05-19": (name: "Classic by c2s2", time: "7:00 PM - 10:00 PM"),
        
        // Add more events as needed
    ]

    var eventStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        createCalendar()
        setupEventStackView()
        view.backgroundColor = .black // Set view background color to black
    }

    private func createCalendar() {
        let calendar = FSCalendar(frame: CGRect(x: 10, y: 100, width: view.frame.size.width - 20, height: 400))
        calendar.dataSource = self
        calendar.delegate = self
        calendar.backgroundColor = .black // Set calendar background color to black
        calendar.appearance.headerTitleColor = .white // Set header title color to white
        calendar.appearance.weekdayTextColor = .white // Set weekday text color to white
        calendar.appearance.titleDefaultColor = .white // Set default title color to white
        calendar.appearance.selectionColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0) // Set selection color to a dark gray
        calendar.appearance.todayColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0) // Set today color to a darker gray
        calendar.appearance.borderRadius = 0.5 // Set border radius to make it more squared
        calendar.appearance.borderDefaultColor = .clear // Clear border color
        calendar.appearance.eventDefaultColor = .yellow // Set event dot color
        
        view.addSubview(calendar)
    }

    private func setupEventStackView() {
        eventStackView = UIStackView(frame: CGRect(x: 10, y: 500, width: view.frame.size.width - 20, height: 50))
        eventStackView.axis = .horizontal
        eventStackView.distribution = .equalSpacing
        eventStackView.alignment = .center
        eventStackView.spacing = 10
        
        let eventNameLabel = UILabel()
        eventNameLabel.textAlignment = .left
        eventNameLabel.textColor = .white // Set label text color to white
        eventNameLabel.numberOfLines = 1
        eventNameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal) // Ensure the label does not compress
        eventStackView.addArrangedSubview(eventNameLabel)
        
        let eventTimeLabel = UILabel()
        eventTimeLabel.textAlignment = .right
        eventTimeLabel.textColor = .white // Set label text color to white
        eventTimeLabel.numberOfLines = 1
        eventTimeLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal) // Ensure the label does not compress
        eventStackView.addArrangedSubview(eventTimeLabel)
        
        view.addSubview(eventStackView)
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: date)
        
        if let eventData = eventsData[dateString] {
            // Set event name and event time labels
            if let eventNameLabel = eventStackView.arrangedSubviews.first as? UILabel {
                eventNameLabel.text = eventData.name
            }
            if let eventTimeLabel = eventStackView.arrangedSubviews.last as? UILabel {
                eventTimeLabel.text = eventData.time
            }
        } else {
            // If no event found for the selected date, clear the labels
            if let eventNameLabel = eventStackView.arrangedSubviews.first as? UILabel {
                eventNameLabel.text = "No Event"
            }
            if let eventTimeLabel = eventStackView.arrangedSubviews.last as? UILabel {
                eventTimeLabel.text = ""
            }
        }
    }
}
