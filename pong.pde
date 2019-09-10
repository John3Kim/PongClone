/* pong.pde 
* By: John3Kim
* Description: Just a nice implementation of the classic 
* game Pong!
*
* TODO: 
* - Make a menu for the game! 
*/ 

Ball ball; 
Player player;
Opponent opponent;
ScoreBoard st;
PFont scoreFont;

float xBall; 
float yBall;
float velocityBall = 5;
boolean ballMotion = false;

void setup(){ 

  size(720,480);
  surface.setResizable(true);
  rectMode(CENTER);
 
  xBall = 720/90 + 100;
  yBall = 480/2;
  //ball = new Ball(xBall,yBall,velocityBall);
  ball = new Ball(velocityBall);
  
  player = new Player(width/25);
  opponent = new Opponent(24*width/25,480/2);
  st = new ScoreBoard();

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
   
   if(ballMotion){
     ball.updateXPos(); 
     ball.updateYPos();
   }else{ 
     ball.getX(); 
     ball.getY();
   }
   
   opponent.setYPosPaddle(ball.getY() - ball.getVelocityY()*6);
   opponent.updateYPos();
   
   player.collisionDetectionPlayer(ball,opponent);
   opponent.collisionDetectionOpponent(ball);
   
   st.scoreUpdate(ball);
   st.displayScore();
   
} 


//Event that will initiate ball
void mouseClicked(){ 
  if(!ballMotion){ 
     ballMotion = true;
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
