/* Player.pde
<<<<<<< HEAD
* Description: A Basic class for the player class. 
=======
* Description: The player class. 
>>>>>>> 774128f194ee5ef354c86a5fb72025d49663e333
* Implements Player1 and possibly Player2.
* 
* 
*/


class Player extends Paddle{ 
    
   private float xPosPaddle;
   private float paddleLen = width/25;
   private float paddleWide = height/7;

   Player(float xPosPaddle){ 
     this.xPosPaddle = xPosPaddle;
   }
   
   float getX(){ 
     return xPosPaddle; 
   }
   
   float getY(){ 
     return mouseY;
   }
   
   void displayPaddle(){ 
      rect(xPosPaddle,mouseY,paddleLen,paddleWide); 
   }
   
    void collisionDetectionPlayer(Ball ball, Opponent opponent){ 
       // Check for the position of the X and Y coords of the ball 
       // and check if they touch the paddle 
       float playerUpperLen = mouseY + 720/20; 
       float playerLowerLen = mouseY - 720/20;
       float yDirectionCollision = 0;
       float playerLeftWide =  xPosPaddle - 480/28;
       float playerRightWide = xPosPaddle + 480/28;
       boolean collisionX = ball.getX() <= playerRightWide && ball.getX() >= playerLeftWide; 
       boolean collisionY = ball.getY() <= playerUpperLen && ball.getY() >= playerLowerLen;
      
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
      // For the AI, we need to adjust the speed accordingly
      opponent.setVelocityY(yDirectionCollision);
    } 
  
  
}
