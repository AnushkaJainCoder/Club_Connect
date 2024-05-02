import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Define properties
    let cellReuseIdentifier = "DayCell"
    let daysPerWeek = 7
    let cellSpacing: CGFloat = 2
    
    var collectionView: UICollectionView!
    var selectedDate: Date = Date()
    var monthLabel: UILabel!
    var dayLabels: [UILabel] = []
    var selectedDateTimeStackView: UIStackView!
    var selectedDateLabel: UILabel!
    var selectedTimeLabel: UILabel!
    var eventDetailsView: UIView!
    var eventDetailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up month label
        monthLabel = UILabel()
        monthLabel.textAlignment = .center
        monthLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.addSubview(monthLabel)
        
        // Set up day labels (M, T, W, Th, F, Sa, Su)
        for i in 0..<daysPerWeek {
            let dayLabel = UILabel()
            dayLabel.textAlignment = .center
            dayLabel.text = DateFormatter().shortWeekdaySymbols[i]
            dayLabels.append(dayLabel)
            view.addSubview(dayLabel)
        }
        
        // Set up collection view
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
        
        // Set up selected date and time stack view
        selectedDateTimeStackView = UIStackView()
        selectedDateTimeStackView.axis = .horizontal
        selectedDateTimeStackView.spacing = 5
        selectedDateTimeStackView.alignment = .center
        view.addSubview(selectedDateTimeStackView)
        
        // Set up selected date label
        selectedDateLabel = UILabel()
        selectedDateLabel.textAlignment = .center
        selectedDateLabel.font = UIFont.systemFont(ofSize: 16)
        selectedDateTimeStackView.addArrangedSubview(selectedDateLabel)
        
        // Set up selected time label
        selectedTimeLabel = UILabel()
        selectedTimeLabel.textAlignment = .center
        selectedTimeLabel.font = UIFont.systemFont(ofSize: 16)
        selectedDateTimeStackView.addArrangedSubview(selectedTimeLabel)
        
        // Set up event details view
        eventDetailsView = UIView()
        eventDetailsView.backgroundColor = .black
        
        view.addSubview(eventDetailsView)
        
        // Set up event details label
        eventDetailsLabel = UILabel()
        eventDetailsLabel.textAlignment = .center
        eventDetailsLabel.numberOfLines = 0
        eventDetailsLabel.font = UIFont.systemFont(ofSize: 16)
        eventDetailsView.addSubview(eventDetailsLabel)
        
        // Set up layout constraints
        setupConstraints()
        
        updateMonthLabel()
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // Return number of months or sections as needed
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return number of days in the selected month
        return numberOfDaysInMonth(for: selectedDate)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath)
        
        // Configure cell with day information
//        cell.backgroundColor = .blue
        cell.layer.cornerRadius = min(cell.frame.width, cell.frame.height) / 2 // Make it round
        
        // Example: Display day number
        let dayOfMonth = indexPath.item + 1
        let label = UILabel(frame: cell.contentView.bounds)
        label.textAlignment = .center
        label.text = "\(dayOfMonth)"
        cell.contentView.addSubview(label)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle selection of a day
        let dayOfMonth = indexPath.item + 1
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        let dateString = formatter.string(from: selectedDate)
        selectedDateLabel.text = "\(dayOfMonth) \(dateString)"
        
        // Set example time (replace with your logic)
        let selectedTime = "12:00 PM"
        selectedTimeLabel.text = selectedTime
        
        // Example event details
        let eventDetails = "Event Name: Example Event\nLocation: Example Location\nTime: 12:00 PM - 2:00 PM"
        eventDetailsLabel.text = eventDetails
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate cell size based on collection view width and number of days per week
        let width = (collectionView.bounds.width - CGFloat(daysPerWeek - 1) * cellSpacing) / CGFloat(daysPerWeek)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Set spacing between rows
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // Set padding for the section
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    // MARK: - Helper Functions
    
    func numberOfDaysInMonth(for date: Date) -> Int {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    func updateMonthLabel() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        monthLabel.text = formatter.string(from: selectedDate)
    }
    
    func setupConstraints() {
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        selectedDateTimeStackView.translatesAutoresizingMaskIntoConstraints = false
        eventDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
        // Month label constraints
        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            monthLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            monthLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            monthLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // Day label constraints
        for (index, label) in dayLabels.enumerated() {
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 20),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(index) * (view.frame.width / CGFloat(daysPerWeek))),
                label.widthAnchor.constraint(equalToConstant: view.frame.width / CGFloat(daysPerWeek))
            ])
        }
        
        // Collection view constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: dayLabels.first!.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: eventDetailsView.topAnchor, constant: -10)
        ])
        
        // Selected date and time stack view constraints
        NSLayoutConstraint.activate([
            selectedDateTimeStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectedDateTimeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectedDateTimeStackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            eventDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eventDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            eventDetailsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
        // Event details label constraints
        NSLayoutConstraint.activate([
            eventDetailsLabel.topAnchor.constraint(equalTo: eventDetailsView.topAnchor, constant: 0),
            eventDetailsLabel.leadingAnchor.constraint(equalTo: eventDetailsView.leadingAnchor, constant: 10),
            eventDetailsLabel.trailingAnchor.constraint(equalTo: eventDetailsView.trailingAnchor, constant: -10),
            eventDetailsLabel.bottomAnchor.constraint(equalTo: eventDetailsView.bottomAnchor, constant: 40)
        ])}
}

