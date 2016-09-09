//
//  LYQReactiveTableVM.m
//  LYQNote
//
//  Created by 刘亚强 on 16/9/1.
//  Copyright © 2016年 liuyaqiang. All rights reserved.
//

#import "LYQReactiveTableVM.h"
#import "MBProgressHUD.h"

@interface LYQReactiveTableVM ()
{
    NSString *RACSiganalTestStr, *RACSubjectTestStr , *RACReplaySubjectTestStr, *RACSequenceTestStr, *RACCommandTestStr, *RACMulticastConnectionTestStr;
    NSString *ReactiveCocoaUniversalUseStr, *ReactiveCocoaUniversalDefineStr;
    NSString *ReactiveCocoaFlatternMapAndMapStr;
    NSString *RACSignalConcatStr, *RACSignalThenStr,*RACSignalMergeStr, *RACSignalZipWithStr, *RACSignalCombineLatestStr, *RACSignalReduceStr;
    NSString *RACFilterStr,
    *RACIgnoreStr,
    *RACDistinctUntilChangedStr,
    *RACTakeStr,
    *RACTakeLastStr,
    *RACTakeUntilStr,
    *RACSkipStr,
    *RACSwitchToLatestStr;
    NSString *RACDoNextAndDocompletedStr;
}

@property (nonatomic, strong) RACSignal *signal;
@property (nonatomic, strong) RACSubject *subject;
@property (nonatomic, strong) RACReplaySubject *replaySubject;
@property (nonatomic, strong) RACCommand *command;
@property (nonatomic, strong) RACSubject *signalOfsignals;

@end
@implementation LYQReactiveTableVM
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
}
- (void)initialization
{
    [self RACSignalExample];
    [self RACSubjectExample];
    [self RACReplaySubjectExample];
//    [self RACSequenceExample];
    [self RACCommandExample];
    [self ReactiveCocoaFlatternMapAndMapExample];
}
#pragma mark -
#pragma mark UITableViewDataSource/UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.0001f;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *rowArr = self.dataArr[section];
    return rowArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:16];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [self customCellWithCell:cell IndexPath:indexPath];
    
    return cell;
}
//定制cell
- (void)customCellWithCell:(UITableViewCell *)cell IndexPath:(NSIndexPath *)indexPath
{
    NSArray *rowArr = self.dataArr[indexPath.section];
    NSString *text = rowArr[indexPath.row];
    cell.textLabel.text = text;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self selectCellWithIndextPath:indexPath];
}
//选择cell
- (void)selectCellWithIndextPath:(NSIndexPath *)indexPath
{
    NSArray *rowArr = self.dataArr[indexPath.section];
    NSString *text = rowArr[indexPath.row];
    if (text == RACSiganalTestStr) {
        [self RACSignalSubscribe];
    }else if(text == RACSubjectTestStr){

        [self RACSubjectSend];
    }else if(text == RACReplaySubjectTestStr){
        [self RACReplaySubjectSend];
    }else if (text == RACSequenceTestStr){
        [self RACSequenceExample];

    }else if (text == RACCommandTestStr){
        [self RACCommandSend];
    }else if (text == RACMulticastConnectionTestStr){
        [self RACMulticastConnectionExample];
    }else if (text == ReactiveCocoaUniversalUseStr){
        if (self.DelegateSubject) {
            // 有值，才需要通知
            [self.DelegateSubject sendNext:text];
            [[_redV rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
                [self ReactiveCocoaUniversalUseExample];

            }];
        }
    }else if (text == ReactiveCocoaUniversalDefineStr){
        // 有值，才需要通知
        [self.DelegateSubject sendNext:text];
        [[_redV rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
            [self ReactiveCocoaUniversalDefineExample];
            
        }];
    }else if (text == ReactiveCocoaFlatternMapAndMapStr){
        [self signalOfsignalsSend];
    }else if (text == RACSignalConcatStr){
        [self RACSignalConcatExmaple];
    }else if (text == RACSignalThenStr){
        [self RACSignalThenExmaple];
    }else if (text == RACSignalMergeStr){
        [self RACSignalMergeExmaple];
    }else if (text == RACSignalZipWithStr){
        [self RACSignalZipWithExmaple];
    }else if (text == RACSignalCombineLatestStr){
        [self RACSignalCombineLatestExmaple];
    }else if (text == RACSignalReduceStr){
        [self RACSignalReduceExmaple];
    }else if (text == RACFilterStr){
        if (self.DelegateSubject) {
            // 有值，才需要通知
            [self.DelegateSubject sendNext:text];
            [[_redV rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
                [self RACFilterExample];
            }];
        }
    }else if (text == RACIgnoreStr){
        if (self.DelegateSubject) {
            // 有值，才需要通知
            [self.DelegateSubject sendNext:text];
            [[_redV rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
                [self RACIgnoreExample];
                
            }];
        }
    }else if (text == RACDistinctUntilChangedStr){
        if (self.DelegateSubject) {
            // 有值，才需要通知
            [self.DelegateSubject sendNext:text];
            [[_redV rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
                [self RACDistinctUntilChangedExample];
                
            }];
        }
    }else if (text == RACTakeStr){
        [self RACTakeExample];

    }else if (text == RACTakeLastStr){
        [self RACTakeLastExample];

    }else if (text == RACTakeUntilStr){
        if (self.DelegateSubject) {
            // 有值，才需要通知
            [self.DelegateSubject sendNext:text];
            [[_redV rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
                [self RACTakeUntilExample];
                
            }];
        }
    }else if (text == RACSkipStr){
        if (self.DelegateSubject) {
            // 有值，才需要通知
            [self.DelegateSubject sendNext:text];
            [[_redV rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
                [self RACSkipExample];
                
            }];
        }
    }else if (text == RACSwitchToLatestStr){
        [self RACSwitchToLatestExample];

    }else if (text == RACDoNextAndDocompletedStr){
        [self RACDoNextAndDocompletedExample];
    }
}
#pragma mark - RACSignalExample
/*
 6.1RACSiganl:信号类,一般表示将来有数据传递，只要有数据改变，信号内部接收到数据，就会马上发出数据。
 
 注意：
 
 信号类(RACSiganl)，只是表示当数据改变时，信号内部会发出数据，它本身不具备发送信号的能力，而是交给内部一个订阅者去发出。
 
 默认一个信号都是冷信号，也就是值改变了，也不会触发，只有订阅了这个信号，这个信号才会变为热信号，值改变了才会触发。
 
 如何订阅信号：调用信号RACSignal的subscribeNext就能订阅。
 
 文／峥吖（简书作者）
 原文链接：http://www.jianshu.com/p/87ef6720a096
 著作权归作者所有，转载请联系作者获得授权，并标注“简书作者”。
 */
