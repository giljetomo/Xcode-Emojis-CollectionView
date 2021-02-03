//
//  EmojiCollectionViewCell.swift
//  EmojiDictionary - CollectionView
//
//  Created by Macbook Pro on 2021-02-02.
//

import UIKit

class EmojiCollectionViewCell: UICollectionViewCell {
    let symbolLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
      //  label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    lazy var vStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 5
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let hStackView = UIStackView(arrangedSubviews: [symbolLabel, vStackView])
        hStackView.axis = .horizontal
        hStackView.distribution = .fill
        hStackView.alignment = .center
        hStackView.spacing = 10
        hStackView.translatesAutoresizingMaskIntoConstraints = false
            
        contentView.addSubview(hStackView)
        hStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        hStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        hStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        hStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        hStackView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with emoji: Emoji) {
        symbolLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        descriptionLabel.text = emoji.description
    }
}
