//
//  NewsCell.swift
//  FirebaseDB
//
//  Created by Rifat Firdaus on 18/12/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit
import SwiftDate

class NewsCell: UITableViewCell {

    lazy var imageViewNews = UIImageView()
    lazy var labelTitle = SMStrongLabel()
    lazy var labelSubTitle = SMNormalLabel()
    lazy var labelDate = SMSubLabel()
    lazy var stackViewFav: UIStackView = {
        let wrapper = SMContainerView.createHorizontalWrap(align: .top, distribution: .fill, spacing: 0)
        return wrapper
    }()
    lazy var buttonFav: UIButton = {
        let buttonFav = UIButton()
        buttonFav.setTitle("Fav", for: .normal)
        buttonFav.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        buttonFav.backgroundColor = .red
        return buttonFav
    }()
    lazy var stackViewWrapTitle: UIStackView = {
        let wrapper = SMContainerView.createVerticalWrap(align: .fill, distribution: .fill, spacing: 0)
        return wrapper
    }()
    lazy var stackViewTitle: UIStackView = {
        let wrapper = SMContainerView.createHorizontalWrap(align: .center, distribution: .fill, spacing: 0)
        return wrapper
    }()
    
    lazy var stackViewContainer: UIStackView = {
        let wrapper = SMContainerView.createHorizontalWrap(align: .fill, distribution: .fill, spacing: 8)
        return wrapper
    }()
    
    var article: ArticleFirebase? {
        didSet {
            if let article = article {
                labelTitle.text = article.title ?? "-"
                labelSubTitle.text = article.writter?.name ?? "-"
                labelDate.text = article.date?.toColloquialString() ?? "-"
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imageViewNews.image = UIImage(named: "ic_news")
        imageViewNews.clipsToBounds = true
        imageViewNews.contentMode = .scaleAspectFill
        imageViewNews.roundCorners(corners: [.topLeft, .bottomLeft], radius: 8.0)
        labelTitle.text = "The Title of News"
        labelSubTitle.text = "The subtitle of news"
        labelDate.text = "2018-12-17".toDate()?.toRelative(style: RelativeFormatter.defaultStyle(), locale: Locales.indonesian) ?? ""
        
        stackViewWrapTitle.addArrangedSubViews(views: [labelTitle, labelSubTitle, labelDate])
        stackViewTitle.addArrangedSubview(stackViewWrapTitle)
        
        imageViewNews.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraintsWithFormat("H:[v0(60)]", views: imageViewNews)
        self.addConstraintsWithFormat("V:[v0(60)]", views: imageViewNews)
        
        // Fav
        buttonFav.roundCorners(corners: [.topRight], radius: 8.0)
        stackViewFav.addArrangedSubview(buttonFav)
        buttonFav.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraintsWithFormat("H:[v0(35)]", views: buttonFav)
        self.addConstraintsWithFormat("V:[v0(35)]", views: buttonFav)
        
        // container
        
        stackViewContainer.addArrangedSubViews(views: [imageViewNews, stackViewTitle, stackViewFav])
        
        self.addSubview(stackViewContainer)
        stackViewContainer.setBackground(color: UIColor(hexString: "#f4f4f4") ?? .white, cornerRadius: 8.0)
        stackViewContainer.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraintsWithFormat("H:|-8-[v0]-8-|", views: stackViewContainer)
        self.addConstraintsWithFormat("V:|-8-[v0]-8-|", views: stackViewContainer)
        let viewBackground = UIView()
        viewBackground.backgroundColor = SMUITheme.primaryColor
        self.selectedBackgroundView = viewBackground
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
