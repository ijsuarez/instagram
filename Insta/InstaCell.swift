//
//  InstaCell.swift
//  Insta
//
//  Created by Labuser on 2/23/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class InstaCell: UITableViewCell {

    @IBOutlet weak var imagePost: UIImageView!
    @IBOutlet weak var imageCaption: UILabel!
    
    var media: UserMedia! {
        didSet {
            imagePost.image = media.image
            imageCaption.text = media.caption
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageCaption.preferredMaxLayoutWidth = imageCaption.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
