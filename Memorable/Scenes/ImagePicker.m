//
//  ImagePicker.m
//  Memorable
//
//  Created by jarvis on 2018/6/13.
//  Copyright © 2018年 JarvisWu. All rights reserved.
//

#import "ImagePicker.h"
#import "TZImagePickerController.h"

@interface ImagePicker ()<TZImagePickerControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate,UINavigationControllerDelegate> {
    NSMutableArray *_selectedPhotos;
    NSMutableArray *_selectedAssets;
    BOOL _isSelectOriginalPhoto;
    
    CGFloat _itemWH;
    CGFloat _margin;
}

@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation ImagePicker

-(id)init
{
    self = [super init];
    if(self)
    {
        _selectedPhotos = [NSMutableArray array];
        _selectedAssets = [NSMutableArray array];
    }
    
    return self;
}

- (void)configureWithCollectionView:(UICollectionView *)collectionView
{
    _collectionView = collectionView;
}

- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        // set appearance / 改变相册选择页的导航栏外观
//        if (iOS7Later) {
//            _imagePickerVc.navigationBar.barTintColor = self.navigationController.navigationBar.barTintColor;
//        }
//        _imagePickerVc.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
        UIBarButtonItem *tzBarItem, *BarItem;
        if (iOS9Later) {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
            BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
        } else {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
        
    }
    return _imagePickerVc;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

@end
