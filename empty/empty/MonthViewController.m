//
//  MonthViewController.m
//  empty
//
//  Created by echo on 13. 4. 29..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "MonthViewController.h"


@implementation MonthViewController
@synthesize TVC;
@synthesize DB;
@synthesize month;
#define sh self.view.frame.size.height/6.0*3.0
#define h_n self.view.frame.size.height/6.0
#define w_n self.view.frame.size.width/7.0

-(id)initWithDB:(DataBase*)_DB Frame:(CGRect)frame
{
    self = [super init];
    if(self)
    {
        DB = _DB;
        self.view.frame = frame;
        nowDateComps = [[NSDateComponents alloc]init];
        [nowDateComps setYear:2013];
        [nowDateComps setDay:1];
        [nowDateComps setMonth:1];
        
        TVC = [TableViewController makeChildTVCByParent:self DB:DB frame:self.view.frame];
        
        [TVC.view setHidden:YES];
        arrMDVC = [[NSMutableArray alloc]init];
        arrMDV = [[NSMutableArray alloc]init];
        intActioning = 0;
        isOpen = false;
        int i=0,l=0;
        self.view.clipsToBounds = YES;
        for(i=0;i<6;i++)
        {
            for(l=0;l<7;l++)
            {
                //live Calendar//
                if(i == 5 && l == 6)
                {
                    UIView *liveCalendarView = [[UIView alloc]initWithFrame:CGRectMake(l*w_n, i*h_n+1 , w_n-1, h_n-1) ];
                    liveCalendarView.backgroundColor = [UIColor whiteColor];
                    UIButton *liveCalendarButton = [UIButton buttonWithType:UIButtonTypeCustom];
                    [liveCalendarButton setImage:[UIImage imageNamed:@"01_ic_livecal_ios.png"] forState:UIControlStateNormal];
                    
                    [liveCalendarButton addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
                    [liveCalendarButton setImage:[UIImage imageNamed:@"01_ic_livecal_c_ios.png"] forState:UIControlStateSelected];
                    
                    [liveCalendarButton setFrame:CGRectMake( (w_n-1 - 38 ) /2 , (h_n-1 - 50) / 2, 38, 50)];
                    [liveCalendarView addSubview:liveCalendarButton];
                    [self.view addSubview:liveCalendarView];
                    [arrMDV addObject:liveCalendarView];
                    
                }
                else
                {
                
                    MonthDayView* MDV = [[MonthDayView alloc] init];
                    //NSInteger A = l*w_n, B = i*h_n, C = w_n, D = h_n;
                    //NSLog(@"int (i,l) = (%d,%d) ... A : %d B : %d C : %d D : %d",i,l,A,B,C,D);
                    MDV.frame = CGRectMake(l*w_n, i*h_n+1 , w_n-1, h_n-1); /// this make border...!!
                    //MDV.frame = CGRectMake(A, B, C, D);
                    [arrMDV addObject:MDV];
                    [self.view addSubview:MDV];
                    [MDV setRow:i];
                    [MDV setCol:l];
                    
                    [MDV setMVC:self];
                }
                
                
            }
        }
        [self setDateWithMonth:[nowDateComps month]];
    }
    return self;
}
- (void) onClick:(UIButton *)sender {
    
    [sender setSelected:!sender.selected];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}
-(void)viewDidAppear:(BOOL)animated
{

}
-(void)setDateWithMonth:(int)_month
{
    month = _month;
    intActioning = 0;
    isOpen = false;
    int i=0,l=0;
    [nowDateComps setMonth:month];
    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:nowDateComps];
    nowDateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit fromDate:date];
    
    for(i=0;i<6;i++)
    {
        for(l=0;l<7;l++)
        {
            if(i == 5 && l == 6)
            {
                continue;
            }
            MonthDayView* MDV = [arrMDV objectAtIndex:i*7+l];
            NSLog(@"%d",arrMDV.count);
            NSDateComponents *offsetComps = [[NSDateComponents alloc] init];
            [offsetComps setDay:-[nowDateComps weekday]+1+i*7+l];
            NSDateComponents *dateComps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[[NSCalendar currentCalendar] dateByAddingComponents:offsetComps toDate:[[NSCalendar currentCalendar] dateFromComponents:nowDateComps] options:0]];
            [MDV setDateComps:dateComps];
            
            
            
        }
    }
}
-(void)expandRow:(int)row Col:(int)col
{
    NSLog(@"MonthDay touched row : %d / col : %d. \nisopen : %d , intActioning : %d",row,col,isOpen,intActioning);
    int i,l;
    if(row == 5 && col == 6) return;
    if(isOpen == false && intActioning == 0) // it's mean, in this time will open.
    {
        preCol = col, preRow = row;
        isOpen = true;
        NSDateComponents *offsetComps = [[NSDateComponents alloc] init];
        [offsetComps setDay:-[nowDateComps weekday]+1+row*7+col];
        NSDateComponents *dateCompt = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[[NSCalendar currentCalendar] dateByAddingComponents:offsetComps toDate:[[NSCalendar currentCalendar] dateFromComponents:nowDateComps] options:0]];
        [TVC setDataWithMonth:[dateCompt month] Day:[dateCompt day]];
        [TVC.view setHidden:NO];
        
        //up//
        if(row==5)
        {
            //up sh
            for(i=0;i<=row;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, -(sh)));
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
            //and TVC do..
            TVC.view.frame = CGRectMake(0, h_n*6, self.view.frame.size.width, 0);
            [UIView animateWithDuration:0.3 animations:^(void) {
                intActioning++; //NSLog(@"%d",intActioning);
                TVC.view.frame = CGRectMake(0,6*h_n-sh,self.view.frame.size.width,sh);
            } completion:^(BOOL finished) {
                intActioning--; //NSLog(@"%d",intActioning);
            }];
            
        }
        else if(row == 0)
        {
            // no up//
            //and TVC do..
            TVC.view.frame = CGRectMake(0, h_n, self.view.frame.size.width, 0);
            [UIView animateWithDuration:0.3 animations:^(void) {
                intActioning++; //NSLog(@"%d",intActioning);
                TVC.view.frame = CGRectMake(0,h_n,self.view.frame.size.width,sh);
            } completion:^(BOOL finished) {
                intActioning--; //NSLog(@"%d",intActioning);
            }];
        }
        else
        {
            //up sh-(4-k)*h/n
            for(i=0;i<=row;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, -(sh-(4-row)*h_n)));
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
            //and TVC do..
            TVC.view.frame = CGRectMake(0, (1+row)*h_n+1, self.view.frame.size.width, 0);
            [UIView animateWithDuration:0.3 animations:^(void) {
                intActioning++; //NSLog(@"%d",intActioning);
                TVC.view.frame = CGRectMake(0,(1+row)*h_n-(sh-(4-row)*h_n)+1,self.view.frame.size.width,sh);
            } completion:^(BOOL finished) {
                intActioning--; //NSLog(@"%d",intActioning);
            }];
        }
        
        
        //down//
        if(row==5)
        {
            //no down
        }
        else if(row == 0)
        {
            //down sh//
            for(i=row+1;i<6;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, sh));// CGAffineTransformMakeTranslation(0,sh);
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
        }
        else
        {
            //down sh-(4-k)*h/n
            for(i=row+1;i<6;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0,(4-row)*h_n));
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    else if(isOpen == true && intActioning == 0)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [TVC.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        isOpen = false;
        //up//
        if(preRow==5)
        {
            //up sh
            for(i=0;i<=preRow;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, sh));
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
            [UIView animateWithDuration:0.3 animations:^(void) {
                intActioning++; //NSLog(@"%d",intActioning);
                TVC.view.frame = CGRectMake(0,6*h_n,self.view.frame.size.width,0);
            } completion:^(BOOL finished) {
                intActioning--; //NSLog(@"%d",intActioning);
                [TVC.view setHidden:YES];
            }];
            
        }
        else if(preRow == 0)
        {
            // no up//
            [UIView animateWithDuration:0.3 animations:^(void) {
                intActioning++; //NSLog(@"%d",intActioning);
                TVC.view.frame = CGRectMake(0,h_n,self.view.frame.size.width,0);
            } completion:^(BOOL finished) {
                intActioning--; //NSLog(@"%d",intActioning);
                [TVC.view setHidden:YES];
            }];
        }
        else
        {
            //up sh-(4-k)*h/n
            for(i=0;i<=preRow;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, sh-(4-preRow)*h_n));
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
        }
        
        
        //down//
        if(preRow==5)
        {
            //no down
        }
        else if(preRow == 0)
        {
            //down sh//
            for(i=preRow+1;i<6;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, -(sh)));
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
        }
        else
        {
            //down sh-(4-k)*h/n
            for(i=preRow+1;i<6;i++)
            {
                for (l=0; l<7; l++)
                {
                    MonthDayView *MDV = [arrMDV objectAtIndex:i*7+l];
                    [UIView animateWithDuration:0.3 animations:^(void) {
                        intActioning++; //NSLog(@"%d",intActioning);
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0,-(4-preRow)*h_n));
                    } completion:^(BOOL finished) {
                        intActioning--; //NSLog(@"%d",intActioning);
                    }];
                }
            }
            
            //and TVC do..
            [UIView animateWithDuration:0.3 animations:^(void) {
                intActioning++; //NSLog(@"%d",intActioning);
                TVC.view.frame = CGRectMake(0, (1+row)*h_n+1, self.view.frame.size.width, 0);
            } completion:^(BOOL finished) {
                intActioning--; //NSLog(@"%d",intActioning);
                [TVC.view setHidden:YES];
            }];
            
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
