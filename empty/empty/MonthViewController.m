//
//  MonthViewController.m
//  empty
//
//  Created by echo on 13. 4. 29..
//  Copyright (c) 2013년 echo. All rights reserved.
//

#import "MonthViewController.h"

@interface MonthViewController ()

@end

@implementation MonthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DataBase *DB = [DataBase sharedDataBase];
    arrMDVC = [[NSMutableArray alloc]init];
    arrMDV = [[NSMutableArray alloc]init];
    NSDateComponents * now = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[NSDate date]];
    int i,l;
    i=l=0;
    intActioning = 0;
    isOpen = false;
    [now setDay:1];
    for(UIViewController *childViewController in [self childViewControllers])
    {
        if([childViewController isKindOfClass:[MonthDayViewController class]])
        {
            MonthDayView* MDV = [[MonthDayView alloc] init];
            MDV.frame = CGRectMake(i%7*46, i/7*91, 46, 91);
            [arrMDV addObject:MDV];
            [self.view addSubview:MDV];
            [MDV setRow:i/7];
            [MDV setCol:i%7];
            /////
            
            MonthDayViewController *MDVC = (MonthDayViewController*)childViewController;
            [arrMDVC addObject:MDVC];
            
            [MDVC setRow:i/7];
            [MDVC setCol:i%7];
            NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
            [offsetComponents setDay:-[now weekday]+1+i++];
            NSDateComponents *dateComponent = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekdayCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit fromDate:[[NSCalendar currentCalendar] dateByAddingComponents:offsetComponents toDate:[[NSCalendar currentCalendar] dateFromComponents:now] options:0]];
            
            
            [MDVC setData:[[DB.array objectAtIndex:[dateComponent month]-1 ] objectAtIndex:[dateComponent day]-1]];
            [MDVC.label setText:[NSString stringWithFormat:@"%d/%d",[dateComponent month],[dateComponent day]]];
            [MDVC.view setHidden:YES];
            
            
            ////
            [MDV.label setText:[NSString stringWithFormat:@"%d/%d",[dateComponent month],[dateComponent day]]];
            [MDV setMVC:self];
            
        }
    }
    /*    for(i=0;i<6;i++)
     {
     for(l=0;l<7;l++)
     {
     MonthDayView* MDV = [[MonthDayView alloc] init];
     MDV.frame = CGRectMake(l*46, i*91, 46, 91);
     [arrMDV addObject:MDV];
     [self.view addSubview:MDV];
     [MDV.label setText:[NSString stringWithFormat:@"%d/%d",[dateComponent month],[dateComponent day]]];
     
     }
     }*/
}
-(void)expandRow:(int)row Col:(int)col
{
    NSLog(@"%d , %d",row,col);
    preCol = col, preRow = row;
    int i,l;
    int sh=91*3;
    int h_n=91;
    if(isOpen == false && intActioning == 0) // it's mean, in this time will open.
    {
        isOpen = true;
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
                        intActioning++;
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, -(sh)));
                    } completion:^(BOOL finished) {
                        intActioning--;
                    }];
                }
            }
        }
        else if(row == 0)
        {
            // no up//
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
                        intActioning++;
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, -(sh-(4-row)*h_n)));
                    } completion:^(BOOL finished) {
                        intActioning--;
                    }];
                }
            }
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
                        intActioning++;
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, sh));// CGAffineTransformMakeTranslation(0,sh);
                    } completion:^(BOOL finished) {
                        intActioning--;
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
                        intActioning++;
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0,(4-row)*h_n));
                    } completion:^(BOOL finished) {
                        intActioning--;
                    }];
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    else if(isOpen == true && intActioning == 0)
    {
        isOpen = false;
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
                        intActioning++;
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, sh));
                    } completion:^(BOOL finished) {
                        intActioning--;
                    }];
                }
            }
        }
        else if(row == 0)
        {
            // no up//
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
                        intActioning++;
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, sh-(4-row)*h_n));
                    } completion:^(BOOL finished) {
                        intActioning--;
                    }];
                }
            }
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
                        intActioning++;
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0, -(sh)));
                    } completion:^(BOOL finished) {
                        intActioning--;
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
                        intActioning++;
                        MDV.frame = CGRectApplyAffineTransform(MDV.frame, CGAffineTransformMakeTranslation(0,-(4-row)*h_n));
                    } completion:^(BOOL finished) {
                        intActioning--;
                    }];
                }
            }
            
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
