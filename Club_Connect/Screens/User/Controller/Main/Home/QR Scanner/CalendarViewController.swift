import UIKit
import EventKit

class CalendarConfigViewController: UIViewController {

    let eventStore = EKEventStore()
    let eventsLabel = UILabel()
    
    override func loadView() {
        super.loadView()
        
        // Configure events label
        eventsLabel.numberOfLines = 0
        eventsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(eventsLabel)
        
        NSLayoutConstraint.activate([
            eventsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            eventsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            eventsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Request calendar access permission
        eventStore.requestAccess(to: .event) { (granted, error) in
            if granted && error == nil {
                // Access granted, you can now access the calendar
                DispatchQueue.main.async {
                    self.createEvent()
                    self.fetchEvents()
                }
            } else {
                // Access denied, handle accordingly
                print("Permission denied to access calendar")
            }
        }
    }
    
    func createEvent() {
        // Create event
        let event = EKEvent(eventStore: eventStore)
        event.title = "Meeting"
        event.startDate = Date()
        event.endDate = Date().addingTimeInterval(3600)
        event.calendar = eventStore.defaultCalendarForNewEvents
        // Save event
        do {
            try eventStore.save(event, span: .thisEvent)
            print("Event saved successfully")
        } catch {
            print("Failed to save event: \(error.localizedDescription)")
        }
    }
    
    func fetchEvents() {
        // Fetch events
        let startDate = Date()
        let endDate = Calendar.current.date(byAdding: .month, value: 1, to: startDate)
        
        let predicate = eventStore.predicateForEvents(withStart: startDate, end: endDate!, calendars: nil)
        let events = eventStore.events(matching: predicate)
        
        var eventsText = ""
        for event in events {
            eventsText += "Event Title: \(event.title ?? ""), Start Date: \(event.startDate), End Date: \(event.endDate)\n\n"
        }
        DispatchQueue.main.async {
            self.eventsLabel.text = eventsText
        }
    }
}
