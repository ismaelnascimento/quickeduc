import Foundation
import SwiftUI

extension Date {
    init?(_ value: String) {
        do {
            self = try Date(value, strategy: .dateTime.day().month().year())
        } catch {
            print(error)
            return nil
        }
    }
    
}

extension Calendar {
  private var currentDate: Date { return Date() }

  func isDateInThisWeek(_ date: Date) -> Bool {
    return isDate(date, equalTo: currentDate, toGranularity: .weekOfYear)
  }

  func isDateInThisMonth(_ date: Date) -> Bool {
    return isDate(date, equalTo: currentDate, toGranularity: .month)
  }

  func isDateInNextWeek(_ date: Date) -> Bool {
    guard let nextWeek = self.date(byAdding: DateComponents(weekOfYear: 1), to: currentDate) else {
      return false
    }
    return isDate(date, equalTo: nextWeek, toGranularity: .weekOfYear)
  }

  func isDateInNextMonth(_ date: Date) -> Bool {
    guard let nextMonth = self.date(byAdding: DateComponents(month: 1), to: currentDate) else {
      return false
    }
    return isDate(date, equalTo: nextMonth, toGranularity: .month)
  }

  func isDateInFollowingMonth(_ date: Date) -> Bool {
    guard let followingMonth = self.date(byAdding: DateComponents(month: 2), to: currentDate) else {
      return false
    }
    return isDate(date, equalTo: followingMonth, toGranularity: .month)
  }
}
