# Memorable
# 难忘

![](https://github.com/ChangWenWu/Memorable/blob/master/Memorable/Assets.xcassets/AppIcon.appiconset/95600db12cf2477287b3b90f1b86dc14.png?raw=true)

**Memorable**是基于艾宾浩斯遗忘曲线，可设定定期记忆任务的APP。

**Memorable**采用MVVM模式，使用RxSwift用于数据绑定。

项目整体分为3层：

##### Domain
只提供应用所有需要调用的协议接口，无具体实现，不依赖UIKit或任何三方库。
##### Platform
实现Domain层声明的接口，并隐藏具体实现。应用可能需从多个平台拉取数据，如Realm，Core Data或网络层，不同平台有不同的实现方式。
##### Application
负责信息展示和接收用户输入，采用MVVM架构，ViewController只负责UI绑定，真正的业务逻辑封装在ViewModel中

![](https://github.com/sergdort/CleanArchitectureRxSwift/raw/master/Architecture/ModulesDetails.png)

## FrameWork
- [RxSwift](https://github.com/ReactiveX/RxSwift)
- [FoldingCell](https://github.com/martijn00/FoldingCell)
- [TZImagePickerController](https://github.com/banchichen/TZImagePickerController)
- [RxRealm](https://github.com/RxSwiftCommunity/RxRealm)
- [RxAlamofire](https://github.com/RxSwiftCommunity/RxAlamofire)

