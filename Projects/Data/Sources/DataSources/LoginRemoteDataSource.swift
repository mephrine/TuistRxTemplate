import Foundation
import RxSwift
import NetworkService
import InjectPropertyWrapper
import NetworkAPIKit
import UtilityKit
import Logger

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
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601withFractionalSeconds
    decoder.keyDecodingStrategy = .convertFromSnakeCase

    return service.request(.login(loginID: loginID, password: password))
      .map(ResultDTO<UserModel>.self, using: decoder, failsOnEmptyData: false)
      .asObservable()
      .flatMap({ response -> Observable<ResultDTO<UserModel>> in
        Observable<ResultDTO<UserModel>>.create { observer in
          if response.statusCode == "400" {
            observer.onError(LoginError.loginInfoMismatch)
          } else {
            observer.onNext(response)
            observer.onCompleted()
          }
          return Disposables.create()
        }
      })
      .map { $0.resultData ?? UserModel.empty() }
      .asSingle()
  }
}
