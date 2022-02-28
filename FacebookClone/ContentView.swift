//
//  ContentView.swift
//  FacebookClone
//
//  Created by Robert on 28/02/2022.
//

import SwiftUI

let primary = Color(red: 0.134, green: 0.149, blue: 0.153)

struct ContentView: View {
    var body: some View {
        ZStack {
            primary
                .edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView {
                    
                    Header()
                    Divider()
                        .padding(-10)
                    MakePost()
                    topDivider()
                    Stories()
                    topDivider()
                    PostFeed()
                    
                    
                }
                
                Spacer()
                bottomNav()
            }
        }
    }
}

struct Header: View {
    var body : some View {
        HStack {
            Text("facebook")
                .foregroundColor(.white)
                .fontWeight(.bold)
                .font(.title)
            
            Spacer()
            
            Image(systemName: "magnifyingglass")
                .padding(6)
                .background(.secondary)
                .clipShape(Circle())
                .font(.system(size: 18))
                .foregroundColor(.white)
            
            Image(systemName: "message.fill")
                .padding(6)
                .background(.secondary)
                .clipShape(Circle())
                .font(.system(size: 18))
                .foregroundColor(.white)
            
        }
        .padding(.init(top: 10, leading: 12, bottom: 0, trailing: 10))
    }
}

struct MakePost: View {
    var body : some View {
        VStack{
            HStack {
                Image("Profile")
                    .resizable()
                    .frame(width: 50, height: 60)
                    .clipShape(Circle())
                Text("What's on your mind?")
                    .foregroundColor(.secondary)
                    .font(.system(size: 15))
                Spacer()
            }
            .padding(.init(top: -10, leading: 12, bottom: 0, trailing: 0))
            
            Divider()
                .padding(.init(top: -05, leading: 0, bottom: 0, trailing: 0))
            
            HStack {
                Spacer()
                HStack {
                    Image(systemName: "video.fill")
                        .foregroundColor(Color.red)
                    Text("Live")
                        .fontWeight(.bold)
                }
                .foregroundColor(.white)
                Spacer()
                
                Rectangle()
                    .frame(width:1)
                    .foregroundColor(.secondary)
                
                Spacer()
                HStack {
                    Image(systemName: "photo")
                        .foregroundColor(Color.green)
                    Text("Photo")
                        .fontWeight(.bold)
                }
                .foregroundColor(.white)
                Spacer()
                
                Rectangle()
                    .frame(width:1)
                    .foregroundColor(.secondary)
                
                Spacer()
                Group{
                    HStack {
                        Image(systemName: "video.badge.plus.fill")
                            .foregroundColor(Color.purple)
                        Text("Room")
                            .fontWeight(.bold)
                        
                    }
                    .foregroundColor(.white)
                    Spacer()
                }
            }
            .font(.system(size : 12))
        }
    }
}

struct topDivider : View {
    var body: some View {
        Rectangle()
            .fill(Color(red: 0.086, green: 0.102, blue: 0.110))
            .frame(width: UIScreen.main.bounds.width, height: 5)
        
        
    }
}

struct myStoryCard : View {
    
    let background = LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
    
    var body : some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 170)
                .foregroundColor(.secondary)
            
            ZStack(alignment: .bottom) {
                Image("Profile")
                    .resizable()
                    .frame(width: 100, height: 115)
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .font(.system(size: 13, weight: .semibold))
                    
                    Group {
                        Text("Create")
                        Text("Story")
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 13, weight: .semibold))
                    
                }
                .offset(y: 50)
            }
            
        }
        
    }
}

struct StoryCard : View {
    let imageName : String
    let profilePic : String
    let title : String
    
    var body : some View {
        ZStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .frame(width:100, height: 170)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 100) {
                Image(profilePic)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                    .offset(x : 5, y : 5)
                
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size:14, weight: .bold))
                    .padding(5)
            }
            
        }
        
    }
}

struct Stories : View {
    
    let imageNames = ["Image1", "Image2", "Image3", "Image4"]
    
    var body : some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                myStoryCard()
                ForEach(0..<imageNames.count) { i in
                    StoryCard(imageName: "Image\(i)", profilePic: "User\(i)", title: "Story \(i)")
                }
                
            }
            .padding(.horizontal)
        }
    }
}

struct Post : View {
    var body : some View {
        VStack {
            HStack {
                Image("User0")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blue, lineWidth: 4))
        
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("User1")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    HStack(spacing: 5) {
                        Text("11 h")
                        
                        Circle()
                            .frame(width: 2, height: 2)
                        Image(systemName: "globe.americas.fill")
                    }
                    .font(.system(size: 12))
                    .foregroundColor(Color.secondary)
                }
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            Text("Swift Playgrounds is a revolutionary app for iPad and Mac that helps you learn to code and build apps using Swift")
                .padding(.horizontal)
                .font(.system(size:14))
                .foregroundColor(.white)
            
            Image("PostImage")
                .resizable()
                .scaledToFit()
            
            HStack {
                HStack(spacing: 3) {
                    Image("Icons")
                        .resizable()
                        .frame(width: 50, height: 30)
                    Text("120k")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                }
                
                
                Spacer()
                HStack {
                    Text("255 comments")
                    Text("8 shares")
                }
                .foregroundColor(.white)
                .font(.system(size:12))
                .foregroundColor(Color.secondary)
                
                
            }
            .padding(.horizontal)
            Divider()
                .padding(.horizontal)
            HStack() {
                Spacer()
                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text("Like")
                }
                .foregroundColor(.white)
                Spacer()
                Divider()
                Spacer()
                HStack {
                    Image(systemName: "bubble.left")
                    Text("Comment")
                }
                .foregroundColor(.white)
                Spacer()
                Divider()
                Spacer()
                Group {
                    HStack {
                        Image(systemName: "arrowshape.turn.up.right")
                        Text("Share")
                    }
                    .foregroundColor(.white)
                    Spacer()
                }
                
            }
            .font(.system(size: 12))
            .foregroundColor(Color.secondary)
            
            
        }
    }
}

struct PostFeed : View {
    var body : some View {
        VStack {
            ForEach(1..<5) { i in
                Post()
                topDivider()
            }
        }
    }
}

struct bottomNav : View {
    var body : some View {
        HStack{
            
            VStack {
                Image(systemName: "house.fill")
                    .foregroundColor(Color.blue)
                Text("")
            }
            .foregroundColor(.white)
            Spacer()
            VStack {
                Image(systemName: "cart")
                Text("")
            }
            .foregroundColor(.white)
            Spacer()
            VStack {
                Image(systemName: "person.circle")
                Text("")
            }
            .foregroundColor(.white)
            Spacer()
            VStack {
                Image(systemName: "bell")
                Text("")
            }
            .foregroundColor(.white)
            Spacer()
            VStack {
                Image(systemName: "line.3.horizontal")
                Text("")
            }
            .foregroundColor(.white)
            
        }
        .padding(.horizontal)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
