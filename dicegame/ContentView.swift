import SwiftUI

struct ContentView: View {
    @State private var diceValue1 = Int.random(in: 1...6)
    @State private var diceValue2 = Int.random(in: 1...6)
    @State private var balance1 = 100
    @State private var balance2 = 100
    @State private var betAmount1 = ""
    @State private var betAmount2 = ""
    @State private var chosenValue1 = 1
    @State private var chosenValue2 = 1
    @State private var selectedTheme = "Classic"
    
    var body: some View {
        ZStack {
            Color(selectedTheme == "Classic" ? .white : .black)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Picker("Theme", selection: $selectedTheme) {
                    Text("Classic").tag("Classic")
                    Text("Neon").tag("Neon")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                HStack {
                    VStack {
                        Text("Player 1")
                        Text("Balance: \(balance1)")
                        TextField("Bet amount", text: $betAmount1)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .foregroundColor(selectedTheme == "Classic" ? .black : .white)
                            .background(selectedTheme == "Classic" ? Color.white : Color.black)
                            .padding()
                        Picker("Chosen value", selection: $chosenValue1) {
                            ForEach(1...6, id: \.self) { number in
                                Text("\(number)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        Image(systemName: "die.face.\(diceValue1)")
                            .font(.system(size: 100))
                    }
                    .foregroundColor(selectedTheme == "Classic" ? .black : .white)
                    
                    
                    VStack {
                        Text("Player 2")
                        Text("Balance: \(balance2)")
                        TextField("Bet amount", text: $betAmount2)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .foregroundColor(selectedTheme == "Classic" ? .black : .white)
                            .background(selectedTheme == "Classic" ? Color.white : Color.black)
                            .padding()
                        Picker("Chosen value", selection: $chosenValue2) {
                            ForEach(1...6, id: \.self) { number in
                                Text("\(number)")
                                
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        Image(systemName: "die.face.\(diceValue2)")
                            .font(.system(size: 100))
                    }
                    .foregroundColor(selectedTheme == "Classic" ? .black : .white)
                }
                
                Button(action: rollDice) {
                    Text("Roll Dice")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    private func rollDice() {
        diceValue1 = Int.random(in: 1...6)
        diceValue2 = Int.random(in: 1...6)
        
        let bet1 = Int(betAmount1) ?? 0
        let bet2 = Int(betAmount2) ?? 0
        
        if diceValue1 == chosenValue1 {
            balance1 += bet1
        } else {
            balance1 -= bet1
        }
        
        if diceValue2 == chosenValue2 {
            balance2 += bet2
        } else {
            balance2 -= bet2
        }
        
        betAmount1 = ""
        betAmount2 = ""
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
