//
//  ViewController.m
//  UklonTestApp
//
//  Created by Andrew on 28.04.2018.
//  Copyright © 2018 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "ARHorizontalSelectorView.h"
#import "AutoClass.h"
#import "AutoClassDatastore.h"

@interface ViewController () <ARSelectorDelegate>

@property (weak, nonatomic) IBOutlet ARHorizontalSelectorView *selectionView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupSelectionView];
}

#pragma mark - Setup UI
- (void)setupSelectionView {
    self.selectionView.items = [[AutoClassDatastore shared] getAutoclasses];
    self.selectionView.delegate = self;
    self.selectionView.underlineColor = [UIColor blueUklonColor];
    self.selectionView.underlineSelectedColor = [UIColor yellowUklonColor];
    self.selectionView.imageColor = [UIColor grayTextUklonColor];
    self.selectionView.imageSelectedColor = [UIColor blueUklonColor];
}


#pragma mark - ARSelectorDelegate
- (void)selectorView:(ARHorizontalSelectorView *)selectorView didSelectItemAtIndex:(NSInteger)index {
    self.titleLabel.text = ((AutoClass *)selectorView.items[index]).title;
}

@end
