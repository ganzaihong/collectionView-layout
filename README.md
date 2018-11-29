# collectionView-layout
Custom collectionView layout

//自定义layout需要重写一下四个方法：

//1.自定义layout需要重写这些方法

-(void)prepareLayout;

    
 //2.返回collectionView的内容的尺寸
-(CGSize)collectionViewContentSize;


//3.
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect;  


//4.返回对应于indexPath的位置的cell的布局属性,返回指定indexPath的item的布局信息。子类必须重载该方法,该方法只能为cell提供布局信息，不能为补充视图和装饰视图提供。


-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath;
   
