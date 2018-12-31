/* pong.pde 
* By: John3Kim
* Description: Just a nice implementation of the classic 
* game Pong!
*
* TODO: 
* - Find a way for the ball the hit the paddle DONE!
* - Learn how to implement the physics in Pong
* - Implement a second paddle as an opponent 
* - Put a nice score keeping system! 
* - Make a menu for the game! 
* - Profit! $$$
*/ 

Ball ball; 
Player player1;
ScoreTrack st;
PFont scoreFont;

float xBall; 
float yBall;
float velocityBall = 4;

void setup(){ 

  size(720,480);
  surface.setResizable(true);
  rectMode(CENTER);
 
  //xBall = width/90;
  //yBall = height/2;
  xBall = 720/90 + 100;
  yBall = 480/2;
  ball = new Ball(xBall,yBall,velocityBall);

  player1 = new Player(width/25);
  st = new ScoreTrack();

}

void draw(){ 
   background(0);

   // Make the lines for the middle of the screen
   for(int i = 0; i <= height; i++){ 
     rect(width/2,height/50*(3*i),width/80,height/25); 
   } 
   
   player1.displayPaddle();
   
   //debugPosition();

   ball.displayBall();
   ball.updateXPos(); 
   ball.updateYPos();
   
   collisionDetection();
   
   scoreUpdate();
   displayScore();
   

} 

// Player1 collision detection
void collisionDetection(){ 
   // Check for the position of the X and Y coords of the ball 
   // and check if they touch the paddle 
   float player1UpperLen = mouseY + 720/20; 
   float player1LowerLen = mouseY - 720/20;
   float player1LeftWide =  player1.getX() - 480/28;
   float player1RightWide = player1.getX() + 480/28;
   boolean collisionX = ball.getX() <= player1RightWide && ball.getX() >= player1LeftWide; 
   boolean collisionY = ball.getY() <= player1UpperLen && ball.getY() >= player1LowerLen;
  
  if(collisionX && collisionY){ 
    //Go the other direction
    ball.setVelocityX(-ball.getVelocityX());
    
    // Let's make three cases for the top half and the bottom half of the paddle
  }
  
} 


// Console printout each X and Y coordinates
void debugPosition(){ 
   print("PlayerX: " + player1.getX() + "\n");
   print("PlayerY: " + player1.getY() + "\n"); 
   print("MouseY: " + mouseY + "\n"); 
   print("BallX: " + ball.getX() + "\n");
   print("BallY: " + ball.getY() + "\n");
   //print(paddle.getY());
}

void displayScore(){ 

  fill(255);
  scoreFont = createFont("bit5x3.ttf", height/4);

  textFont(scoreFont);
  textAlign(CENTER, CENTER);
  // Scores of both players
  text(st.getScore(1), width/4, height/6);
  text(st.getScore(2), 3*width/4, height/6);
}

void scoreUpdate(){ 
  if(ball.getX() < 0){ 
    st.setPoint(2);
  }else if (ball.getX() > width){ 
    st.setPoint(1);
  }
}
