//
//  EventCell.swift
//  GRPC Example
//
//  Created by Mert Gürcan on 28.11.2021.
//

import UIKit

class EventCell : UICollectionViewCell {

    var event : Event? {
        didSet {
            guard let event = event else { return }
            if let url = URL(string: event.eventImageURL) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            self.eventImage.image = UIImage(data: data)
                        }
                    }
                }
            }
            eventTitleLabel.text = event.eventTitle
        }
    }

    var eventImage : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        return iv
    }()

    var eventTitleLabel : UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()

    override init(frame: CGRect){
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUI(){
        contentView.clipsToBounds = false
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1


        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowRadius = 2
        contentView.layer.shadowOffset = CGSize(width: 4, height: 7)

        eventImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(eventImage)
        eventImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        eventImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        eventImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        eventImage.widthAnchor.constraint(equalToConstant: 180).isActive = true

        eventTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(eventTitleLabel)
        eventTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        eventTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        eventTitleLabel.leftAnchor.constraint(equalTo: eventImage.rightAnchor, constant: 10).isActive = true
        eventTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true

    }
}
