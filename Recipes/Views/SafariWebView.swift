//
//  SafariWebView.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/22/24.
//
import SwiftUI
import SafariServices

class SafariDelegate: NSObject, SFSafariViewControllerDelegate {
    var onDismiss: (() -> Void)? = nil
    
    override init() {
        super.init()
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        if let dismiss = self.onDismiss {
            dismiss()
        }
    }
}

struct SafariWebView: UIViewControllerRepresentable {
    let url: URL
    let delegate = SafariDelegate()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safari = SFSafariViewController(url: url)
        delegate.onDismiss = {
            presentationMode.wrappedValue.dismiss()
        }
        safari.delegate = delegate
        return safari
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // pass
    }
}
