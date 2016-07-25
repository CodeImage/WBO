//
//  LJOAuthController.m
//  WBO
//
//  Created by JackLou on 7/21/16.
//  Copyright © 2016 JackLou. All rights reserved.
//

#import "LJOAuthController.h"
#import "LJProgressView.h"
#import "LJOAuthControllerViewModel.h"
@interface LJOAuthController()<UIWebViewDelegate>
@property (nonatomic,strong) UIWebView *webView;
@property (nonatomic,strong) LJProgressView *progressView;
@end

@implementation LJOAuthController

#pragma mark - 生命周期方法

- (void)loadView{
    [super loadView];
    
    
    self.view = self.webView;
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self setupUI];
}


#pragma mark - 设置UI
- (void)setupUI{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"自动填充" style:UIBarButtonItemStylePlain target:self action:@selector(autoFill)];
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",kAppKey,kRedirectUri];
    
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    
    [self.view addSubview:self.progressView];
}


#pragma mark - 取消监听方法
- (void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 自动填充监听方法
- (void)autoFill{
    
    // OC中嵌入js命令
    NSString *jsString = @"document.getElementById('userId').value='rangyuan05788697@163.com',document.getElementById('passwd').value='bbb333'";
    [self.webView stringByEvaluatingJavaScriptFromString:jsString];
    
}

#pragma mark - UIWebView的代理方法
- (void)webViewDidStartLoad:(UIWebView *)webView{

    [self.progressView beginLoad];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{

    self.progressView.finished = YES;
    [self.progressView stopLoad];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

    [self.progressView stopLoad];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *urlString = request.URL.absoluteString;
    NSString *query = request.URL.query;
    
    // 有几个url，只有一个满足
    if (urlString && [urlString hasPrefix:kRedirectUri]) {
        
        NSString *code = [query substringFromIndex:[query rangeOfString:@"code="].length];
//        NSLog(@"%@",code);
        
        [[LJOAuthControllerViewModel sharedViewModel] getAccountInfoWithCode:code finished:^(BOOL isSuccess) {
            
            if (!isSuccess) {
                
                NSLog(@"%d",isSuccess);
                return;
            }
            
            
            [self dismissViewControllerAnimated:NO completion:^{
                
                [[NSNotificationCenter defaultCenter] postNotificationName:kSwitchRootVcNotification object:nil];
            }];
            
            
        }];
        
        return NO;
        
    }
    return YES;
}

#pragma mark - 懒加载
- (UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        _webView.opaque = NO;
    }
    return _webView;
}

- (LJProgressView *)progressView{
    if (!_progressView) {
        _progressView = [[LJProgressView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 3)];
        _progressView.tintColor = [UIColor greenColor];
    }
    return _progressView;
}
@end
