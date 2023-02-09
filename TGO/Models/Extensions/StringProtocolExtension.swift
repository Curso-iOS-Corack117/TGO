//
//  StringProtocolExtension.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 25/01/23.
//

import Foundation

extension StringProtocol {
    func getPlainTextOfHtml(execute: @escaping (_ htmlStr: String) -> Void) {
        DispatchQueue.main.async {
            let options = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html]
            
            // only run on main queue
            let result = try? NSAttributedString(data: Data(self.utf8), options: options, documentAttributes: nil)
            
            execute(result?.string ?? "")
        }
    }
}
