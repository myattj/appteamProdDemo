//
//  CollectionView.swift
//  App Team Production Demo
//
//  Created by Josh Myatt on 1/18/23.
//

import SwiftUI

struct CollectionView: View {
    @State var sign: String = "Aries"
    @State var day: String = "Today"
    var body: some View {
        VStack{
            Text("\(day)'s Horoscope")
                .font(.largeTitle)
                .padding(.top)
                .fontWeight(.bold)
            Text(HoroUtils.emojiMap[sign]!)
                .padding(.bottom, 1)
                .font(.system(size:55))
            HStack{
                VStack{
                    Text("Select Your Sign")
                        .font(.title3)
                        .padding(.bottom, -10)
                    Picker(".", selection: $sign) {
                        ForEach(HoroUtils.signs, id: \.self) {
                            Text($0)
                        }
                    }
                }.padding(.trailing, 30)
                VStack{
                    Text("Select Your Day")
                        .font(.title3)
                        .padding(.bottom, -10)
                    Picker(".", selection: $day) {
                        ForEach(HoroUtils.days, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            Divider()
                .padding(.top)
            DailyView(vm: HoroViewModel(horoAsyncAwait: HoroAsyncAwait(), sign: sign, day: day))
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
