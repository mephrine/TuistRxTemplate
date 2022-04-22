import Foundation
import Domain
import RxSwift
import RxSwiftExt
import InjectPropertyWrapper

public struct LoginRepositoryImpl: LoginRepository {
  // MARK: - Inject
  @Inject private var remoteDataSource: LoginRemoteDataSource
  @Inject private var localDataSource: LoginLocalDataSource

  // MARK: - Initialize
  public init() {}

  // MARK: - Implementation
  public func requestLoginUser(_ loginID: String, _ password: String) -> Single<User> {
    remoteDataSource.requestLogin(loginID: loginID, password: password)
      .do(onSuccess: { _ in
        localDataSource.saveUserID(loginID: loginID)
      })
      .map { $0.toEntity() }
  }

  public func requestCachingLoginId() -> Single<String> {
    localDataSource.lastLoggedInUserID()
  }
}
