//
//  BottomSheetViewController.swift
//  BottomSheet
//
//  Created by Ricardo Yamaguchi on 25/09/21.
//

import UIKit

private enum SwipeDirection {
    case up
    case down
    case none
}

public class BottomSheetViewController: UIViewController {

    private var direction: SwipeDirection = .none
    private var currentViewHeight: CGFloat = 0.0
    private var startY: CGFloat = 0.0

    @IBOutlet private weak var bottomSheetView: UIView? {
        didSet {
            bottomSheetView?.backgroundColor = .white

            let gesture = UIPanGestureRecognizer(target: self, action: #selector(didSwipe))
            bottomSheetView?.addGestureRecognizer(gesture)
            bottomSheetView?.isUserInteractionEnabled = true
            gesture.delegate = self

            currentViewHeight = bottomSheetView?.bounds.height ?? 0.0

        }
    }

    @IBOutlet weak var bottomSheetViewHeight: NSLayoutConstraint?

    public init() {
        super.init(nibName: "BottomSheetViewController", bundle: Bundle(for: BottomSheetViewController.self))
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func setup() {
        view.backgroundColor = .clear
    }

    @objc
    private func didSwipe(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            didBegin(y: gesture.location(in: view).y)
        case .changed:
            didChange(y: gesture.translation(in: view).y)
            gesture.setTranslation(CGPoint.zero, in: view)
        case .ended:
            didEnd(y: gesture.location(in: view).y)
        default:
            break
        }
        view.layoutIfNeeded()
    }

    private func didBegin(y: CGFloat) {
        startY = y
    }

    private func didChange(y: CGFloat) {
        direction = .none
        if y < 0 {
            direction = .up
        } else if y > 0 {
            direction = .down
        }
        bottomSheetViewHeight?.constant -= y
    }

    private func didEnd(y: CGFloat) {
        let distance = abs(startY - y)
        switch direction {
        case .up where distance > CGFloat(Constants.kMinimalDistance):
            didSwipeUp()
        case .down where distance > CGFloat(Constants.kMinimalDistance):
            didSwipeDown()
        default:
            resetState()
        }
        UIView.animate(withDuration: Constants.kAnimationTime) {
            self.view.layoutIfNeeded()
        }
        direction = .none
    }

    private func didSwipeUp() {
        bottomSheetViewHeight?.constant = view.bounds.height
        currentViewHeight = view.bounds.height
    }

    private func didSwipeDown() {
        bottomSheetViewHeight?.constant = 120
        currentViewHeight = 120
    }

    private func resetState() {
        bottomSheetViewHeight?.constant = currentViewHeight
    }

}

extension BottomSheetViewController: UIGestureRecognizerDelegate {

}
