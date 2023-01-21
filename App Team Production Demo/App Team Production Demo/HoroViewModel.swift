//
//  HoroViewModel.swift
//  App Team Production Demo
//
//  Created by Josh Myatt on 1/18/23.
//

import Foundation

public class HoroViewModel: ObservableObject {
    var sign: String
    var day: String
    @Published var horoResponse = HoroResponse(date_range: "Mar 21 - Apr 20", current_date: "January 18, 2023", description: "Wasting precious hours over things that are either unimportant or out of your control (or possibly both)? Well, waste no longer. Take a few deep breaths and shake it off. You've got bigger fish to fry.", compatibility: "Pisces", mood: "Relaxed", color: "Yellow", lucky_number: "77", lucky_time: "6pm")

    let horoAsyncAwait: HoroAsyncAwait

    init(horoAsyncAwait: HoroAsyncAwait, sign: String, day: String) {
        self.sign = sign
        self.day = day
        self.horoAsyncAwait = horoAsyncAwait

        refresh()
    }

    public func refresh() {
        Task {
            let activeResponse = try await horoAsyncAwait.requestHoro(sign: sign, day: day)
            DispatchQueue.main.async {
                self.horoResponse = HoroResponse(date_range: activeResponse.date_range, current_date: activeResponse.current_date, description: activeResponse.description, compatibility: activeResponse.compatibility, mood: activeResponse.mood, color: activeResponse.color, lucky_number: activeResponse.lucky_number, lucky_time: activeResponse.lucky_time)
            }
        }
    }
}
