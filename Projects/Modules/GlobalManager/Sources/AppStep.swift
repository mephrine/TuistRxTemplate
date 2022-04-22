//
//  AppStep.swift
//  UtilityKit
//
//  Created by Mephrine on 2022/01/11.
//  Copyright © 2022 deepfine. All rights reserved.
//

import SocketService
import RxFlow
import RxSwift
import WebRTCInterface

public enum AppStep: Step {
  // MARK: - Launched
  case appIsLaunched
  case loginIsRequired
  
  // MARK: - Login
  case userIsLoggedIn
  
  // MARK: - Main
  case userIsLoggedOut
  
  // MARK: - Contact
  case contactListIsRequired
  
  // MARK: - Conference
  case conferenceListIsRequired
  case getCallIsRequired(fromCaller: Caller)
  case conferenceIsComplete
  case waitingConferenceIsRequired
  case videoConferenceIsRequired(withCaller: Caller, isMeCaller: Bool, completeion: (() -> Void))
  case videoConferenceIsComplete(completeion: (() -> Void)?)
	case participantsListIsRequired(withParticipants: Observable<[Participant]>, listener: PresentableListener)
  case participantsListIsComplete
  case chattingIsRequired(with: Observable<[ChatType]>, roomKey: String, roomTitle: String, listener: PresentableListener)
	case chattingIsComplete
	case imageViewerIsRequired(with: Observable<[ChatFile]>, position: Int)
	case imageViewerIsComplete
  case fileAttachmentPopupIsRequired(listener: PresentableListener)
  case fileAttachmentPopupIsComplete
  
  // MARK: - More
  case moreViewIsRequired
  
  // MARK: - WebView
  case mainWebViewIsRequire
  case subWebViewIsRequire(urlString: String)
}
