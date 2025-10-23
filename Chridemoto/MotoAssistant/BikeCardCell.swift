//
//  BikeCardCell.swift
//  Chridemoto
//
//  Created by mumu on 2025/10/23.
//

import UIKit

class BikeCardCell: UICollectionViewCell {
    static let reuseIdentifier = "bikeCell"

    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 12
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    // 品牌标签
    let brandLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: "Helvetica-Bold", size: 16)
        lb.textColor = .white
        lb.textAlignment = .center
        lb.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.layer.cornerRadius = 4
        lb.layer.masksToBounds = true
        return lb
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(brandLabel)

        // Constraints: image fills contentView
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            brandLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            brandLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            brandLabel.heightAnchor.constraint(equalToConstant: 40),
            brandLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])

        // 卡片阴影（在容器层设置 shadow）
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true

        // 宿主 cell 的阴影在 cell layer 上（超出 contentView）
        layer.shadowColor = UIColor(named: "exhaust_blue")?.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 8
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.masksToBounds = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
