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
      //rect(xPosPaddle,mouseY,width/25,height/7); 
      rect(xPosPaddle,mouseY,paddleLen,paddleWide); 
   }
  
  /*
   boolean collision(){ 
     
   }*/
  
}
