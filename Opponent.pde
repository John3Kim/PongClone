/* Opponent.pde
* Description:  Allow us to play with a computer.
* 
* 
* 
*/

class Opponent extends Paddle { 
   
   private float xPosPaddle;
   private float yPosPaddle;
   private float velocityY = 0;
   private float paddleLen = width/25;
   private float paddleWide = height/7;

   Opponent(float xPosPaddle, float yPosPaddle){ 
     this.xPosPaddle = xPosPaddle;
     this.yPosPaddle = yPosPaddle;
   }
   
   float getX(){ 
     return xPosPaddle; 
   }
   
   float getY(){ 
     return yPosPaddle;
   }
  
   float getVelocityY(){ 
     return velocityY;
   }
   
   void setVelocityY(float velY){ 
      velocityY = velY; 
   }
   
   void setYPosPaddle(float posY){ 
      yPosPaddle = posY; 
   }
   
   void displayPaddle(){ 
      rect(xPosPaddle,yPosPaddle,paddleLen,paddleWide); 
   }
  
  
  void updateYPos(){ 
    yPosPaddle = yPosPaddle + velocityY;
  }
  
  void collisionDetectionOpponent(Ball ball){ 
   // Check for the position of the X and Y coords of the ball 
   // and check if they touch the paddle 
   float opponentUpperLen = yPosPaddle + width/20; 
   float opponentLowerLen = yPosPaddle - width/20;
   float opponentLeftWide =  xPosPaddle - height/28;
   float opponentRightWide = xPosPaddle + height/28;
   boolean collisionX = ball.getX() <= opponentRightWide && ball.getX() >= opponentLeftWide; 
   boolean collisionY = ball.getY() <= opponentUpperLen && ball.getY() >= opponentLowerLen;
  
  if(collisionX && collisionY){ 
    // Partition collisions from the centre
    
    //Centre of the paddle
     if(ball.getY() == yPosPaddle){
      
       ball.setVelocityX(-ball.getVelocityX());
       ball.setVelocityY(0);
     
     // Bottom half of paddle
     }else if(ball.getY() > yPosPaddle && ball.getY() <= opponentUpperLen){
       
       ball.setVelocityX(-ball.getVelocityX());
       ball.setVelocityY(yPosPaddle/50);
     
     //Top half of paddle
     }else if(ball.getY() < yPosPaddle && ball.getY() >= opponentLowerLen){ 
       
       ball.setVelocityX(-ball.getVelocityX());
       ball.setVelocityY(-yPosPaddle/50);
     }
    
  }
  
} 
}
