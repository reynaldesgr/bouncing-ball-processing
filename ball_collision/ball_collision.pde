import java.util.Random;

int x, y, r, vx, vy;

ArrayList<Ball> balls = new ArrayList();
ArrayList<Ball> new_balls;

void setup(){
  size(600, 600);
  ellipseMode(CENTER);
  colorMode(RGB);
}

void draw(){
  stroke(255, 0, 0);
  background(0);
  if(!balls.isEmpty()){
    for(Ball b : balls){
      b.draw_ball();
    }
    new_balls = new ArrayList(balls);
    for(Ball b1 : balls){
      for(Ball b2 : balls){
        if(b1.collision(b2) && b2 != b1 && new_balls.contains(b1) && new_balls.contains(b2)){
          new_balls.remove(b1);
          new_balls.remove(b2);
        }
      }
    }
    balls = new_balls;
  }
}

void mousePressed(){
  balls.add(new Ball(mouseX, mouseY, 
                     new Random().nextInt(90 + 10) + 10, 
                     new Random().nextInt(2 + 6) + 2, 
                     new Random().nextInt(2 + 6) + 2,
                     new Random().nextInt(255),
                     new Random().nextInt(255),
                     new Random().nextInt(255)));
}

void keyPressed(){
      println(key);
  switch(key){
    case '-':
      if(!balls.isEmpty()){
        balls.remove(balls.size() - 1);
      }
      break;
    case '+':
      balls.add(new Ball(new Random().nextInt(width/2 + 30) + 30, 
                new Random().nextInt(height/2 + 30) + 30, 
                new Random().nextInt(90 + 10) + 10, 
                new Random().nextInt(2 + 6) + 2, 
                new Random().nextInt(2 + 6) + 2,
                new Random().nextInt(255),
                new Random().nextInt(255),
                new Random().nextInt(255)));
      break;
  }
}
