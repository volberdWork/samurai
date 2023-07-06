
import Foundation
import UIKit
import CHIPageControl

class OnboardingView: UIView {
    let scrollView: UIScrollView = {
        let obj = UIScrollView()
        obj.showsVerticalScrollIndicator = false
        obj.showsHorizontalScrollIndicator = false
        obj.isPagingEnabled = true
        obj.contentInsetAdjustmentBehavior = .never
        obj.insetsLayoutMarginsFromSafeArea = false
        return obj
    }()
    
    private let firstContentView: OnboardingContentView = {
        let obj = OnboardingContentView(page: .first)
        return obj
    }()
    
    private let secondContentView: OnboardingContentView = {
        let obj = OnboardingContentView(page: .second)
        return obj
    }()
    
    private let thirdContentView: OnboardingContentView = {
        let obj = OnboardingContentView(page: .third)
        return obj
    }()
    
    let pageControl: CHIPageControlAleppo = {
        let obj = CHIPageControlAleppo()
        obj.numberOfPages = 3
        obj.radius = 6
        obj.enableTouchEvents = true
        obj.currentPageTintColor = .theme(.switchActive)
        obj.tintColor = .theme(.textCurrencyGrey)
        obj.padding = 8
        obj.borderWidth = 1
        obj.inactiveTransparency = 0
        return obj
    }()
    
    let nextButton: UIButton = {
        let obj = UIButton(type: .system)
        obj.setTitle("Next".localized(), for: .normal)
        obj.setTitleColor(.theme(.textGray), for: .normal)
        obj.contentVerticalAlignment = .center
        obj.contentHorizontalAlignment = .center
        obj.clipsToBounds = true
        obj.setBackgroundImage(UIImage(named: "buttonNext"), for: .normal)
        obj.titleLabel?.font = .Bento(type: .normal, ofSize: 24)
        return obj
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nextButton.layer.cornerRadius = 8.sizeH
        scrollView.contentSize = CGSize(width: scrollView.bounds.width*3, height: scrollView.bounds.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setup() {
        backgroundColor = .theme(.black)
        
        addSubview(scrollView)
        addSubview(pageControl)
        addSubview(nextButton)
        scrollView.addSubview(firstContentView)
        scrollView.addSubview(secondContentView)
        scrollView.addSubview(thirdContentView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        firstContentView.snp.makeConstraints { make in
            make.size.equalToSuperview()
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        secondContentView.snp.makeConstraints { make in
            make.size.equalToSuperview()
            make.top.equalToSuperview()
            make.leading.equalTo(firstContentView.snp.trailing)
        }
        
        thirdContentView.snp.makeConstraints { make in
            make.size.equalToSuperview()
            make.top.equalToSuperview()
            make.leading.equalTo(secondContentView.snp.trailing)
            make.trailing.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nextButton.snp.top).offset(-16.sizeH)
        }

        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-20.sizeH)
            make.height.equalTo(40.sizeH)
            make.leading.equalToSuperview().inset(66.sizeW)
            make.trailing.equalToSuperview().offset(-66.sizeW)
        }
    }
}

//MARK: - helpers
extension OnboardingView {
    func scrollToPage(page: Int, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
        UIView.animate(withDuration: 0.3) {
            self.scrollView.contentOffset.x = self.scrollView.frame.width * CGFloat(page)
        } completion: { status in
            completion(status)
        }
    }
}
