# TODO
* - [x] Tuist 2.2.1 버전으로 올리기
    - Xcode 13.1 버전 필수 -> Xcode 13.1은 macOS 12 버전 이상이 필수 조건.
    - Xcode 13.1 부터 Concurrency 모듈을 지원하기 때문에 필수!!
    - 주로 문법만 변경된 수준! 사내 플젝에서 2.2.1 버전용으로 컨버팅 했을 때 생각보다 금방 수정했음!
* - [x] **Localizable**
* - [x] UserInterface에서 LocalizableString 프레임워크로 따로 관리하도록 변경 
* - [x] Feature에 UserInterface 레이어 추가 </br>
-> Preview는 Static Framework에서 실행할 수 없기 때문에, Dynamic Framework로 구성된 UserInterface에서 UIKit으로 View를 코드로 그리며 Preview를 활용하기 위한 용도
* - [ ] 아래 구조로 변경해보기 (사내 플젝에 적용한 것 옮기기)
    - [x] 파일 Template 만들기
    - [x] Feature 구조 생성하는 스크립트 만들기 
```
Feature
├── FeatureInterface
│   ├── Sources
│   └── Tests
├── FeatureData
│   ├── Sources
│   │   ├── DataSources
│   │   ├── Repositories
│   │   └── Models
│   └── Tests
│       ├── DataSources
│       ├── Repositories
│       └── Models
├── FeatureDomain
│   ├── Sources
│   │   ├── Repositories
│   │   ├── UseCases
│   │   └── Entities
│   └── Tests
│       ├── Repositories
│       ├── UseCases
│       └── Entities
├── FeaturePresentation
│   ├── Sources
│   │   ├── Routers
│   │   ├── ViewControllers
│   │   └── ViewModels
│   └── Tests
│       ├── Routers
│       ├── ViewControllers
│       └── ViewModels
└── FeatureUserInterface
    ├── Sources
    │   └── Views
    └── Tests
        └── Views
```
* - [ ] **CI/CD**
    - [ ] **Fastlane**
    - [ ] **GitAction**

## Tuist Version 관리
Tuist 설치를 하면 실행 파일은 아래 경로에 설치가 되며, 우리가 흔히 `tuist generate` 등의 명령어를 실행하면 해당 파일이 실행된다.

그리고 실제 버전별 설치되는 경로도 따로 있으며,
아래 버전 경로를 보면 우리가 설치한 Tuist 버전들이 있다.

- **실행 파일 경로 : /usr/local/bin/tuist**
- **실제 사용되는 버전 경로 : /Users/사용자/.tuist/Versions**

<br>

### 이전 버전 사용하기
실행 파일은 가장 최신 버전의 Tuist를 실행하기 때문에,
이전 버전을 사용하고 싶다면 그 이후의 버전들을 제거하면 된다.

<br>

### 최신 버전 사용하기
만약 curl 로 설치하는 것보다 최신 버전을 실행하고 싶다면,
git에서 최신 버전을 zip파일로 다운로드 받고 압축을 해제한 디렉토리명을 해당 버전으로 변경해서
버전 경로에 넣어주면 된다.

<br>

## Reference By
- [민소네님 Git](https://github.com/minsOne/iOSApplicationTemplate)
- [민소네님 블로그](https://minsone.github.io/archive)
- [ElonPark님 Git](https://github.com/ElonPark/RIBsReactorKit)