- (void)RACSignalExample
{
    // RACSignal使用步骤：
    // 1.创建信号 + (RACSignal *)createSignal:(RACDisposable * (^)(id<RACSubscriber> subscriber))didSubscribe
    // 2.订阅信号,才会激活信号. - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
    // 3.发送信号 - (void)sendNext:(id)value
    
    
    // RACSignal底层实现：
    // 1.创建信号，首先把didSubscribe保存到信号中，还不会触发。
    // 2.当信号被订阅，也就是调用signal的subscribeNext:nextBlock
    // 2.2 subscribeNext内部会创建订阅者subscriber，并且把nextBlock保存到subscriber中。
    // 2.1 subscribeNext内部会调用siganl的didSubscribe
    // 3.siganl的didSubscribe中调用[subscriber sendNext:@1];
    // 3.1 sendNext底层其实就是执行subscriber的nextBlock

    self.signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
       
        [MBProgressHUD showHUD];
        // block调用时刻：每当有订阅者订阅信号，就会调用block。
         // 2.发送信号
        /*一般test*/
        [subscriber sendNext:@"你收到了吗"];

        /*延迟test*/
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [subscriber sendNext:@"你收到了吗"];
//
//        });
         /*定时器test*/
//        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerSendNext:) userInfo:subscriber repeats:YES];
//        [timer fire];
        
        
        // 如果不在发送数据，最好发送信号完成，内部会自动调用[RACDisposable disposable]取消订阅信号。
//        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            
            // block调用时刻：当信号发送完成或者发送错误，就会自动执行这个block,取消订阅信号。
            
            // 执行完Block后，当前信号就不在被订阅了。
            NSLog(@"信号被销毁");
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUD];
            });
        }];
        
//        return nil;
    }];
}
static int i;
- (void)timerSendNext:(NSTimer *)timer
{
    id<RACSubscriber> subscriber = [timer userInfo];
    [subscriber sendNext:@"你收到了吗"];
    i ++;
    if (i == 5) {
        [timer invalidate];
    }
}
- (void)RACSignalSubscribe
{
    // 3.订阅信号,才会激活信号.
    [self.signal subscribeNext:^(id x) {
        // block调用时刻：每当有信号发出数据，就会调用block.
        NSLog(@"接收到数据:%@",x);
    }];
}
#pragma mark - RACSubject和RACReplaySubject简单使用:
/*
 6.2 RACSubscriber:表示订阅者的意思，用于发送信号，这是一个协议，不是一个类，只要遵守这个协议，并且实现方法才能成为订阅者。通过create创建的信号，都有一个订阅者，帮助他发送数据。
 
 6.3 RACDisposable:用于取消订阅或者清理资源，当信号发送完成或者发送错误的时候，就会自动触发它。
 
 使用场景:不想监听某个信号时，可以通过它主动取消订阅信号。

6.4 RACSubject:RACSubject:信号提供者，自己可以充当信号，又能发送信号。
 
 使用场景:通常用来代替代理，有了它，就不必要定义代理了。
 RACReplaySubject:重复提供信号类，RACSubject的子类。
 
 RACReplaySubject与RACSubject区别:
 RACReplaySubject可以先发送信号，在订阅信号，RACSubject就不可以。
 使用场景一:如果一个信号每被订阅一次，就需要把之前的值重复发送一遍，使用重复提供信号类。
 使用场景二:可以设置capacity数量来限制缓存的value的数量,即只缓充最新的几个值。
 
 */
