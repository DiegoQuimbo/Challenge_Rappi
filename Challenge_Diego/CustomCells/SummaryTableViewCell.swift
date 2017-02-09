//
//  SummaryTableViewCell.swift
//  Challenge_Diego
//
//  Created by Diego Quimbo on 2/8/17.
//  Copyright © 2017 Diego Quimbo. All rights reserved.
//

import UIKit

protocol SummaryTableViewCellDelegate {
    func updateHeightInSummaryCell(size: CGSize)
}

class SummaryTableViewCell: UITableViewCell, UITextViewDelegate {

    // IBOutlets
    @IBOutlet weak var summaryTextView: UITextView!
    
    var delegate: SummaryTableViewCellDelegate!
    var summaryTextOriginal = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Public Functions
    
    func loadElementsInCell(_summary: String) {
        
        self.summaryTextView.delegate = self
        
        var summaryText = _summary
        self.summaryTextOriginal = _summary
        
        if summaryText.characters.count > 220 {
            
             summaryText = self.getMaxCharacters()
            
            let attributedString = NSMutableAttributedString(string:"\(summaryText)... read more")
            attributedString.setAsLink(textToFind: "read more", linkURL: "http://google.com")
            
            
            self.summaryTextView.attributedText = attributedString
        }else{
            let attributedString = NSMutableAttributedString(string:"\(self.summaryTextOriginal)")
            self.summaryTextView.attributedText = attributedString

        }
    

    }
    
    // MARK: - Private Functions
    
    func getMaxCharacters() -> String{
        
        var summaryText = self.summaryTextOriginal
        let index = summaryText.index(summaryText.startIndex, offsetBy: 220)
        summaryText = summaryText.substring(to: index)
        
        if summaryText.lines.count < 2 {
            var moreSummaryText = self.summaryTextOriginal
            if moreSummaryText.characters.count > 360 {
                let indexMoreText = moreSummaryText.index(moreSummaryText.startIndex, offsetBy: 360)
                moreSummaryText = moreSummaryText.substring(to: indexMoreText)
                return moreSummaryText
            }else{
                return summaryText
            }
            
        }else{
            return summaryText
        }
        
        
    }
    
    // MARK: - UITextViewDelegate
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        let attributedString = NSMutableAttributedString(string:"\(self.summaryTextOriginal)")
        self.summaryTextView.attributedText = attributedString
        
        let sizeThatFitsTextView = self.summaryTextView.sizeThatFits(CGSize(width: self.summaryTextView.frame.size.width, height: CGFloat(MAXFLOAT)))
        
        self.delegate.updateHeightInSummaryCell(size: sizeThatFitsTextView)
        
        return false
    }

}

extension String {
    var lines: [String] {
        var result: [String] = []
        enumerateLines { line, _ in result.append(line) }
        return result
    }
}

extension NSMutableAttributedString {
    
    public func setAsLink(textToFind:String, linkURL:String) {
        
        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(NSLinkAttributeName, value: linkURL, range: foundRange)
        }
    }
}
