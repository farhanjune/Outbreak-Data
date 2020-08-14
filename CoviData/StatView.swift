//
//  StatView.swift
//  CovidData
//
//  Created by Farhan Juneja on 8/8/20.
//  Copyright © 2020 Farhan Juneja. All rights reserved.
//

import SwiftUI
import UIKit


struct StatView: View {
    var body: some View {
       Home()
        
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView()
    }
}


struct Home : View {
    
    @State var index = 0
    @State var main : MainData!
    @State var daily : [Daily] = []
    @State var last : Int = 0
    @State var country = "usa"
    @State var alert = false
    
    
    var body: some View{
        
        VStack{
            
            if self.main != nil && !self.daily.isEmpty{
               
                VStack{
                           
                           
                           VStack(spacing: 18) {
                               
                               HStack{
                                   
                                   Text("Statistics")
                                       .font(.title)
                                       .fontWeight(.bold)
                                       .foregroundColor(.orange)
                               
                               Spacer()
                                   
                                   Button(action:  {
                                    
                                    self.Dialog()
                                   
                                   }) {
                                       
                                    Text(self.country.uppercased())
                                           .foregroundColor(.white)
                                           .fontWeight(.bold)
                                       
                               }
                           }
                           .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)

                       
                               
                               HStack{
                                   Button(action: {
                                       self.index = 0
                                    self.main = nil
                                    self.daily.removeAll()
                                    self.getData()
                                   }) {
                                       
                                       Text("My Country")
                                           .foregroundColor(self.index == 0 ? .black : .white)
                                           .padding(.vertical, 12)
                                           .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                                       
                                   }
                                   .background(self.index == 0 ? Color.orange : Color.clear)
                               .clipShape(Capsule())
                               
                                   
                                   
                               Button(action: {
                                   self.index = 1
                                self.main = nil
                                self.daily.removeAll()
                                self.getData()
                               }) {
                                   
                                   Text("Global")
                                       .foregroundColor(self.index == 1 ? .black : .white)
                                       .padding(.vertical, 12)
                                       .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                                   
                               }
                               .background(self.index == 1 ? Color.orange : Color.clear)
                           .clipShape(Capsule())
                               
                               }
                               .background(Color.black.opacity(0.25))
                           .clipShape(Capsule())
                               .padding(.top, 10)
                               
                               
                               HStack(spacing: 15) {
                                   
                                   VStack(spacing: 12){
                                       Text("Affected")
                                           .fontWeight(.bold)
                                       
                                       Text("\(self.main.cases)")
                                           .fontWeight(.bold)
                                           
                                       
                                   }
                                   .padding(.vertical)
                                   .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                               .background(Color("affected"))
                               .cornerRadius(12)
                               
                                   
                               HStack(spacing: 15) {
                                   
                                   VStack(spacing: 12){
                                       Text("Deaths")
                                           .fontWeight(.bold)
                                       Text("\(self.main.deaths)")
                                           .fontWeight(.bold)
                                           
                                   }
                                   .padding(.vertical)
                                   .frame(width: (UIScreen.main.bounds.width / 2) - 30)
                               .background(Color("death"))
                               .cornerRadius(12)

                               }
                                       
                       }
                               .foregroundColor(.white)
                               .padding(.top, 10)
                                   
                               
                               
                               HStack(spacing: 15) {
                                   
                                   VStack(spacing: 12){
                                       Text("Recovered")
                                           .fontWeight(.bold)
                                       
                                       Text("\(self.main.recovered)")
                                           .fontWeight(.bold)
                                           
                                       
                                   }
                                   .padding(.vertical)
                                   .frame(width: (UIScreen.main.bounds.width / 3) - 30)
                               .background(Color("recovered"))
                               .cornerRadius(12)
                               

                                   VStack(spacing: 12){
                                       Text("Active")
                                           .fontWeight(.bold)
                                       Text("\(self.main.active)")
                                           .fontWeight(.bold)
                                           
                                   }
                                   .padding(.vertical)
                                   .frame(width: (UIScreen.main.bounds.width / 3) - 30)
                               .background(Color("active"))
                               .cornerRadius(12)
                                
                                   VStack(spacing: 12){
                                       Text("Critical")
                                           .fontWeight(.bold)
                                       Text("\(self.main.critical)")
                                           .fontWeight(.bold)

                                   }
                                   .padding(.vertical)
                                   .frame(width: (UIScreen.main.bounds.width / 3) - 30)
                               .background(Color("critical"))
                               .cornerRadius(12)
                                   
                                   
                                   
                                   
                                   
                                       
                       }
                               .foregroundColor(.white)
                               .padding(.top, 10)
                                   

                               
                           }
                           .padding(.horizontal)
                           .padding(.bottom, 45)
                           .background(Color("bg"))
                       
                       
                           
                           VStack(spacing: 15){
                               
                               
                               HStack{
                                   
                                   Text("Weekly Report")
                                       .font(.title)
                                    .fontWeight(.bold)
                                       .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                
                                   
                                   Spacer()
                               }
                               .padding(.top)
                               
                               
                               HStack{
                                       
                                ForEach(self.daily){i in
                                       
                                       VStack(spacing: 10){
                                           
                                           Text("\(i.cases / 1000)K")
                                        .lineLimit(1)
                                               .font(.caption)
                                               .foregroundColor(.gray)
                                           
                                           GeometryReader{g in
                                               
                                               VStack{
                                                   
                                                   Spacer(minLength: 0)
                                                       
                                                   Rectangle()
                                                   .fill(Color("orange1"))
                                                    .frame(width: 15,height: self.getHeight(value: i.cases, height: g.frame(in: .global).height))
                                                   
                                               }
                                               
                                           }
                                           
                                           
                                        Text(i.day)
                                        .lineLimit(1)
                                               .font(.caption)
                                               .foregroundColor(.black)
                                       
                                       
                                       }
                            
                                   }
                               }
                
                           }
                           .padding(.horizontal)
                           .background(Color.white)
                       .cornerRadius(20)
                           .padding(.bottom, -30)
                           .offset(y: -30)
                           
                       }
                
            }
            else {
                Indicator()
            }
            
        }
            .edgesIgnoringSafeArea(.top)
        .alert(isPresented: self.$alert, content: {
        
            Alert(title: Text("Error"), message: Text("Invalid Country Name"), dismissButton: .destructive(Text("Ok")))
        
        })
        .onAppear(){
            self.getData()
            
        }
    }
    
    
    

    
    func getData(){
    
            var url = ""
         
        if self.index == 0{
            
            url = "https://corona.lmao.ninja/v2/countries/\(self.country)?yesterday=false"
        }
        else {
            url = "https://corona.lmao.ninja/v2/all?today"
        }
        
        let session = URLSession(configuration: .default)
            
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            let json = try! JSONDecoder().decode(MainData.self, from:data!)
            
            self.main = json
  
        }
    .resume()
    
        
    
    var url1 = ""
        
        if self.index == 0{
            url1 = "https://corona.lmao.ninja/v2/historical/\(self.country)?lastdays=7"
        }
        else{
            url1="https://corona.lmao.ninja/v2/historical/all?lastdays=7"
        }
        let session1 = URLSession(configuration: .default)
        
            
        session1.dataTask(with: URL(string: url1)!) { (data, _, err) in
            
            if err != nil{
    
                print((err?.localizedDescription)!)
                return
    }
            
            var count = 0
            var cases : [String : Int] = [:]
            
            if self.index == 0{
                let json = try! JSONDecoder().decode(MyCountry.self, from:data!)
                cases = json.timeline["cases"]!
                
            }
            else{
                let json = try! JSONDecoder().decode(Global.self, from:data!)
                cases = json.cases
            }
            
            for i in cases{
                self.daily.append(Daily(id: count, day: i.key, cases: i.value))
                count += 1
            }
            
            self.daily.sort { (t, t1) -> Bool in
                
                if t.day < t1.day{
                    return true
                }
                else{
                    return false
                }
            }
            self.last = self.daily.last!.cases
            
            }
            .resume()
    }
    
    
    func getHeight(value : Int,height:CGFloat)->CGFloat{
        
        if self.last != 0{
            
            let converted = CGFloat(value) / CGFloat(self.last)
            
            return converted * height
        }
        else {

        return 0
    }

}

    func Dialog(){
        
        let alert = UIAlertController(title: "Country", message: "", preferredStyle: .alert)
        
        alert.addTextField { (_) in
            
        }
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                
            for i in countryList{
                
                if i.lowercased() == alert.textFields![0].text!.lowercased(){
                    
                    self.country = alert.textFields![0].text!.lowercased()
                    self.main = nil
                    self.daily.removeAll()
                    self.getData()
                    return
            
                }
            }
            self.alert.toggle()
            
        }))
        
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        
    }
}



// data models

struct Daily: Identifiable{
    
    var id : Int
    var day : String
    var cases : Int
    
    
}

struct MainData : Decodable{
    var deaths : Int
    var recovered : Int
    var active : Int
    var critical : Int
    var cases : Int
    
}

struct MyCountry : Decodable {
    
    var timeline : [String : [String : Int]]
}

struct Global : Decodable {
    
    var cases : [String : Int]
}

struct Indicator : UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
        
        
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}


