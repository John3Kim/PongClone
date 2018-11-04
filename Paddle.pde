class Paddle{ 
    
   private float xPosPaddle;
  
   Paddle(float xPosPaddle){ 
     this.xPosPaddle = xPosPaddle;
   }
   
   float getX(){ 
     return xPosPaddle; 
   }
   
   float getY(){ 
     return mouseY;
   }
   

   
   void displayPaddle(){ 
      rect(xPosPaddle,mouseY,width/25,height/7); 
   }
  
  
}
