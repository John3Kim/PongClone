/* pong.pde 
* By: John3Kim
* Description: Just a nice implementation of the classic 
* game Pong!
*
* TODO: 
* - Find a way for the ball the hit the paddle DONE!
* - Learn how to implement the physics in Pong 
*   - This involves making the ball move based on the which part of 
      the paddle the ball hits
* - Implement a second paddle as an opponent 
* - Put a nice score keeping system! DONE!
* - Make a menu for the game! 
* - Profit! $$$
*/ 

Ball ball; 
Player player;
Opponent opponent;
ScoreTrack st;
PFont scoreFont;

float xBall; 
float yBall;
float velocityBall = 5;
boolean initiateBall = false;

void setup(){ 

  size(720,480);
  surface.setResizable(true);
  rectMode(CENTER);
 
  //xBall = width/90;
  //yBall = height/2;
  xBall = 720/90 + 100;
  yBall = 480/2;
  ball = new Ball(xBall,yBall,velocityBall);

  player = new Player(width/25);
  opponent = new Opponent(24*width/25,480/2);
  st = new ScoreTrack();

}

void draw(){ 
   background(0);

   // Make the lines for the middle of the screen
   for(int i = 0; i <= height; i++){ 
     rect(width/2,height/50*(3*i),width/80,height/25); 
   } 
   
   player.displayPaddle();
   opponent.displayPaddle();
   //debugPosition();
  
   ball.displayBall();
   
   if(initiateBall){
     ball.updateXPos(); 
     ball.updateYPos();
   }else{ 
     ball.getX(); 
     ball.getY();
   }
   
   
   opponent.setYPosPaddle(ball.getY() - ball.getVelocityY()*5);

   opponent.updateYPos();
   collisionDetectionPlayer();
   collisionDetectionOpponent();
   
   scoreUpdate();
   displayScore();
   
} 

//Event which will initiate ball
void mouseClicked(){ 
  if(!initiateBall){ 
     initiateBall = true;
  }
}

// Player collision detection
void collisionDetectionPlayer(){ 
   // Check for the position of the X and Y coords of the ball 
   // and check if they touch the paddle 
   float playerUpperLen = mouseY + 720/20; 
   float playerLowerLen = mouseY - 720/20;
   float yDirectionCollision = 0;
   float playerLeftWide =  player.getX() - 480/28;
   float playerRightWide = player.getX() + 480/28;
   boolean collisionX = ball.getX() <= playerRightWide && ball.getX() >= playerLeftWide; 
   boolean collisionY = ball.getY() <= playerUpperLen && ball.getY() >= playerLowerLen;
  
  // So far we have it such that it goes in the opposing direction
  if(collisionX && collisionY){ 
    // Partition collisions from the centre
    
    //Centre of the paddle
     if(ball.getY() == mouseY){
       
       yDirectionCollision = 0;
       ball.setVelocityX(-ball.getVelocityX());
       ball.setVelocityY(yDirectionCollision);
       
     // Bottom half of paddle
     }else if(ball.getY() > mouseY && ball.getY() <= playerUpperLen){
       
       yDirectionCollision = mouseY/50;
       ball.setVelocityX(-ball.getVelocityX());
       ball.setVelocityY(yDirectionCollision);

     //Top half of paddle
     }else if(ball.getY() < mouseY && ball.getY() >= playerLowerLen){ 
       
       yDirectionCollision = -mouseY/50;
       ball.setVelocityX(-ball.getVelocityX());
       ball.setVelocityY(yDirectionCollision);
     }
      
  }
  opponent.setVelocityY(yDirectionCollision);
} 

//Opponent collision detection
void collisionDetectionOpponent(){ 
   // Check for the position of the X and Y coords of the ball 
   // and check if they touch the paddle 
   float opponentUpperLen = opponent.getY() + 720/20; 
   float opponentLowerLen = opponent.getY() - 720/20;
   float opponentLeftWide =  opponent.getX() - 480/28;
   float opponentRightWide = opponent.getX() + 480/28;
   boolean collisionX = ball.getX() <= opponentRightWide && ball.getX() >= opponentLeftWide; 
   boolean collisionY = ball.getY() <= opponentUpperLen && ball.getY() >= opponentLowerLen;
  
  // So far we have it such that it goes in the opposing direction
  if(collisionX && collisionY){ 
    // Partition collisions from the centre
    
    //Centre of the paddle
     if(ball.getY() == opponent.getY()){
      
       ball.setVelocityX(-ball.getVelocityX());
       ball.setVelocityY(0);
     
     // Bottom half of paddle
     }else if(ball.getY() > opponent.getY() && ball.getY() <= opponentUpperLen){
       
       ball.setVelocityX(-ball.getVelocityX());
       ball.setVelocityY(opponent.getY()/50);
     
     //Top half of paddle
     }else if(ball.getY() < opponent.getY() && ball.getY() >= opponentLowerLen){ 
       
       ball.setVelocityX(-ball.getVelocityX());
       ball.setVelocityY(-opponent.getY()/50);
     }
    
  }
  
} 

// Console printout each X and Y coordinates
void debugPosition(){ 
   //print("PlayerX: " + player.getX() + "\n");
   //print("PlayerY: " + player.getY() + "\n"); 
   //print("OpponentX: " + opponent.getX() + "\n");
   //print("OpponentY: " + opponent.getY() + "\n"); 
   //print("MouseY: " + mouseY + "\n"); 
   //print("BallX: " + ball.getX() + "\n");
   //print("BallY: " + ball.getY() + "\n");
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
  // Player
  if(ball.getX() < 0){ 
    st.setPoint(2);
  // Opponent
  }else if (ball.getX() > width){ 
    st.setPoint(1);
  }
}
