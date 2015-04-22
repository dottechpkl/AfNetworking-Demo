//
//  ViewController.m
//  AfNetworking Demo
//
//  Created by Dottechnologies on 5/28/14.
//  Copyright (c) 2014 Dottechnologies. All rights reserved.
//

#import "ViewController.h"
#import "NSDictionary+weather.h"
#import "XMLReader.h"
#import "NSObject+SBJSON.h"
static NSString *const BaseURLString=@"http://www.raywenderlich.com/demos/weather_sample/";

@interface ViewController ()
@property(nonatomic,strong)NSDictionary *responseDictionary;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)clear:(id)sender
{
    
    
}

//NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?Operation=GetUserProfileBy_ID",urlWebServices]];
//ASIFormDataRequest* request = [[ASIFormDataRequest alloc] initWithURL:url];
//
//request.delegate = self;
//
//
//[request addRequestHeader:@"Content-Type" value:@"text/xml"];
//NSString* xml = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><GetUserProfileBy_ID xmlns=\"http://dottechnologies.net/webservices/\"><UserId>%@</UserId><Password>%@</Password></GetUserProfileBy_ID></soap:Body></soap:Envelope>",txtuserName.text,txtPassword.text];
//
//NSLog(@"%@", xml);
//[request addRequestHeader:@"Content-Type" value:@"text/xml"];
//[request appendPostData: [xml dataUsingEncoding:NSUTF8StringEncoding]];
//[request setDidFinishSelector:@selector(requestDidFinish:)];
//[request setDidFailSelector:@selector(requestDidFail:)];
//[request startAsynchronous];
//}

- (IBAction)jsonTapped:(id)sender
{
    NSDictionary *postDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Testing",@"szFirstName",@"Test",@"szLastName",@"Testing@test.com",@"szEmail",@"12345",@"szPassword",@"12345",@"szCPassword",nil];
    NSString *jsonString = [postDict JSONRepresentation];
    
    NSString* soapMessage = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><user_signup xmlns=\"urn:passwebservices\"><data>%@</data></user_signup></soap:Body></soap:Envelope>",jsonString];
    
    
    NSURL *url = [NSURL URLWithString:@"http://whiz-dev.com/pass_webservice/passwebservices.php?"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPBody:[soapMessage dataUsingEncoding:NSISOLatin1StringEncoding]];
    [request setHTTPMethod:@"POST"];
    [request addValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        // I get response as XML here and parse it in a function
        self.responseDictionary=(NSDictionary*)responseObject;
    NSLog(@"%@",self.responseDictionary);

//        NSDictionary *dict = [XMLReader dictionaryForXMLString:request.responseString error:nil];
//        
//        NSDictionary* json_string= [[[[dict objectForKey:@"SOAP-ENV:Envelope"] objectForKey:@"SOAP-ENV:Body"] objectForKey:@"ns1:user_signupResponse"]objectForKey:@"return"] ;
//        NSString *str=[json_string valueForKey:@"text"];
//        
//        NSArray *arr =
//        [NSJSONSerialization JSONObjectWithData: [str dataUsingEncoding:NSISOLatin1StringEncoding]
//                                        options: NSJSONReadingMutableContainers
//                                          error: nil];
//        NSString *response=[[arr objectAtIndex:0]valueForKey:@"response"];
//        NSString *message=[[arr objectAtIndex:1]valueForKey:@"message"];

    }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         NSLog(@"failed");
                                     }];
    
    [operation start];
    
//    NSDictionary *postDict = [NSDictionary dictionaryWithObjectsAndKeys:@"check@gmail.com",@"szEmail",@"123456",@"szPassword",nil];
//    NSString *jsonString = [postDict JSONRepresentation];
//    
//    NSString* xml = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><user_login xmlns=\"urn:passwebservices\"><data>%@</data></user_login></soap:Body></soap:Envelope>",jsonString];
//
//    
//    NSURL *url = [NSURL URLWithString:@"http://whiz-dev.com/pass_webservice/passwebservices.php?"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//
//    
//    AFHTTPRequestOperation *operation=[[AFHTTPRequestOperation alloc]initWithRequest:request];
//    operation.responseSerializer=[AFJSONResponseSerializer serializer];
//    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
//    
//        self.responseDictionary=(NSDictionary*)responseObject;
//        NSLog(@"%@",self.responseDictionary);
//        self.title=@"JSON Retrieved";
//        [table reloadData];
//        
//    } failure:^(AFHTTPRequestOperation *operation,NSError *error){
//        
//        UIAlertView  *alertView=[[UIAlertView alloc]initWithTitle:@"Error Retrieving Weather" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
//        [alertView show];
//        
//    }];
//    
//    [operation start];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *getWeather=[self.responseDictionary weather];
    NSLog(@"get Weather %@",getWeather);
    return  [getWeather count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"WeatherCell";
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
}


- (IBAction)plistTapped:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://whiz-dev.com/pass_soap/passwebservices.php?wsdl"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //parse NSXMLParser object here if request successfull
// (@"%@",self.responseDictionary);
if ([responseObject isKindOfClass:[NSXMLParser class]]) {
            NSXMLParser *parser = (NSXMLParser *)responseObject;
            NSDictionary *dict = [XMLReader dictionaryForNSXMLParser:parser];
            NSLog(@"JSON: %@ : %@", responseObject,dict);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:operation];
}
- (IBAction)xmlTapped:(id)sender
{
    
}
- (IBAction)clientTapped:(id)sender
{
    
}
- (IBAction)apiTapped:(id)sender
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
