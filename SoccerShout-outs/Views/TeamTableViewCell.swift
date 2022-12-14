//
//  TeamTableViewCell.swift
//  SoccerShout-outs
//
//  Created by Алексей Гайдуков on 02.09.2022.
//

import UIKit

protocol TeamTableViewCellDelegate: class {
    func didTapPlayback(for team: Team)
}

class TeamTableViewCell: UITableViewCell {
    
    static let cell = "TeamTableViewCell"
    
    //MARK: - UI
    
    private lazy var conteinertView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .vertical
        return stackView
    }()
    
    // added icon
    private lazy var iconImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // added button play
    private lazy var buttonPlay: UIButton = {
        let buttonPlay = UIButton()
        buttonPlay.translatesAutoresizingMaskIntoConstraints = false
        buttonPlay.backgroundColor = .white
        return buttonPlay
    }()
    
    private lazy var nameLable: UILabel = {
      let nameLable = UILabel()
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        nameLable.numberOfLines = 0
        nameLable.font = .systemFont(ofSize: 18, weight: .bold)
        nameLable.textColor = .white
        return nameLable
    }()
    
    private lazy var founderLable: UILabel = {
      let foundLable = UILabel()
        foundLable.translatesAutoresizingMaskIntoConstraints = false
        foundLable.numberOfLines = 0
        foundLable.font = .systemFont(ofSize: 12, weight: .light)
        foundLable.textColor = .white
        return foundLable
    }()
    
    private lazy var jobLable: UILabel = {
      let jobLable = UILabel()
        jobLable.translatesAutoresizingMaskIntoConstraints = false
        jobLable.numberOfLines = 0
        jobLable.font = .systemFont(ofSize: 10, weight: .light)
        jobLable.textColor = .white
        return jobLable
    }()
    
    private lazy var infoLable: UILabel = {
      let infoLable = UILabel()
        infoLable.translatesAutoresizingMaskIntoConstraints = false
        infoLable.numberOfLines = 0
        infoLable.font = .systemFont(ofSize: 12, weight: .medium)
        infoLable.textColor = .white
        return infoLable
    }()
    
    //delegate
    private weak var delegate: TeamTableViewCellDelegate?
    private var team: Team?
    
    //MARK: - LifeCycle
    override func layoutSubviews() {
        super.layoutSubviews()
        conteinertView.layer.cornerRadius = 10
        buttonPlay.layer.cornerRadius = 20
    }
    
    // clean state cell
    override func prepareForReuse() {
        super.prepareForReuse()
        self.team = nil
        self.delegate = nil
        self.contentView.subviews.forEach{$0.removeFromSuperview()}
    }
    
    func configure(with item: Team, delegate: TeamTableViewCellDelegate ) {
        self.team = item
        self.delegate = delegate
        
        //addTarget
        buttonPlay.addTarget(self, action: #selector(didTapPlayback), for:.touchUpInside )
        contentView.backgroundColor = item.id.background
       
        iconImageView.image = item.id.badge
        buttonPlay.setImage(item.isPlaing ? Assets.pause : Assets.play, for: .normal)
        nameLable.text = item.name
        founderLable.text = item.founded
        jobLable.text = "Current \(item.manager.job.rawValue), \(item.manager.name)"
        infoLable.text = item.info
        
        //added a representation of the container in the box
        self.contentView.addSubview(conteinertView)
        conteinertView.addSubview(contentStackView)
        conteinertView.addSubview(iconImageView)
        conteinertView.addSubview(buttonPlay)
        
        contentStackView.addArrangedSubview(nameLable)
        contentStackView.addArrangedSubview(founderLable)
        contentStackView.addArrangedSubview(jobLable)
        contentStackView.addArrangedSubview(infoLable)
        
        //added a container view
        NSLayoutConstraint.activate([
            conteinertView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            conteinertView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            conteinertView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            conteinertView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: conteinertView.leadingAnchor, constant: 8),
            
            contentStackView.topAnchor.constraint(equalTo: conteinertView.topAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: conteinertView.bottomAnchor, constant: -16),
            contentStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: buttonPlay.leadingAnchor, constant: -8),
            
            buttonPlay.heightAnchor.constraint(equalToConstant: 44),
            buttonPlay.widthAnchor.constraint(equalToConstant: 44),
            buttonPlay.trailingAnchor.constraint(equalTo: conteinertView.trailingAnchor, constant: -8),
            buttonPlay.centerYAnchor.constraint(equalTo: conteinertView.centerYAnchor)
            
        ])
    }
    @objc func didTapPlayback() {
        if let team = team {
            delegate?.didTapPlayback(for: team)
            print("is selected \(team.name)")
        }
    }
}
