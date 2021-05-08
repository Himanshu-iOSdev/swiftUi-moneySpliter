//
//  ContentView.swift
//  AmountSplitSwiftUI
//
//  Created by Himanshu Kesharwani on 07/05/21.
//

import SwiftUI

struct ContentView: View {
  @State private var checkoutAmount = ""
  @State private var numberOfPerson = 0
  @State private var tipPercentage = 0
  
  let tipPriceArray = [5,10,15,20,25,0]
  var totalPerPerson: Double {
    let personCount = Double(numberOfPerson + 2)
    let tipSelected = Double(tipPriceArray[tipPercentage])
    let orderAmount = Double(checkoutAmount) ?? 0
    
    let tipAmount = orderAmount/100 * tipSelected
    let totalPrice = orderAmount + tipAmount
    let amountPerPerson = totalPrice/personCount
    return amountPerPerson
  }
  
    var body: some View {
      NavigationView{
      Form{
        Section{
          TextField("Enter amount", text: $checkoutAmount).keyboardType(.numberPad)
        }
        
        Section{
          Picker("Pick person to split amount", selection: $numberOfPerson) {
            ForEach(2 ..< 100) {
              Text("\($0) Person")
            }
          }
        }
        
        Section(header: Text("How much tip you want to leave?").textCase(.none)) {
          Picker("", selection: $tipPercentage) {
            ForEach(0 ..< tipPriceArray.count) {
              Text("\(tipPriceArray[$0])%")
            }
          }.pickerStyle(SegmentedPickerStyle())
        }
        
        Section{
          Text("Total amount per person  = $\(totalPerPerson, specifier: "%.2f")")
        }
        
       
        
      }
        
      .navigationBarTitle("WeSplit", displayMode: .inline)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
