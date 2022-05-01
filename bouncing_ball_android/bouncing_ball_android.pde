import ketai.sensors.*;

KetaiSensor sensor;
int rotationX, rotationY, rotationZ;
int previous_X, previous_Y, previous_Z;

Ball bouncing_ball;
void setup()
{
  sensor = new KetaiSensor(this);
  sensor.start();
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(36);
  
  bouncing_ball = new Ball(width/2, height/2, 50, 0, 0, 255, 0, 0);
}

void draw()
{
  background(78, 93, 75);
  text("Orientation: \n" + 
    "x: " + nfp(rotationX, 1, 3) + "\n" +
    "y: " + nfp(rotationY, 1, 3) + "\n" +
    "z: " + nfp(rotationZ, 1, 3), 0, 0, width, height);
    bouncing_ball.draw_ball();
    if(previous_Y - rotationY > 0){
      bouncing_ball.vy+=0.5;
    }else if(previous_Y - rotationY < 0){
      bouncing_ball.vy-=0.5;
    }
    
    if(previous_Z - rotationZ > 0){
      bouncing_ball.vx+=0.5;
    }else if(previous_Z - rotationZ < 0){
      bouncing_ball.vx-=0.5;
    }
    previous_Y = rotationY;
    previous_X = rotationX;
    previous_Z = rotationZ;
}

void onOrientationEvent(float x, float y, float z)
{
  rotationX = (int) x;
  rotationY = (int) y;
  rotationZ = (int) z;
}
