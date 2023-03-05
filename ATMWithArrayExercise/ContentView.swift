//
//  ContentView.swift
//  ATMWithArrayExercise
//
//  Created by Pyi Moe Than on 3/4/23.
//

import SwiftUI

struct ContentView: View {
    //Define state variable
    @State private var amountStr = ""
    @State private var totalBalance = 0.00
    @State private var transactions = [String]()
    @State private var displayReport = ""
    
    var body: some View {
        VStack{
            Text("ATM")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .padding()
            TextField("Amount: 0.0",text: $amountStr)
                .padding()
            HStack{
                Button("Deposit"){
                    //2. convert amount from text to double value
                    totalBalance = totalBalance + Double(amountStr)!
                    transactions.append("Deposit: \(amountStr)")
                    
                    
                }
                .buttonStyle(.borderedProminent)
                .padding()
                Button("Withdraw"){
                    totalBalance = totalBalance - Double(amountStr)!
                    transactions.append("Withdraw: \(amountStr)")
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
            VStack{
                Text("The account balance:$\(totalBalance.formatted()) ")
                    .padding()
                ForEach (transactions, id: \.self){
                    transaction in
                    Text(transaction)
                    
                }
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
