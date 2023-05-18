import UIKit

class TrackItContainer: UIView {

    @IBOutlet weak var goToAchievementButton: UIImageView!
    @IBOutlet weak var achievementView: UIView!
    @IBOutlet weak var progressBarProgressView: UIView!
    @IBOutlet weak var progressBarView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        guard let contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Could not load BasicTaskTile from nib")
        }
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        achievementView.layer.cornerRadius = 17
        achievementView.layer.borderWidth = 1
        achievementView.layer.borderColor = UIColor.white.cgColor
        
        progressBarView.layer.cornerRadius = 5
        progressBarProgressView.layer.cornerRadius = 5
        
        let image = UIImage(named: "Group 7779")?.withRenderingMode(.alwaysTemplate)
        goToAchievementButton.image = image
        goToAchievementButton.tintColor = UIColor.white
    }
}

extension TrackItContainer {
    static var nibName: String {
        return String(describing: self)
    }
}
