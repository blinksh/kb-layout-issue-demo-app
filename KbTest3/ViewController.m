//
//  ViewController.m
//  KbTest3
//
//  Created by Yury Korolev on 02.08.2022.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
  UITextView *_textView;
  UIView *_kbTrackerView;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  _kbTrackerView = [[UIView alloc] init];
  [_kbTrackerView setTranslatesAutoresizingMaskIntoConstraints:NO];
  _kbTrackerView.backgroundColor = [UIColor redColor];
  [self.view addSubview:_kbTrackerView];
  
  [[_kbTrackerView.leadingAnchor constraintEqualToAnchor:self.view.keyboardLayoutGuide.leadingAnchor] setActive:YES];
  [[_kbTrackerView.widthAnchor constraintEqualToAnchor: self.view.keyboardLayoutGuide.widthAnchor] setActive:YES];
  [[_kbTrackerView.heightAnchor constraintEqualToAnchor: self.view.keyboardLayoutGuide.heightAnchor] setActive:YES];
  [[_kbTrackerView.bottomAnchor constraintEqualToAnchor:self.view.keyboardLayoutGuide.bottomAnchor] setActive:YES];
  self.view.keyboardLayoutGuide.followsUndockedKeyboard = YES;
  
  
  _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
  [self.view addSubview:_textView];
  
  NSNotificationCenter *nc =  NSNotificationCenter.defaultCenter;
  
  [nc addObserver:self selector:@selector(_kbFrameChanged:) name:UIKeyboardDidChangeFrameNotification object:nil];
  
  [nc addObserver:self selector:@selector(_kbDidShow:) name:UIKeyboardDidShowNotification object:nil];
  [nc addObserver:self selector:@selector(_kbDidHide:) name:UIKeyboardDidHideNotification object:nil];
}

- (void)_kbFrameChanged:(NSNotification *) info {
  NSLog(@"frame changed %@ %@", info.userInfo[UIKeyboardIsLocalUserInfoKey], info.userInfo[UIKeyboardFrameEndUserInfoKey]);
}

- (void)_kbDidShow:(NSNotification *) info {
  NSLog(@"did show %@", info.userInfo[UIKeyboardIsLocalUserInfoKey]);
}

- (void)_kbDidHide:(NSNotification *) info {
  NSLog(@"did hide %@", info.userInfo[UIKeyboardIsLocalUserInfoKey]);
}

- (void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  
  NSLog(@"lgframe %@", @(self.view.keyboardLayoutGuide.layoutFrame));
}

@end
