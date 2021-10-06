//
//  Home.swift
//  theDaily
//
//  Created by Morad Rayyan on 9/15/20.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI
import Firebase
import WebKit
import Combine


struct Home: View {
    
    @StateObject var newsAPI = NewsAPI()
    @EnvironmentObject var feedData: FeedData
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        
        Group {
            if feedData.newsResult.isEmpty {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
//            else {
//                ScrollView{
//
//                    //Header
//                    HStack {
//                        Spacer()
//
//                        Text("الوجبة الرئيسية").customFont(CustomFont.black, category: CustomTextStyle.title1(.black)).foregroundColor(.primary)
//
//                        Rectangle()
//                            .fill(Color("nOrange"))
//                            .frame(width: 40, height: 25)
//                    }.padding(.bottom, 15).padding(.top, 15).padding(.trailing, 16).background(Color("Card")).cornerRadius(10, antialiased: true)
//
//                    Group {
//                        //Top Story
//                        NavigationLink(destination:
//                                        WebViewContentView(url: self.feedData.newsResult[0].url)
//                                        .navigationBarTitle("", displayMode: .inline)) {
//                            VStack(alignment: .trailing, spacing: 15) {
//
//                                //                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
//                                //                                        .fill(Color.green)
//                                //                                        .frame(height: 180)
//
//                                WebImage(url: URL(string: self.feedData.newsResult[0].imageUrl), options: .highPriority, context: nil)
//                                    .onSuccess { image, cacheType in
//                                        // Success
//                                    }.onFailure { error in
//                                        print("did fail \(error)")
//                                    }
//                                    .placeholder {
//                                        RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.green).frame(width: 120, height: 180)
//                                    }
//                                    .resizable()
//                                    .renderingMode(.original)
//                                    .scaledToFill()
//                                    .frame( height: 180)
//                                    .cornerRadius(10, antialiased: true)
//
//
//
//                                HStack {
//                                    Spacer()
//                                    Text(self.feedData.newsResult[0].source).font(.custom("AdelleSansARA-Light", size: 14, relativeTo: .headline)).fontWeight(.light).foregroundColor(self.scheme == .dark ? Color.white : Color.black)
//                                }
//
//                                Text(self.feedData.newsResult[0].title)
//                                    .font(.custom("AdelleSansARA-Bold", size: 24, relativeTo: .headline)).fontWeight(.bold)
//                                    .multilineTextAlignment(.trailing)
//                                    .linespacing(4)
//                                    .foregroundColor(.primary)
//
//                                HStack (alignment: .top) {
//                                    Spacer()
//                                    Text(self.feedData.newsResult[0].description)
//                                        .font(.custom("AdelleSansARA-Regular", size: 18, relativeTo: .headline)).fontWeight(.regular)
//                                        .multilineTextAlignment(.trailing)
//                                        .lineSpacing(4)
//                                        .foregroundColor(.primary)
//                                    //                                HStack {
//                                    //                                    Circle().stroke() // this can be custom control
//                                    //                                        .frame(width: 2, height: 2).foregroundColor(self.scheme == .dark ? Color.white : Color.blue)
//                                    //                                }
//                                    //                                .padding(.top, 10)
//                                }
//
//                                //                            HStack (alignment: .top) {
//                                //                                Spacer()
//                                //                                Text("أكدت رئاسة الوزراء الإسرائيلية أن اتفاق التطبيع مع الإمارات لن يكون ساري المفعول إلا بعد عرضه على الهيئة العامة للحكومة للتصديق على بنوده، وعرضه أيضا على الكنيست بكامل هيئته.")
//                                //                                    .font(.custom("AdelleSansARA-Regular", size: 18, relativeTo: .headline)).fontWeight(.regular)
//                                //                                    .multilineTextAlignment(.trailing)
//                                //                                    .lineSpacing(4)
//                                //                                    .foregroundColor(.black)
//                                //                                HStack {
//                                //                                    Circle().stroke() // this can be custom control
//                                //                                        .frame(width: 2, height: 2)
//                                //                                }
//                                //                                .padding(.top, 10)
//                                //                            }
//
//
//                            }.padding(.bottom, 25)
//                        }
//
//                        //Header 2
//                        Rectangle()
//                            .fill(Color.primary)
//                            .frame(height: 5)
//                            .padding(.top, 10)
//                            .padding(.horizontal)
//
//                        HStack {
//                            Spacer()
//
//                            Text("لا تقل أهمية").font(.custom("AdelleSansARA-Heavy", size: 18, relativeTo: .headline)).fontWeight(.heavy)
//
//                            Rectangle()
//                                .fill(Color.yellow)
//                                .frame(width: 40, height: 25)
//                                .padding(.trailing, 16)
//                        }.padding(.bottom, 15).padding(.top, 5)
//
//
//                        //2nd Top Story
//                        NavigationLink(destination:
//                                        webView(url: self.feedData.newsResult[1].url)
//                                        .navigationBarTitle("", displayMode: .inline)) {
//
//                            VStack(alignment: .trailing, spacing: 10) {
//
//                                WebImage(url: URL(string: self.feedData.newsResult[1].imageUrl), options: .highPriority, context: nil)
//                                    .onSuccess { image, cacheType in
//                                        // Success
//                                    }.onFailure { error in
//                                        print("did fail \(error)")
//                                    }
//                                    .placeholder {
//                                        RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.green).frame(width: 120, height: 180)
//                                    }
//                                    .resizable()
//                                    .renderingMode(.original)
//                                    .scaledToFill()
//                                    .frame( height: 180)
//                                    .cornerRadius(10, antialiased: true)
//
//
//                                HStack {
//                                    Spacer()
//                                    Text(self.feedData.newsResult[1].source).font(.custom("AdelleSansARA-Light", size: 14, relativeTo: .headline)).fontWeight(.light).foregroundColor(self.scheme == .dark ? Color.white : Color.black)
//                                }
//
//                                Text(self.feedData.newsResult[1].title)
//                                    .font(.custom("AdelleSansARA-Bold", size: 24, relativeTo: .headline)).fontWeight(.bold)
//                                    .multilineTextAlignment(.trailing)
//                                    .linespacing(4)
//                                    .foregroundColor(.primary)
//
//                            }.padding(.bottom, 25)
//                        }
//
//
//
//                        ForEach(Array(zip(newsAPI.newsData.indices, newsAPI.newsData)), id: \.0) {index, newsItem in
//                            if index == 0 {
//
//                            } else {
//                                NavigationLink(destination:
//                                                webView(url: newsItem.url)
//                                                .navigationBarTitle("", displayMode: .inline)) {
//                                    HStack(alignment: .top, spacing: 10) {
//
//                                        if newsItem.image != "" {
//                                            WebImage(url: URL(string: newsItem.image), options: .highPriority, context: nil)
//                                                .onSuccess { image, cacheType in
//                                                    // Success
//                                                }.onFailure { error in
//                                                    print("did fail \(error)")
//                                                }
//                                                .placeholder {
//                                                    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.green).frame(width: 120, height: 120)
//                                                }
//                                                .resizable()
//                                                .renderingMode(.original)
//                                                .scaledToFill()
//                                                .frame(width: 120, height: 120)
//                                                .cornerRadius(10, antialiased: true)
//                                        } else {
//
//                                            RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.green).frame(width: 120, height: 120)
//
//                                        }
//
//                                        Spacer(minLength: 10)
//
//
//                                        VStack(alignment: .trailing, spacing: 5) {
//                                            Text(newsItem.source).font(.custom("AdelleSansARA-Regular", size: 12, relativeTo: .headline)).fontWeight(.regular).foregroundColor(self.scheme == .dark ? Color.white : Color.black)
//                                            Text(newsItem.title)
//                                                .font(.custom("AdelleSansARA-Semibold", size: 16, relativeTo: .headline))
//                                                .multilineTextAlignment(.trailing)
//                                                .lineSpacing(4)
//                                                .foregroundColor(.primary)
//                                            Spacer()
//
//                                            Text("55 دقيقة").font(.custom("AdelleSansARA-Light", size: 12, relativeTo: .headline)).fontWeight(.light).foregroundColor(self.scheme == .dark ? Color.white : Color.blue)
//
//                                        }.frame(height: 120)
//
//                                    }.padding(.bottom, 5)
//                                }
//                            }
//                        }
//                        .padding(.bottom)
//                    }.padding(.top, 20)
//
//                }
//                .padding()
//                .background(Color("nBackground"))
//            }
        }.background(Color("nBackground")).onAppear {
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



struct newsDataType: Identifiable, Decodable {
    var id: String
    var title: String
    var desc: String
    var url: String
    var image: String
    var source: String
}



class NewsAPI: ObservableObject {
    @Published var newsData : [newsDataType] = []
    
    init() {
//        getNewsData(url: "https://storage.scrapinghub.com/items/473312?format=json&apikey=2f5fffb559ad4c95ac3acac60df0dc92&include_headers=1&fields=source%2Ctype%2Cimage%2Ctitle%2Clink%2Cdesc%2CdescAlt", completionHandler: { (isFinished) in
//            if isFinished {
//                // do Somthing
//                print("loaded!", self.newsData.count)
//                
//                
//            }
//        })
        
        
    }
    
    typealias completion = (_ isFinished:Bool) -> Void
    
    func getNewsData(url: String, completionHandler: @escaping completion) {
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            do {
                
                //            let news = try JSONDecoder().decode([newsData].self, from: data!)
                let news = try JSON(data: data!)
                
                let g = DispatchGroup()
                
                for i in news {
                    var title =  i.1["title"][0].stringValue
                    if title.isEmpty { title =  i.1["title"].stringValue }
                    
                    var description =  i.1["desc"][0].stringValue
                    if description.isEmpty { description =  i.1["desc"].stringValue }
                    
                    var url =  i.1["link"][0].stringValue
                    if url.isEmpty { url =  i.1["link"].stringValue }
                    
                    var image = i.1["image"][0].stringValue
                    if image.isEmpty { image =  i.1["image"].stringValue } else { image = "https://www.aljazeera.net" + image }
                    
                    
                    let id = url
                    
                    var sourceName = i.1["source"][0].stringValue
                    if sourceName.isEmpty { sourceName =  i.1["source"].stringValue }
                    
                    let newNewsItem = newsDataType(id: id, title: title, desc: description, url: url, image: image, source: sourceName)
                    
                    DispatchQueue.main.async {
                        self.newsData.append(newNewsItem)
                    }
                }
                
                g.notify(queue:.main) {
                    completionHandler(true)
                }
                
            } catch {
                print(error)
            }
        }
        .resume()
    }
}






extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}






struct webView: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: UIViewRepresentableContext<webView>) -> WKWebView {
        let webConfiguration = WKWebViewConfiguration()
        let view = WKWebView(frame: .zero, configuration: webConfiguration)
        let webURL = url.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed) ?? "http://www.google.com"
        
        view.load(URLRequest(url: URL(string: webURL) ?? URL(string: "http://www.google.com")!))

        
        return view
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<webView>) {
        
    }
    
}






class WebViewModel: ObservableObject {
    @Published var link: String
    @Published var didFinishLoading: Bool = false
    
    init (link: String) {
        self.link = link
    }
}

struct WebView: UIViewRepresentable {
    @ObservedObject var viewModel: WebViewModel
    
    let webView = WKWebView()
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        self.webView.navigationDelegate = context.coordinator
        if let url = URL(string: viewModel.link) {
            self.webView.load(URLRequest(url: url))
        }
        return self.webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        return
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        private var viewModel: WebViewModel
        
        init(_ viewModel: WebViewModel) {
            self.viewModel = viewModel
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("WebView: navigation finished")
            self.viewModel.didFinishLoading = true
        }
    }
    
    func makeCoordinator() -> WebView.Coordinator {
        Coordinator(viewModel)
    }
    
}

struct WebViewContentView: View {
    @ObservedObject var model = WebViewModel(link: "")
    
    init(url:String) {
        model = WebViewModel(link: url)
    }
    
    var body: some View {
        VStack {
            WebView(viewModel: model)
            if model.didFinishLoading {
                Text("Finished loading")
                    .foregroundColor(Color.red)
            }
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebViewContentView(url: "")
    }
}