- (void)RACSubjectExample
{
    // RACSubject使用步骤
    // 1.创建信号 [RACSubject subject]，跟RACSiganl不一样，创建信号时没有block。
    // 2.订阅信号 - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
    // 3.发送信号 sendNext:(id)value
    
    // RACSubject:底层实现和RACSignal不一样。
    // 1.调用subscribeNext订阅信号，只是把订阅者保存起来，并且订阅者的nextBlock已经赋值了。
    // 2.调用sendNext发送信号，遍历刚刚保存的所有订阅者，一个一个调用订阅者的nextBlock。
    
    // 1.创建信号
    self.subject = [RACSubject subject];
    // 2.订阅信号
    [self.subject subscribeNext:^(id x) {
        // block调用时刻：当信号发出新值，就会调用.
        NSLog(@"第一个订阅者%@",x);
    }];
//    [self.subject subscribeNext:^(id x) {
//        // block调用时刻：当信号发出新值，就会调用.
//        NSLog(@"第二个订阅者%@",x);
//    }];
//    
    // 3.发送信号
//    [self.subject sendNext:@"1"];

}

- (void)RACSubjectSend
{
    [self.subject sendNext:self.signal];
    // 2.订阅信号
    //        [self.subject subscribeNext:^(id x) {
    //            // block调用时刻：当信号发出新值，就会调用.
    //            NSLog(@"第一个订阅者%@",x);
    //        }];
    //        [self.subject subscribeNext:^(id x) {
    //            // block调用时刻：当信号发出新值，就会调用.
    //            NSLog(@"第二个订阅者%@",x);
    //        }];
}
#pragma mark -
- (void)RACReplaySubjectExample
{
    // RACReplaySubject使用步骤:
    // 1.创建信号 [RACSubject subject]，跟RACSiganl不一样，创建信号时没有block。
    // 2.可以先订阅信号，也可以先发送信号。
    // 2.1 订阅信号 - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
    // 2.2 发送信号 sendNext:(id)value
    
    // RACReplaySubject:底层实现和RACSubject不一样。
    // 1.调用sendNext发送信号，把值保存起来，然后遍历刚刚保存的所有订阅者，一个一个调用订阅者的nextBlock。
    // 2.调用subscribeNext订阅信号，遍历保存的所有值，一个一个调用订阅者的nextBlock
    
    // 如果想当一个信号被订阅，就重复播放之前所有值，需要先发送信号，在订阅信号。
    // 也就是先保存值，在订阅值。
    
    // 1.创建信号
    self.replaySubject = [RACReplaySubject subject];
    
    // 2.发送信号
    [self.replaySubject sendNext:@1];
    [self.replaySubject sendNext:@2];
    
    // 3.订阅信号
//    [self.replaySubject subscribeNext:^(id x) {
//        
//        NSLog(@"第一个订阅者接收到的数据%@",x);
//    }];
//    
//    // 订阅信号
//    [self.replaySubject subscribeNext:^(id x) {
//        
//        NSLog(@"第二个订阅者接收到的数据%@",x);
//    }];
    
}
- (void)RACReplaySubjectSend
{
    //        // 2.发送信号
    //        [self.replaySubject sendNext:@1];
    //        [self.replaySubject sendNext:@2];
    //     3.订阅信号
    [self.replaySubject subscribeNext:^(id x) {
        
        NSLog(@"第一个订阅者接收到的数据%@",x);
    }];
    
    // 订阅信号
    [self.replaySubject subscribeNext:^(id x) {
        
        NSLog(@"第二个订阅者接收到的数据%@",x);
    }];
}
/**
 6.6RACTuple:元组类,类似NSArray,用来包装值.
 
 6.7RACSequence:RAC中的集合类，用于代替NSArray,NSDictionary,可以使用它来快速遍历数组和字典。
 
 */
