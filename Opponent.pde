/* Opponent.pde
* Description:  Makes an oppointment to play with
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
      //rect(xPosPaddle,mouseY,width/25,height/7); 
      rect(xPosPaddle,yPosPaddle,paddleLen,paddleWide); 
   }
  
  
  void updateYPos(){ 
    yPosPaddle = yPosPaddle + velocityY;
  }
}
