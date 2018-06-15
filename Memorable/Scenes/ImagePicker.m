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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
