//
//  JMViewController.m
//  JMMessageInput
//
//  Created by staeblorette on 01/04/2018.
//  Copyright (c) 2018 staeblorette. All rights reserved.
//

#import "JMViewController.h"

@interface JMViewController () <UITableViewDataSource>
@property (nonatomic, strong) UITableViewController *testViewController;
@end

@implementation JMViewController

- (IBAction)back:(UIStoryboardSegue *)segue {
	// Optional place to read data from closing controller
}

- (IBAction)showChatInputBar:(id)sender {
	JMMessageInputController *controller = [[JMMessageInputController alloc] initWithInputBarClass:nil];
	controller.view.backgroundColor = [UIColor whiteColor];
	[self presentViewController:controller animated:YES completion:nil];
	// Configure Buttons
	[controller.inputBar.leftAccessoryButton setTitle:@"+" forState:UIControlStateNormal];
	[controller.inputBar.rightAccessoryButton setTitle:@"-" forState:UIControlStateNormal];
	[controller.inputBar.sendButton setTitle:@"S" forState:UIControlStateNormal];
	
	// Configure text view
	controller.inputBar.textView.layer.cornerRadius = 20;
	controller.inputBar.textView.layer.borderWidth = 1.0f;
	controller.inputBar.textView.layer.borderColor = [UIColor colorWithWhite:0.8f alpha:1.0f].CGColor;
	
	// Configure send Button
	controller.inputBar.sendButton.backgroundColor = self.view.tintColor;
	controller.inputBar.sendButton.tintColor = [UIColor whiteColor];
	controller.inputBar.sendButton.layer.cornerRadius = 15;
	
	
	UITableViewController *testSafeArea = [[UITableViewController alloc] init];
	testSafeArea.tableView.dataSource = self;

	self.testViewController = testSafeArea;
	[controller addViewController:testSafeArea];
}

#pragma mark - <UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return NSLocale.availableLocaleIdentifiers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell.textLabel.text = NSLocale.availableLocaleIdentifiers[indexPath.row];
	return cell;
}

@end
