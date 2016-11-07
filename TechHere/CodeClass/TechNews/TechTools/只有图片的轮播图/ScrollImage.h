

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>

@class ScrollImage;
@protocol ScrollImageDelegate <NSObject>

@optional

- (void)scrollImage:(ScrollImage *)scrollImage clickedAtIndex:(NSInteger)index;

@end

@interface ScrollImage : UIViewController

@property (nonatomic, weak) id<ScrollImageDelegate> delegate;

@property (nonatomic, assign) NSTimeInterval timeInterval;
@property (nonatomic, strong) UIPageControl  *pageControl;
@property (nonatomic, strong) UIImage        *placeholderImage;

- (instancetype)initWithCurrentController:(UIViewController *)viewcontroller urlString:(NSArray *)urls viewFrame:(CGRect)frame placeholderImage:(UIImage *)image startAnimated:(BOOL) isAnimated;
- (instancetype)initWithCurrentController:(UIViewController *)viewcontroller imageNames:(NSArray *)images viewFrame:(CGRect)frame placeholderImage:(UIImage *)image startAnimated:(BOOL) isAnimated;

@end




@interface NSString (MD5)
- (id)MD5;
@end