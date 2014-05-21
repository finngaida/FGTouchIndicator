FGTouchIndicator
================

I was in the need of some tutorial like animated touch view, so I made one (really simple, don't panic) and put it up here.

## How do I FGTouchIndicator?
Copy over the two files and `#import` them. 
Then you may use the force to
    FGTouchIndicator *touch = [FGTouchIndicator touchIndicatorAnimatedFromPoint:CGPointMake(50, 50) toPoint:CGPointMake(300, 300) withDuration:2];
    [self.view addSubview:touch];

So that's that.

## FUUU it's not animating!!!
Oh, you might want to `startAnimating` and `stopAnimating` to handle that, sorry my bad.

## This is crap, I made a way cooler revision
Awesome! Send me a pull request and I will merge it without even looking. Seriously.
