//
//  DailyView.swift
//  App Team Production Demo
//
//  Created by Josh Myatt on 1/18/23.
//

import SwiftUI

struct DailyView: View {
    @ObservedObject var vm: HoroViewModel
    var body: some View {
        VStack{
            Text("Results")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
                .padding(.bottom, -10)
            HStack{
                Text("Mood:")
                    .fontWeight(.bold)
                    .font(.title3)
                Text(vm.horoResponse.mood)
                    .font(.title3)
                Text("Color:")
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.leading)
                Text(vm.horoResponse.color)
                    .font(.title3)
            }
            .padding(.top)
            HStack{
                Text("Lucky Number:")
                    .fontWeight(.bold)
                    .font(.title3)
                Text(vm.horoResponse.lucky_number)
                    .font(.title3)
                Text("Lucky Time:")
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.leading)
                Text(vm.horoResponse.lucky_time)
                    .font(.title3)
            }
            .padding(.top)
            Text("Description:")
                .padding(.top)
                .fontWeight(.bold)
                .font(.title3)
            Text(vm.horoResponse.description)
                .multilineTextAlignment(.center)
                .font(.title3)
                .padding(.leading)
                .padding(.trailing)
            Spacer()
            
            
        }
        .padding(.leading, 15)
        .padding(.trailing, 15)
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView(vm: HoroViewModel(horoAsyncAwait: HoroAsyncAwait(), sign: "aries", day: "today"))
    }
}
