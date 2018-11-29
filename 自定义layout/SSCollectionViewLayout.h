//
//  SSCollectionViewLayout.h
//  自定义layout
//
//  Created by ganzaihong on 2018/11/26.
//  Copyright © 2018年 YD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSCollectionViewLayout : UICollectionViewFlowLayout
//自定义cell，传入每个cell高度

-(instancetype)initWithArrays:(NSArray *)cellHeightArrays;

@end
