//
//  ContentView.swift
//  Memorize
//
//  Created by Jamill See on 20.08.2021.
//

import SwiftUI
//import UIKit
//
//
//class ViewController:  UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.title = "Memorize!"
//    }
//}
struct ContentView: View {
    
//    var emojis = ["🚂", "🛳", "✈️", "🚜", "🚗", "🚎", "🏎", "🚓",  "🚒", "🛻", "🚚", "🚛", "🚲", "🛵", "🏍", "🚠", "🚃"]
    
    var emojiVehicles = [ "🚀", "🛸", "🚁", "🛶", "⛵️", "🚤", "🛥", "🚂"]
    
    var emojiAnimals = ["🐰", "🐸", "🦜", "🦄", "🦋", "🐳", "🐈", "🦚"]
    
    var emojiFruits = ["🍎", "🍋", "🍌", "🍉", "🍇", "🍓" ,"🫐", "🍍"]
    
    
//    @State var emojiCount = 12
//!!!
    @State var nowEmoji: [String]
    init() {
        nowEmoji = emojiFruits
    }
//    !!!!
    var body: some View {
        
        VStack{
            VStack{
                Text("Memorize!").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
            }
            ScrollView{
                
                LazyVGrid(columns : [GridItem(.adaptive(minimum: 65))]){
                    ForEach(nowEmoji, id:\.self) {emoji in CardView(content:emoji).aspectRatio(2/3, contentMode: .fit)
                }
            }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack{
                vehicles
// 1               remove
                Spacer()
                animals
// 2               add
                Spacer()
                fruits
                
                    
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
// 1   var  remove : some View {
//        Button {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        } label: {
//            Image(systemName: "minus.circle")
//
//        }
//    }
    
    var vehicles : some View {
        Button(action:{
           nowEmoji = emojiVehicles.shuffled()
        }, label: {
            VStack{
                Image(systemName: "car" )
                Text("Vehicles").font(Font.custom("Arial", size: 12))
            }
        })
        
    }
    
    var animals : some View {
        Button(action:{
           nowEmoji = emojiAnimals.shuffled()
        }, label: {
            VStack{
                Image(systemName: "hare" )
                Text("Animals").font(Font.custom("Arial", size: 12))
            }
        })
        
    }
    
    var fruits : some View {
        Button(action: {
            nowEmoji = emojiFruits.shuffled()
        }, label: {
            VStack{
                Image(systemName: "leaf")
                Text("Fruits").font(Font.custom("Arial", size: 12))
            }
        })
    }
    
    
    
// 2   var add : some View{
//        Button{
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//        }
//    }
}

struct CardView: View {
    var content : String
    
    @State var isFaceUp: Bool = true
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp{
                shape.fill().foregroundColor(.white)
//                shape.stroke(lineWidth: 3)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
                //                    .foregroundColor(Color.orange)
            } else{
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView()
            .preferredColorScheme(.light)
    }
}
