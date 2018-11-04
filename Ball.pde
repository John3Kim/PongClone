public class Ball{ 
  private float posX; 
  private float posY; 
  private float velocityX = 6;
  
  Ball(float posX,float posY, float velocityX){
    this.posX = posX;
    this.posY = posY; 
    this.velocityX = velocityX;
  } 
  
  float getXPos(){ 
    return posX; 
  }
  
  float getYPos(){ 
   return posY; 
  }
  
  void setPosX(float pX){ 
    posX = pX; 
  }
  
  void setPosY(float pY){ 
    posY = pY; 
  }
  
  void setVelocityX(float veloX){ 
    velocityX = veloX;
  }
  
  void displayBall(){ 
     fill(255);
     rect(posX,posY,width/60,width/60); 
  } 
  
  void updatePos(){ 
   posX = posX + velocityX;
   
   if(posX > width || posX < 0){
      velocityX = -velocityX; 
   }
   
  } 
  

  
  
}