#pragma mark - RACSequenceExample
- (void)RACSequenceExample
{
    // 1.遍历数组
    NSArray *numbers = @[@1,@2,@3,@4];
    
    // 这里其实是三步
    // 第一步: 把数组转换成集合RACSequence numbers.rac_sequence
    // 第二步: 把集合RACSequence转换RACSignal信号类,numbers.rac_sequence.signal
    // 第三步: 订阅信号，激活信号，会自动把集合中的所有值，遍历出来。
    [numbers.rac_sequence.signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    // 2.遍历字典,遍历出来的键值对会包装成RACTuple(元组对象)
    NSDictionary *dict = @{@"name":@"xmg",@"age":@18};
    [dict.rac_sequence.signal subscribeNext:^(RACTuple *x) {
        
        // 解包元组，会把元组的值，按顺序给参数里面的变量赋值
        RACTupleUnpack(NSString *key,NSString *value) = x;
        
        // 相当于以下写法
        //        NSString *key = x[0];
        //        NSString *value = x[1];
        
        NSLog(@"%@ %@",key,value); 
        
    }];
    /*
    // 3.字典转模型
    // 3.1 OC写法
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
    
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray *items = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArr) {
//        FlagItem *item = [FlagItem flagWithDict:dict];
//        [items addObject:item];
    }
    // 3.2 RAC写法
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
    
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray *flags = [NSMutableArray array];
    
    _flags = flags;
    
    // rac_sequence注意点：调用subscribeNext，并不会马上执行nextBlock，而是会等一会。
    [dictArr.rac_sequence.signal subscribeNext:^(id x) {
        // 运用RAC遍历字典，x：字典
        
        FlagItem *item = [FlagItem flagWithDict:x];
        
        [flags addObject:item];
        
    }];
    
    NSLog(@"%@",  NSStringFromCGRect([UIScreen mainScreen].bounds));
    
    
    // 3.3 RAC高级写法:
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
    
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:filePath];
    // map:映射的意思，目的：把原始值value映射成一个新值
    // array: 把集合转换成数组
    // 底层实现：当信号被订阅，会遍历集合中的原始值，映射成新值，并且保存到新的数组里。
    NSArray *flags = [[dictArr.rac_sequence map:^id(id value) {
        
        return [FlagItem flagWithDict:value];
        
    }] array];
    */
}

#pragma mark - RACCommand简单使用
/**
 *  6.8RACCommand:RAC中用于处理事件的类，可以把事件如何处理,事件中的数据如何传递，包装到这个类中，他可以很方便的监控事件的执行过程。
 
 使用场景:监听按钮点击，网络请求
 */
- (void)RACCommandExample
{
    // 一、RACCommand使用步骤:
    // 1.创建命令 initWithSignalBlock:(RACSignal * (^)(id input))signalBlock
    // 2.在signalBlock中，创建RACSignal，并且作为signalBlock的返回值
    // 3.执行命令 - (RACSignal *)execute:(id)input
    
    // 二、RACCommand使用注意:
    // 1.signalBlock必须要返回一个信号，不能传nil.
    // 2.如果不想要传递信号，直接创建空的信号[RACSignal empty];
    // 3.RACCommand中信号如果数据传递完，必须调用[subscriber sendCompleted]，这时命令才会执行完毕，否则永远处于执行中。
    // 4.RACCommand需要被强引用，否则接收不到RACCommand中的信号，因此RACCommand中的信号是延迟发送的。
    
    // 三、RACCommand设计思想：内部signalBlock为什么要返回一个信号，这个信号有什么用。
    // 1.在RAC开发中，通常会把网络请求封装到RACCommand，直接执行某个RACCommand就能发送请求。
    // 2.当RACCommand内部请求到数据的时候，需要把请求的数据传递给外界，这时候就需要通过signalBlock返回的信号传递了。
    
    // 四、如何拿到RACCommand中返回信号发出的数据。
    // 1.RACCommand有个执行信号源executionSignals，这个是signal of signals(信号的信号),意思是信号发出的数据是信号，不是普通的类型。
    // 2.订阅executionSignals就能拿到RACCommand中返回的信号，然后订阅signalBlock返回的信号，就能获取发出的值。
    
    // 五、监听当前命令是否正在执行executing
    
    // 六、使用场景,监听按钮点击，网络请求
    
    
    // 1.创建命令
    self.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        
        NSLog(@"执行命令 ：%@",input);
        
        // 创建空信号,必须返回信号
        //        return [RACSignal empty];
        
        // 2.创建信号,用来传递数据
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
            // 模仿网络延迟
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [subscriber sendNext:@"登录成功"];
                
                // 数据传送完毕，必须调用完成，否则命令永远处于执行状态
                [subscriber sendCompleted];
            });
            return nil;
        }];
        
    }];
    
    // 强引用命令，不要被销毁，否则接收不到数据
//    _conmmand = command;
    
    
    
    // 3.订阅RACCommand中的信号
    [self.command.executionSignals subscribeNext:^(id x) {
        
        [x subscribeNext:^(id x) {
            
            NSLog(@"收到：%@",x);
        }];
        
    }];
    
    // RAC高级用法
    // switchToLatest:用于signal of signals，获取signal of signals发出的最新信号,也就是可以直接拿到RACCommand中的信号
    [self.command.executionSignals.switchToLatest subscribeNext:^(id x) {
        NSLog(@"switchToLatest :%@",x);
    }];
    
    // 4.监听命令是否执行完毕,默认会来一次，可以直接跳过，skip表示跳过第一次信号。
    [[self.command.executing skip:1] subscribeNext:^(id x) {
      
        if ([x boolValue] == YES) {
            // 正在执行
            NSLog(@"正在执行");
            
        }else{
            // 执行完成
            NSLog(@"执行完成");
        }
        
    }];
    // 5.执行命令
//    [self.command execute:@1];
}

- (void)RACCommandSend
{
    // 5.执行命令
    [self.command execute:@1];
}
#pragma mark - RACMulticastConnectionExample
/*
 6.9RACMulticastConnection:用于当一个信号，被多次订阅时，为了保证创建信号时，避免多次调用创建信号中的block，造成副作用，可以使用这个类处理。
 
 使用注意:RACMulticastConnection通过RACSignal的-publish或者-muticast:方法创建.
 
 */
