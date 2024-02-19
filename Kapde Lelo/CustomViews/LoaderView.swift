//
//  LoaderView.swift
//  Kapde Lelo
//
//  Created by Aman Raghuvanshi on 16/02/24.
//

import SwiftUI
import WebKit

struct LoaderView: UIViewRepresentable {
    private let name: String

    init(_ name: String) {
        self.name = name
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let url = Bundle.main.url(forResource: name, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        webView.load(
            data,
            mimeType: "image/gif",
            characterEncodingName: "UTF-8",
            baseURL: url.deletingLastPathComponent()
        )
        webView.scrollView.isScrollEnabled = false
        webView.isOpaque = false
        webView.backgroundColor = .clear

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }

}


//struct GifImage_Previews: PreviewProvider {
//    static var previews: some View {
//        GifImage("pokeball")
//    }
//}


//
//struct LoaderView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

#Preview {
    LoaderView("loader")
}
