# OPNetAdapter

对AFNetworking简单封装，为了使接口请求以及返回数据解析标准化，以便于自动生成请求和模型代码，减少工作量，提高工作效率。

大致的思路是一个接口对应于一个OPDataRequest，而一个OPDataRequest对应一个Model，而返回数据的解析是通过OPDataResponse。

以GitHub的 https://api.github.com/users/ 接口为例，这个接口的有一个参数是用户名。因为GitHub的接口是RESTFul风格的，而我们之前的接口还是比较传统的后面跟了一堆`?xxx=yyy&aaa=bbb`这种，如果是这种形式的URL，那需要实现`- (NSDictionary *)parametersMap;`。而GitHub这种形式的话，只要在`- (void)prepareForRequest;`中拼接`path`即可。

```objective-c
- (void)prepareForRequest {
    NSAssert(self.username != nil, @"username cant be nil");
    self.domain = @"https://api.github.com";
    self.path = [NSString stringWithFormat:@"/users/%@", self.username];
}
```

OPDataResponse主要任务是解析返回数据，它应对的是接口返回的JSON数据的表现形式，比如是列表或者单一的对象，或者是某种格式，比如：

```
{ 
	“code” ：0, 
	“message”: “success”, 
	data: { … } 
}
```

用code表示返回结果的状态，message是说明，而data是真正的返回数据。但是在GitHub的接口，code直接对应的是HTTP的状态码，所以在Example里重写了OPDataResponse的init方法，来专门处理GitHub的返回结果，但是并没有处理HTTP状态码。

目前在我们的项目中实现了请求和模型的自动生成，我在用GitHub做样例的时候也验证了灵活性。但是其中不少细节还需要进一步优化，所以这个项目主要是起一个参考作用，给大家提供一个思路，接下来还会继续演化。现在想到的是，定义成Protocol，然后OPDataRequest作为具体实现。如果用Swift直接使用Extension来默认实现Protocol就行，会更加方便。作为Protocol的话，会更加灵活。

另外，还会把自动生成代码的部分添加进来，考虑大多数公司的情况，自动代码生成部分会额外做成一个小工具，适用更多场景。

### Updated[2018-11-09]

增加了HTTP代理设置，可以配合[MockServer](http://www.mock-server.com)进行数据Mock。

使用说明：

首先启动MockServer，

```
java -jar mockserver-netty-5.4.1-jar-with-dependencies.jar -serverPort 1080 -logLevel INFO
```

然后在代码中启用HTTP代理，

```
[OPDataRequestConfig setHttpProxy:@"localhost" port:1080];
[OPDataRequestConfig setHttpProxyEnable:YES];
```

> 注意上面的设置仅适用于模拟器，如果使用真机，需要确保真机与电脑在同一局域网，然后将localhost改为电脑的IP地址。

关于MockServer的使用请详见其官方网站，可以使用我写的这个简易网页[客户端](https://gist.github.com/sunboshi/8315c34e18213eb769456720d4d6dfa5)创建Mock数据。