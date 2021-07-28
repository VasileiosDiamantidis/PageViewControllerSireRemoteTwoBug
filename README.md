# PageViewControllerSireRemoteTwoBug
This Repository is to detect bugs on navigation with siri 2nd generation remote on UIPageViewController


This Repository contains 3 branches 

<h2><b>main</b></h2>
Shows the bug that in a pageViewController with 3 pages the press left/right works sometimes instead of everytime

<h2><b>IssueOnePressesBegan</b></h2>
Shows that on function 
 
override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {

The tap left/right presses are not being detected


<h2><b>TapGesturesRecogniserIssue</b></h2>
Shows that on after adding UITapGestureRecognizer on view for pressTypes <br>
top, bottom, left, right

Only the press top and press bottom are being triggered.


 <b> Relevant documentation </b>

https://developer.apple.com/documentation/uikit/uipageviewcontroller

❗️ 
Important

In tvOS, the UIPageViewController class provides only a way to swipe between full-screen content pages. Unlike in iOS, a user cannot interact with or move focus between items on each page.