- (void)RACMulticastConnectionExample
{
    // RACMulticastConnection使用步骤:
    // 1.创建信号 + (RACSignal *)createSignal:(RACDisposable * (^)(id<RACSubscriber> subscriber))didSubscribe
    // 2.创建连接 RACMulticastConnection *connect = [signal publish];
    // 3.订阅信号,注意：订阅的不在是之前的信号，而是连接的信号。 [connect.signal subscribeNext:nextBlock]
    // 4.连接 [connect connect]
    
    // RACMulticastConnection底层原理:
    // 1.创建connect，connect.sourceSignal -> RACSignal(原始信号)  connect.signal -> RACSubject
    // 2.订阅connect.signal，会调用RACSubject的subscribeNext，创建订阅者，而且把订阅者保存起来，不会执行block。
    // 3.[connect connect]内部会订阅RACSignal(原始信号)，并且订阅者是RACSubject
    // 3.1.订阅原始信号，就会调用原始信号中的didSubscribe
    // 3.2 didSubscribe，拿到订阅者调用sendNext，其实是调用RACSubject的sendNext
    // 4.RACSubject的sendNext,会遍历RACSubject所有订阅者发送信号。
    // 4.1 因为刚刚第二步，都是在订阅RACSubject，因此会拿到第二步所有的订阅者，调用他们的nextBlock
    
    
    // 需求：假设在一个信号中发送请求，每次订阅一次都会发送请求，这样就会导致多次请求。
    // 解决：使用RACMulticastConnection就能解决.
    
/*
    // 1.创建请求信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        
        NSLog(@"发送请求");
        
        return nil;
    }];
    // 2.订阅信号
    [signal subscribeNext:^(id x) {
        
        NSLog(@"接收数据");
        
    }];
    // 2.订阅信号
    [signal subscribeNext:^(id x) {
        
        NSLog(@"接收数据");
        
    }];
    
    // 3.运行结果，会执行两遍发送请求，也就是每次订阅都会发送一次请求
    */
    
    // RACMulticastConnection:解决重复请求问题
    // 1.创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        
        NSLog(@"发送请求");
        [subscriber sendNext:@1];
        
        return nil;
    }];
    
    // 2.创建连接
    RACMulticastConnection *connect = [signal publish];
    
    // 3.订阅信号，
    // 注意：订阅信号，也不能激活信号，只是保存订阅者到数组，必须通过连接,当调用连接，就会一次性调用所有订阅者的sendNext:
    [connect.signal subscribeNext:^(id x) {
        
        NSLog(@"订阅者一信号");
        
    }];
    
    [connect.signal subscribeNext:^(id x) {
        
        NSLog(@"订阅者二信号");
        
    }];
    
    // 4.连接,激活信号
    [connect connect];
    
}
/*
6.10 RACScheduler:RAC中的队列，用GCD封装的。

6.11 RACUnit :表⽰stream不包含有意义的值,也就是看到这个，可以直接理解为nil.

6.12 RACEvent: 把数据包装成信号事件(signal event)。它主要通过RACSignal的-materialize来使用，然并卵。

*/
#pragma mark- ReactiveCocoa开发中常见用法 // 1.代替代理 // 2.KVO // 3.监听事件 // 4.代替通知 // 5.监听文本框的文字改变 // 6.处理多个请求，都返回结果的时候，统一做处理.
/*
 7.1 代替代理:
 
 rac_signalForSelector：用于替代代理。
 7.2 代替KVO :
 
 rac_valuesAndChangesForKeyPath：用于监听某个对象的属性改变。
 7.3 监听事件:
 
 rac_signalForControlEvents：用于监听某个事件。
 7.4 代替通知:
 
 rac_addObserverForName:用于监听某个通知。
 7.5 监听文本框文字改变:
 
 rac_textSignal:只要文本框发出改变就会发出这个信号。
 7.6 处理当界面有多次请求时，需要都获取到数据时，才能展示界面
 
 rac_liftSelector:withSignalsFromArray:Signals:当传入的Signals(信号数组)，每一个signal都至少sendNext过一次，就会去触发第一个selector参数的方法。
 使用注意：几个信号，参数一的方法就几个参数，每个参数对应信号发出的数据。

 */
- (void)ReactiveCocoaUniversalUseExample
{
    // 1.代替代理
    // 需求：自定义redView,监听红色view中按钮点击
    // 之前都是需要通过代理监听，给红色View添加一个代理属性，点击按钮的时候，通知代理做事情
    // rac_signalForSelector:把调用某个对象的方法的信息转换成信号，就要调用这个方法，就会发送信号。
    // 这里表示只要redV调用btnClick:,就会发出信号，订阅就好了。
    [[_redV rac_signalForSelector:@selector(btnClick:)] subscribeNext:^(id x) {
        NSLog(@"点击红色按钮");
    }];
    
    // 2.KVO
    // 把监听redV的center属性改变转换成信号，只要值改变就会发送信号
    // observer:可以传入nil
    [[_redV rac_valuesAndChangesForKeyPath:@"center" options:NSKeyValueObservingOptionNew observer:nil] subscribeNext:^(id x) {
        
        NSLog(@"string的文字改变为%@",x);
        _redV.testLabel.text = x[2][@"new"];
        
    }];
    
    // 3.监听事件
    // 把按钮点击事件转换为信号，点击按钮，就会发送信号
    [[_redV.btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        NSLog(@"按钮被点击了");
    }];
    
    // 4.代替通知
    // 把监听到的通知转换信号
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(id x) {
        NSLog(@"键盘弹出：%@",x);
    }];
    
    // 5.监听文本框的文字改变
    [_redV.textField.rac_textSignal subscribeNext:^(id x) {
        
        NSLog(@"文字改变了%@",x);
    }];
    
    // 6.处理多个请求，都返回结果的时候，统一做处理.
    RACSignal *request1 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        // 发送请求1
        [subscriber sendNext:@"发送请求1"];
        return nil;
    }];
    
    RACSignal *request2 = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        // 发送请求2
        [subscriber sendNext:@"发送请求2"];
        return nil;
    }];
    [request1 subscribeNext:^(id x) {
        NSLog(@"request1接收");
    }];
    [request2 subscribeNext:^(id x) {
        NSLog(@"request2接收");
    }];
    // 使用注意：几个信号，参数一的方法就几个参数，每个参数对应信号发出的数据。
    [self rac_liftSelector:@selector(updateUIWithR1:r2:) withSignalsFromArray:@[request1,request2]];
    
    
}
// 更新UI
- (void)updateUIWithR1:(id)data r2:(id)data1
{
    NSLog(@"更新UI%@  %@",data,data1);
}
#pragma mark -ReactiveCocoa常见宏
- (void)ReactiveCocoaUniversalDefineExample
{
// 8.ReactiveCocoa常见宏。
// 8.1 RAC(TARGET, [KEYPATH, [NIL_VALUE]]):用于给某个对象的某个属性绑定。
// 
 // 只要文本框文字改变，就会修改label的文字
    RAC(_redV.testLabel,text) = _redV.textField.rac_textSignal;
// 8.2 RACObserve(self, name):监听某个对象的某个属性,返回的是信号。
 
     [RACObserve(_redV, center) subscribeNext:^(id x) {
     
     NSLog(@"centerStr new vale:%@",x);
     }];
// 8.3  @weakify(Obj)和@strongify(Obj),一般两个都是配套使用,在主头文件(ReactiveCocoa.h)中并没有导入，需要自己手动导入，RACEXTScope.h才可以使用。但是每次导入都非常麻烦，只需要在主头文件自己导入就好了。
// 
// 8.4 RACTuplePack：把数据包装成RACTuple（元组类）
 
 // 把参数中的数据包装成元组
    RACTuple *tuple = RACTuplePack(@10,@20);
// 8.5 RACTupleUnpack：把RACTuple（元组类）解包成对应的数据。
 
 // 把参数中的数据包装成元组
    RACTuple *tuple2 = RACTuplePack(@"xmg",@20);
 
 // 解包元组，会把元组的值，按顺序给参数里面的变量赋值
 // name = @"xmg" age = @20
}

