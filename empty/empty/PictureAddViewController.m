//
//  PictureAddViewController.m
//  empty
//
//  Created by echo on 13. 6. 10..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "PictureAddViewController.h"

@implementation PictureAddViewController

- (id)initWithViewFrame:(CGRect)viewFrame ColCount:(NSInteger)_colCount ComponentHeight:(CGFloat)_compHeight
{
    self = [super init];
    if(self)
    {
        self.view = [[FlexibleView alloc]initWithFrame:viewFrame];
        
        removeButtons = [[NSMutableArray alloc]init];
        imageViews = [[NSMutableArray alloc]init];
        colCount = _colCount;
        componentSize.width = viewFrame.size.width / colCount;
        componentSize.height = _compHeight;
        
        addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        addButton.frame = CGRectMake(0, 0, viewFrame.size.width/_colCount, _compHeight);
        [addButton setTitle:@"Add Pic." forState:UIControlStateNormal];
        [addButton addTarget:self action:@selector(choosePhoto:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:addButton];
    }
    return self;
}

-(void) addImage:(UIImage*)image
{
    NSLog(@"Pictrue Add View Controoler :: Add Image");
    
    CGRect newFrame;
    
    PictureAddCell *imageCell = [[PictureAddCell alloc]initWithFrame:addButton.frame Image:image];
    [self.view addSubview:imageCell];
    [imageViews addObject:imageCell];
    
    /*UIButton *removeButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
    newFrame = imageCell.frame;
    newFrame.origin.x += componentSize.width;
    removeButton.frame = newFrame;
    removeButton.tag = [removeButtons count];
    [removeButtons addObject:removeButtons];
    [removeButton addTarget:self action:@selector(removeImage:) forControlEvents:UIControlEventTouchDown];
    */
    CGPoint coord = [self coordObjectWithIndex:[imageViews count]+1];
    newFrame.origin = CGPointMake(coord.x * componentSize.width, coord.y * componentSize.height);
    newFrame.size = componentSize;
    addButton.frame = newFrame;
    [addButton removeFromSuperview];
    [self.view addSubview:addButton];
    NSLog(@"%@",imageViews);

}
-(void)removeImage:(UIButton*)removeButton
{
    CGRect newFrame;
    
    PictureAddCell *imageCell = [imageViews objectAtIndex:removeButton.tag];
    [imageCell removeFromSuperview];
    [addButton removeFromSuperview];
    
    CGPoint coord = [self coordObjectWithIndex:[imageViews count]];
    newFrame.origin = CGPointMake(coord.x * componentSize.width, coord.y * componentSize.height);
    newFrame.size = componentSize;
    addButton.frame = newFrame;
    [self.view addSubview:addButton];
}
-(CGPoint) coordObjectWithIndex:(NSInteger)index
{
    return CGPointMake((index-1)%colCount, (index-1)/colCount);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//// Copy From Photo Locations ////

-(void)choosePhoto:(id)sender
{
	// Show an image picker to allow the user to choose a new photo.
	
	UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
	imagePicker.delegate = self.parentViewController;
    [self presentViewController:imagePicker animated:YES completion:NULL];
}



@end
