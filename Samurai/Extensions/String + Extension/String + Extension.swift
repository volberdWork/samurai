import Foundation

extension String {
    func localized() -> String {
        let value = NSLocalizedString(self, comment: "")
        if value != self || NSLocale.preferredLanguages.first == "Base" {
            return value
        }
        
        guard
            let path = Bundle.main.path(forResource: "Base", ofType: "lproj"),
            let bundle = Bundle(path: path)
        else { return value }
        return NSLocalizedString(self, bundle: bundle, comment: "")
    }
    
    func digits() -> String {
           return components(separatedBy: CharacterSet.decimalDigits.inverted)
               .joined()
       }
    
    func createDateObjectWithTime(format: String = "HH:mm") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Locale.current.identifier)
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        guard let dateObjectWithTime = dateFormatter.date(from: self) else { return nil }

        return dateObjectWithTime
    }
}
