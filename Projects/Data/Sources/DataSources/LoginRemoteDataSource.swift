import Foundation
import RxSwift
import NetworkService
import InjectPropertyWrapper
import NetworkAPIKit
import UtilityKit

public protocol LoginRemoteDataSource {
  func requestLogin(loginID: String, password: String) -> Single<UserModel>
}

public struct LoginRemoteDataSourceImpl: LoginRemoteDataSource {
  // MARK: - Inject
  @Inject private var service: Networking<LoginService>
  
  // MARK: - Initialize
  public init() {}
  
  // MARK: - Implementation
  public func requestLogin(loginID: String, password: String) -> Single<UserModel> {
    service.rx.request(.login(loginID: loginID, password: password))
      .map(to: ResultDTO<UserModel>.self)
      .asObservable()
      .flatMap({ response -> Observable<ResultDTO<UserModel>> in
        Observable<ResultDTO<UserModel>>.create { observer in
          if response.resultCode == "400" {
            observer.onError(LoginError.loginInfoMismatch)
          } else {
            observer.onNext(response)
            observer.onCompleted()
          }
          return Disposables.create()
        }
      })
      .map { $0.result ?? UserModel.empty() }
      .asSingle()
  }
}
