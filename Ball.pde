public class Ball{ 
  private float posX; 
  private float posY; 
  private float velocityBall = 6;
  
  Ball(float posX,float posY){
    this.posX = posX;
    this.posY = posY; 
  } 
  
  float getPosX(){ 
    return posX; 
  }
  
  float getPosY(){ 
   return posY; 
  }
  
  void setPosX(float pX){ 
    posX = pX; 
  }
  
  void setPosY(float pY){ 
    posY = pY; 
  }
  
  void displayBall(){ 
     fill(255);
     rect(posX,posY,width/60,width/60); 
  } 
  
  void updatePos(){ 
   posX = posX + velocityBall;
   
   if(posX > width || posX < 0){
      velocityBall = -velocityBall; 
   }
   
  } 
  

  
  
}