#pragma mark -FlatternMap和Map的区别
/*
1.FlatternMap中的Block返回信号。
2.Map中的Block返回对象。
3.开发中，如果信号发出的值不是信号，映射一般使用Map
4.开发中，如果信号发出的值是信号，映射一般使用FlatternMap。
*/
 - (void)ReactiveCocoaFlatternMapAndMapExample
{
    // 创建信号中的信号
    _signalOfsignals = [RACSubject subject];
    
    [[_signalOfsignals flattenMap:^RACStream *(id value) {
        
        // 当signalOfsignals的signals发出信号才会调用
        NSLog(@"value :%@",value);
        return value;
        
    }] subscribeNext:^(id x) {
        
        // 只有signalOfsignals的signal发出信号才会调用，因为内部订阅了bindBlock中返回的信号，也就是flattenMap返回的信号。
        // 也就是flattenMap返回的信号发出内容，才会调用。
        
        NSLog(@"%@aaa",x);
    }];
    
    // 信号的信号发送信号
//    [_signalOfsignals sendNext:signal];
    
    
    // 信号发送内容
//    [signal sendNext:@1];
}
- (void)signalOfsignalsSend
{

    RACSubject *signal = [RACSubject subject];
    [_signalOfsignals sendNext:signal];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [signal sendNext:@1];

    });

}
#pragma mark - ReactiveCocoa操作方法之组合。
//concat:按一定顺序拼接信号，当多个信号发出的时候，有顺序的接收信号。
- (void)RACSignalConcatExmaple
{
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@1];
        
        [subscriber sendCompleted];
        
        return nil;
    }];
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@2];
        
        return nil;
    }];
    
    // 把signalA拼接到signalB后，signalA发送完成，signalB才会被激活。
    RACSignal *concatSignal = [signalA concat:signalB];
    
    // 以后只需要面对拼接信号开发。
    // 订阅拼接的信号，不需要单独订阅signalA，signalB
    // 内部会自动订阅。
    // 注意：第一个信号必须发送完成，第二个信号才会被激活
    [concatSignal subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
        
    }];
    
    // concat底层实现:
    // 1.当拼接信号被订阅，就会调用拼接信号的didSubscribe
    // 2.didSubscribe中，会先订阅第一个源信号（signalA）
    // 3.会执行第一个源信号（signalA）的didSubscribe
    // 4.第一个源信号（signalA）didSubscribe中发送值，就会调用第一个源信号（signalA）订阅者的nextBlock,通过拼接信号的订阅者把值发送出来.
    // 5.第一个源信号（signalA）didSubscribe中发送完成，就会调用第一个源信号（signalA）订阅者的completedBlock,订阅第二个源信号（signalB）这时候才激活（signalB）。
    // 6.订阅第二个源信号（signalB）,执行第二个源信号（signalB）的didSubscribe
    // 7.第二个源信号（signalA）didSubscribe中发送值,就会通过拼接信号的订阅者把值发送出来.
}
//then:用于连接两个信号，当第一个信号完成，才会连接then返回的信号。
- (void)RACSignalThenExmaple
{
    // then:用于连接两个信号，当第一个信号完成，才会连接then返回的信号
    // 注意使用then，之前信号的值会被忽略掉.
    // 底层实现：1、先过滤掉之前的信号发出的值。2.使用concat连接then返回的信号
    [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@1];
        [subscriber sendCompleted];
        return nil;
    }] then:^RACSignal *{
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@2];
            return nil;
        }];
    }] subscribeNext:^(id x) {
        
        // 只能接收到第二个信号的值，也就是then返回信号的值
        NSLog(@"%@",x);
    }];
}
//merge:把多个信号合并为一个信号，任何一个信号有新值的时候就会调用
- (void)RACSignalMergeExmaple
{
    // merge:把多个信号合并成一个信号
    //创建多个信号
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@1];
        
        
        return nil;
    }];
    
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@2];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@3];
        });
        return nil;
    }];
    
    // 合并信号,任何一个信号发送数据，都能监听到.
    RACSignal *mergeSignal = [signalA merge:signalB];
    
    [mergeSignal subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
        
    }];
    // 底层实现：
    // 1.合并信号被订阅的时候，就会遍历所有信号，并且发出这些信号。
    // 2.每发出一个信号，这个信号就会被订阅
    // 3.也就是合并信号一被订阅，就会订阅里面所有的信号。
    // 4.只要有一个信号被发出就会被监听。
}
//zipWith:把两个信号压缩成一个信号，只有当两个信号同时发出信号内容时，并且把两个信号的内容合并成一个元组，才会触发压缩流的next事件。
- (void)RACSignalZipWithExmaple
{
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@1];
        
        
        return nil;
    }];
    
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@2];
        
        return nil;
    }];
    
    
    
    // 压缩信号A，信号B
    RACSignal *zipSignal = [signalA zipWith:signalB];
    
    [zipSignal subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    
    // 底层实现:
    // 1.定义压缩信号，内部就会自动订阅signalA，signalB
    // 2.每当signalA或者signalB发出信号，就会判断signalA，signalB有没有发出个信号，有就会把最近发出的信号都包装成元组发出。
}
//combineLatest:将多个信号合并起来，并且拿到各个信号的最新的值,必须每个合并的signal至少都有过一次sendNext，才会触发合并的信号。
- (void)RACSignalCombineLatestExmaple
{
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@1];
        
        return nil;
    }];
    
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@2];
        
        return nil;
    }];
    
    // 把两个信号组合成一个信号,跟zip一样，没什么区别
    RACSignal *combineSignal = [signalA combineLatestWith:signalB];
    
    [combineSignal subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    
    // 底层实现：
    // 1.当组合信号被订阅，内部会自动订阅signalA，signalB,必须两个信号都发出内容，才会被触发。
    // 2.并且把两个信号组合成元组发出。
}
//reduce聚合:用于信号发出的内容是元组，把信号发出元组的值聚合成一个值
- (void)RACSignalReduceExmaple
{
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@1];
        
        return nil;
    }];
    
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@2];
        
        return nil;
    }];
    
    // 聚合
    // 常见的用法，（先组合在聚合）。combineLatest:(id<NSFastEnumeration>)signals reduce:(id (^)())reduceBlock
    // reduce中的block简介:
    // reduceblcok中的参数，有多少信号组合，reduceblcok就有多少参数，每个参数就是之前信号发出的内容
    // reduceblcok的返回值：聚合信号之后的内容。
    RACSignal *reduceSignal = [RACSignal combineLatest:@[signalA,signalB] reduce:^id(NSNumber *num1 ,NSNumber *num2){
        
        return [NSString stringWithFormat:@"%@ %@",num1,num2];
        
    }];
    
    [reduceSignal subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    
    // 底层实现:
    // 1.订阅聚合信号，每次有内容发出，就会执行reduceblcok，把信号内容转换成reduceblcok返回的值
}
#pragma mark - 1.6 ReactiveCocoa操作方法之过滤。
//filter:过滤信号，使用它可以获取满足条件的信号.
- (void)RACFilterExample
{
    // 过滤:
    // 每次信号发出，会先执行过滤条件判断.
//    [_redV.textField.rac_textSignal filter:^BOOL(NSString *value) {
//        NSLog(@"%@",value);
//        return value.length > 3;
//    }];
    [[_redV.textField.rac_textSignal filter:^BOOL(NSString *value) {
        NSLog(@"<><>%@",value);
        return value.length > 3;
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];

}
//ignore:忽略完某些值的信号.
- (void)RACIgnoreExample
{
    // 内部调用filter过滤，忽略掉ignore的值
    [[_redV.textField.rac_textSignal ignore:@"1"] subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
}
//distinctUntilChanged:当上一次的值和当前的值有明显的变化就会发出信号，否则会被忽略掉。
- (void)RACDistinctUntilChangedExample
{
    // 过滤，当上一次和当前的值不一样，就会发出内容。
    // 在开发中，刷新UI经常使用，只有两次数据不一样才需要刷新
    [[_redV.textField.rac_textSignal distinctUntilChanged] subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
}
//take:从开始一共取N次的信号
- (void)RACTakeExample
{
    // 1、创建信号
    RACSubject *signal = [RACSubject subject];
    
    // 2、处理信号，订阅信号
    [[signal take:1] subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    
    // 3.发送信号
    [signal sendNext:@1];
    
    [signal sendNext:@2];
}
//takeLast:取最后N次的信号,前提条件，订阅者必须调用完成，因为只有完成，就知道总共有多少信号.
- (void)RACTakeLastExample
{
    // 1、创建信号
    RACSubject *signal = [RACSubject subject];
    
    // 2、处理信号，订阅信号
    [[signal takeLast:1] subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    
    // 3.发送信号
    [signal sendNext:@1];
    
    [signal sendNext:@2];
    
    [signal sendCompleted];
}
//takeUntil:(RACSignal *):获取信号直到某个信号执行完成
- (void)RACTakeUntilExample
{
    // 监听文本框的改变直到当前对象被销毁
    [[_redV.textField.rac_textSignal takeUntil:self.signal] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
//    self.rac_willDeallocSignal
    
}
//skip:(NSUInteger):跳过几个信号,不接受。
- (void)RACSkipExample
{
    [_redV.textField.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"原始：%@",x);

    }];
    // 表示输入第一次，不会被监听到，跳过第一次发出的信号
    [[_redV.textField.rac_textSignal skip:1] subscribeNext:^(id x) {
        
        NSLog(@"跳过第一次：%@",x);
    }];
}
//switchToLatest:用于signalOfSignals（信号的信号），有时候信号也会发出信号，会在signalOfSignals中，获取signalOfSignals发送的最新信号。
- (void)RACSwitchToLatestExample
{
    RACSubject *signalOfSignals = [RACSubject subject];
    RACSubject *signal = [RACSubject subject];
    
    // 获取信号中信号最近发出信号，订阅最近发出的信号。
    // 注意switchToLatest：只能用于信号中的信号
    [signalOfSignals.switchToLatest subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];
    [signalOfSignals sendNext:signal];
    [signal sendNext:@1];
    [signal sendNext:@2];

}
#pragma mark - 1.7 ReactiveCocoa操作方法之秩序
//doNext: 执行Next之前，会先执行这个Block
//doCompleted: 执行sendCompleted之前，会先执行这个Block
- (void)RACDoNextAndDocompletedExample
{
    [[[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@1];
        [subscriber sendCompleted];
        return nil;
    }] doNext:^(id x) {
        // 执行[subscriber sendNext:@1];之前会调用这个Block
        NSLog(@"doNext");;
    }] doCompleted:^{
        // 执行[subscriber sendCompleted];之前会调用这个Block
        NSLog(@"doCompleted");;
        
    }] subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
    }];

}
#pragma mark -1.8 ReactiveCocoa操作方法之线程。
/* 
    deliverOn: 内容传递切换到制定线程中，副作用在原来线程中,把在创建信号时block中的代码称之为副作用。
 
    subscribeOn: 内容传递和副作用都会切换到制定线程中。
 */
#pragma mark -
#pragma mark - Get

- (NSArray *)dataArr
{
    RACSiganalTestStr = @"RACSiganalTest",
    RACSubjectTestStr = @"RACSubjectTest",
    RACReplaySubjectTestStr = @"RACReplaySubjectTest" ,
    RACSequenceTestStr = @"RACSequenceTest",
    RACCommandTestStr = @"RACCommandTest",
    RACMulticastConnectionTestStr = @"RACMulticastConnectionTest",
    ReactiveCocoaUniversalUseStr = @"ReactiveCocoaUniversalUseTest",
   
    ReactiveCocoaUniversalDefineStr = @"ReactiveCocoaUniversalDefineTest";
    
    ReactiveCocoaFlatternMapAndMapStr = @"ReactiveCocoaFlatternMapAndMapTest";
   
    RACSignalConcatStr = @"RACSignalConcatTest",
    RACSignalThenStr = @"RACSignalThenTest",
    RACSignalMergeStr = @"RACSignalMergeTest",
    RACSignalZipWithStr = @"RACSignalZipWithTest",
    RACSignalCombineLatestStr = @"RACSignalCombineLatestTest",
    RACSignalReduceStr = @"RACSignalReduceTest";
   
    RACFilterStr = @"RACFilterTest",
    RACIgnoreStr = @"RACIgnoreTest",
    RACDistinctUntilChangedStr = @"RACDistinctUntilChangedTest",
    RACTakeStr = @"RACTakeTest",
    RACTakeLastStr = @"RACTakeLastTest",
    RACTakeUntilStr = @"RACTakeUntilTest",
    RACSkipStr = @"RACSkipTest",
    RACSwitchToLatestStr = @"RACSwitchToLatestTest";
    
    RACDoNextAndDocompletedStr = @"RACDoNextAndDocompletedTest";
    
    if (!_dataArr) {
        _dataArr = @[
                     @[RACSiganalTestStr,
                     RACSubjectTestStr,
                     RACReplaySubjectTestStr,
                     RACSequenceTestStr,
                     RACCommandTestStr,
                     RACMulticastConnectionTestStr],
                     @[ReactiveCocoaUniversalUseStr,
                     ReactiveCocoaUniversalDefineStr],
                     @[ReactiveCocoaFlatternMapAndMapStr],
                     @[RACSignalConcatStr,
                       RACSignalThenStr,
                       RACSignalMergeStr,
                       RACSignalZipWithStr,
                       RACSignalCombineLatestStr,
                       RACSignalReduceStr],
                     @[RACFilterStr,
                     RACIgnoreStr,
                     RACDistinctUntilChangedStr,
                     RACTakeStr,
                     RACTakeLastStr,
                     RACTakeUntilStr,
                     RACSkipStr,
                     RACSwitchToLatestStr],
                     @[RACDoNextAndDocompletedStr]

                     ];
    }
     return _dataArr;
}

@end
