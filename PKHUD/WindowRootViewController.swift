//
//  PKHUD.WindowRootViewController.swift
//  PKHUD
//
//  Created by Philip Kluz on 6/18/14.
//  Copyright (c) 2016 NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import UIKit

/// Serves as a configuration relay controller, tapping into the main window's rootViewController settings.
internal class WindowRootViewController: UIViewController {

    private var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .filter { $0.activationState == .foregroundActive }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }

    internal override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let rootViewController = UIApplication.shared.delegate?.window??.rootViewController {
            return rootViewController.supportedInterfaceOrientations
        } else {
            return UIInterfaceOrientationMask.portrait
        }
    }

    internal override var preferredStatusBarStyle: UIStatusBarStyle {
        if let presentingViewController = presentingViewController {
            return presentingViewController.preferredStatusBarStyle
        } else if let rootViewController = keyWindow?.rootViewController {
            return rootViewController.preferredStatusBarStyle
        } else {
            return .default
        }
    }
    internal override var prefersStatusBarHidden: Bool {
        if let presentingViewController = presentingViewController {
            return presentingViewController.prefersStatusBarHidden
        } else if let rootViewController = keyWindow?.rootViewController {
            return rootViewController.prefersStatusBarHidden
        } else {
            return false
        }
    }

    internal override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        if let rootViewController = UIApplication.shared.delegate?.window??.rootViewController {
            return rootViewController.preferredStatusBarUpdateAnimation
        } else {
            return .none
        }
    }

    internal override var shouldAutorotate: Bool {
        if let rootViewController = UIApplication.shared.delegate?.window??.rootViewController {
            return rootViewController.shouldAutorotate
        } else {
            return false
        }
    }
}
