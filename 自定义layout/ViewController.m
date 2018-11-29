//
//  ViewController.m
//  自定义layout
//
//  Created by ganzaihong on 2018/11/26.
//  Copyright © 2018年 YD. All rights reserved.
//

#import "ViewController.h"
#import "SSCollectionViewLayout.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

/** collection view */
@property(nonatomic,strong)UICollectionView *collectionView;


/** height arrays */
@property(nonatomic,strong)NSArray *heightArrays;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      self.heightArrays = @[@(100),@(50),@(40),@(80),@(100),@(50),@(67),@(80),@(100),@(50),@(50),@(80),@(100),@(50),@(20),@(80),@(100),@(50),@(120),@(80),@(100),@(50),@(220),@(80),@(100),@(50),@(20),@(80),@(100),@(50),@(20),@(80),@(100),@(50),@(80),@(80),@(100),@(50),@(100),@(80)];
   [self.view addSubview:self.collectionView];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%ld",self.heightArrays.count);
    return self.heightArrays.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}


-(UICollectionView *)collectionView
{
 
    if (_collectionView == nil) {
        NSLog(@"%@",self.heightArrays);
        SSCollectionViewLayout *flowlayout = [[SSCollectionViewLayout alloc]initWithArrays:self.heightArrays];
        flowlayout.estimatedItemSize = CGSizeMake(30, 30);
//        flowlayout.itemSize = CGSizeMake(100, 50);
//        flowlayout.minimumInteritemSpacing = 10;
//        flowlayout.minimumLineSpacing = 50;
        _collectionView = [[UICollectionView  alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:flowlayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
    }
    return _collectionView;
}

@end
