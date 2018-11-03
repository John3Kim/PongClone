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
Paddle paddle = new Paddle();


float xBall; 
float yBall;
float velocityBall = 6;


void setup(){ 

  size(720,480);
  surface.setResizable(true);
  rectMode(CENTER);
 
  xBall = width/90;
  yBall = height/2;
  ball = new Ball(xBall,yBall);
}

void draw(){ 
   background(0);
   // Make the lines for the middle of the screen
   for(int i = 0; i <= height/25; i++){ 
     rect(width/2,height/50*(3*i),width/80,height/25); 
   } 
   
   ball.displayBall();
   ball.updatePos();


} 
