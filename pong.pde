/* Pong 
* By: John3Kim
* Description: Just a nice implementation of the classic 
* game Pong!
*
* TODO: 
* - Find a way for the ball the hit the paddle
* - Learn how to implement the physics in Pong
* - Implement a second paddle as an opponent 
* - Put a nice score keeping system! 
* - Make a menu for the game! 
* - Profit! $$$
*/ 

Ball ball; 
Paddle paddle;


float xBall; 
float yBall;
float velocityBall = 6;


void setup(){ 

  size(720,480);
  surface.setResizable(true);
  rectMode(CENTER);
 
  xBall = width/90;
  yBall = height/2;
  ball = new Ball(xBall,yBall,velocityBall);
  paddle = new Paddle(width/25);
}

void draw(){ 
   background(0);
   // Make the lines for the middle of the screen
   for(int i = 0; i <= height; i++){ 
     rect(width/2,height/50*(3*i),width/80,height/25); 
   } 
   
   paddle.displayPaddle();
   //print(paddle.getX()); 
   print(paddle.getY());
   ball.displayBall();
   ball.updatePos(); 
   
   /*
   // Check for the position of the X and Y coords of the ball 
   // and check if they touch the paddle 
   if(paddle.getY()+height/14 == ball.getXPos()){ 
    //Go back! 
    ball.setVelocityX(-ball.getXPos());
    
   }
  */

} 
