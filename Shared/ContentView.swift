//
//  ContentView.swift
//  Shared
//
//  Created by Tenzin Mahabir on 2021-01-23.
//

import SwiftUI

let primaryColor = Color.init(red: 120/255, green: 100/255, blue: 200/255, opacity: 1.0)

// Array with button titles for each
let buttonRows = [
    ["AC", "+/-", "%", "÷"],
    ["7", "8", "9", "×"],
    ["4", "5", "6", "−"],
    ["1", "2", "3", "+"],
    ["0", "0", ".", "="]
]

struct ContentView: View {
    
    
    // To hold final value of the evaluated expression
    @State var finalValue:String = "Calculator"
    
    // This holds the expression which has been entered by the user.
    @State var calExpression: [String] = ["Please input expression with buttons"]
    
    
    var body: some View {
        
        ZStack{
            
            
            Rectangle().foregroundColor(primaryColor).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Rectangle().padding(.top, 200.0).foregroundColor(Color.black).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
            
            VStack{
                Text(self.finalValue)
                    .font(Font.custom("HelveticaNeue-Thin", size: 78))
                    .padding(.top, 10.0)
                    .frame(idealWidth: 100, maxWidth: .infinity, idealHeight: 100, alignment: .center)
                    .foregroundColor(Color.white)
                
                // This text displayes the expression that the user has entered till now
                Text(flattenTheExpression(exps: calExpression))
                    .font(Font.custom("HelveticaNeue-Thin", size: 24))
                    .multilineTextAlignment(.leading)
                    .padding(.top, 30.0)
                    .frame(alignment: Alignment.bottomTrailing)
                    .foregroundColor(Color.white)
                
                Spacer()
                
            }
            
            VStack {
                
                    ForEach(buttonRows, id: \.self) { row in
                        HStack(alignment: .top, spacing: 0) {
                            Spacer(minLength: 13)
                            ForEach(row, id: \.self) { column in
                                Button(action: {
                                    //Action to be added later.
                                }, label: {
                                    Text(column)
                                        .font(.system(size: getFontSize(btnTxt: column)))
                                        .padding()
                                        .frame(idealWidth: 100, maxWidth: .infinity, idealHeight: 100, maxHeight: .infinity, alignment: .center)
                                })
                                .foregroundColor(Color.white)
                                .background(getBackground(str: column))
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).padding(.horizontal, 2.0)
                                
                            }
                            Spacer(minLength: 13)
                        }
                    }
            }
            .padding(.top, 200.2)
            
            
            
        }
        
        
    }
    
    // This function take in the expression array and return a string with all the items appended one after another.
    func flattenTheExpression(exps: [String]) -> String {
        
        var calExp = ""
        for exp in exps {
            calExp.append(exp)
        }
        
        return calExp
    }
    
    // Return differnt font sizes for operators and numbers.
    func getBackground(str:String) -> Color {
        
        if checkIfOperator(str: str) {
            return primaryColor
        } else if (str == "AC") || (str == "+/-") || (str == "%") {
            return Color.gray
        }
        return Color.blue
    }
    
    // Return differnt font sizes for operators and numbers.
    func getFontSize(btnTxt: String) -> CGFloat {
        
        if checkIfOperator(str: btnTxt) {
            return 50
        }
        return 24
        
    }
    
    // This function returns if the passed argument is a operator or not.
    func checkIfOperator(str:String) -> Bool {
        
        if str == "÷" || str == "×" || str == "−" || str == "+" || str == "=" {
            return true
        }
        
        return false
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
