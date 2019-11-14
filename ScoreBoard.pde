/* ScoreBoard.pde
* Description:  Tracks the score of the game
* 
* 
*/

class ScoreBoard{
   private int[] score = new int[]{0,0}; 
   private PFont scoreFont;
   
   ScoreBoard(){ 
     
   }
   
   void displayScore(){ 

    fill(255);
    scoreFont = createFont("bit5x3.ttf", height/4);
  
    textFont(scoreFont);
    textAlign(CENTER, CENTER);
    // Scores of both players displayed
    text(score[0], width/4, height/6);
    text(score[1], 3*width/4, height/6);
  }
  
  void scoreUpdate(Ball ball){ 
    // Player bounds
    if(ball.getX() < 0){ 
      score[0]++;
    // Opponent bounds
    }else if (ball.getX() > width){ 
      score[1]++;
    }
  }
}
