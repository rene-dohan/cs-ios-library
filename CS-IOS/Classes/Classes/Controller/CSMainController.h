//
// Created by Rene Dohan on 29/10/15.
// Copyright (c) 2015 creative_studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CSViewController.h"

@class CSMenuItem;

@interface CSMainController : CSViewController

@property(nonatomic) BOOL showing;
@property(nonatomic) BOOL appearing;
@property(nonatomic, readonly) BOOL visible;
@property(nonatomic, strong) NSMutableArray<CSMenuItem *> *menuItems;
@property(nonatomic, strong, readonly) CSActionSheet *menuSheet;
@property(nonatomic, strong) CSMainController *parent;

- (instancetype)construct:(CSMainController *)parent;

- (NSArray<CSMainController *> *)setControllers:(NSArray<CSMainController *> *)controllers;

- (NSArray<CSMainController *> *)addControllers:(NSArray<CSMainController *> *)controllers;

- (void)onPrepareRightBarButtonItems:(NSMutableArray<UIBarButtonItem *> *)array;

- (void)updateLeftBarItem;

- (void)viewWillDisappear;

- (void)onViewDismissing;

- (void)showIn:(CSMainController *)parent;

- (void)hideIn:(UIViewController *)parent;

- (CSMenuItem *)addMenuItem:(NSString *)title;

- (CSMenuItem *)addMenuItem:(NSString *)title :(void (^)())onClick;

- (CSMenuItem *)addSystemMenuItem:(UIBarButtonSystemItem)item :(NSString *)title;

- (CSMenuItem *)addImageMenuItem:(UIImage *)image :(NSString *)title;

- (CSMenuItem *)addSystemMenuItem:(UIBarButtonSystemItem)item :(NSString *)title :(void (^)())onClick;

- (CSMenuItem *)addMenuItem;

- (void)viewDidDisappear;

- (void)onViewShowing;

- (BOOL)isMainController;

- (BOOL)isChildController;

- (void)onViewWillAppear;

- (void)onViewWillAppearFirstTime;

- (void)onViewWillAppearFromPresentedController;

- (void)onViewDidAppearFirstTime;

- (void)onViewDidAppear;

- (void)onViewDidAppearFromPresentedController;

- (void)onViewWillTransitionToSizeCompletion:(CGSize)size :(id <UIViewControllerTransitionCoordinatorContext>)context;

- (void)onPrepareMenu:(NSMutableArray<CSMenuItem *> *)items;

- (void)updateRightBarItemsAndMenu;

- (void)updateRightBarItemsAndMenu:(BOOL)animated;
@end