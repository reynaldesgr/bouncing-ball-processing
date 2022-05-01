class Ball{
  int x;
  int y;
  int r;
  
  float vx;
  float vy;
  
  int r_;
  int g_;
  int b_;
  
  Ball(int x, int y, int r, float vx, float vy, int r_, int g_, int b_){
    this.x  = x;
    this.y  = y;
    this.r  = r;
    this.vx = vx;
    this.vy = vy;
    this.r_ = r_;
    this.g_ = g_;
    this.b_ = b_;
  }
  
  void draw_ball(){
    fill(r_, g_, b_);
    ellipse(x, y, r, r);
    this.x+=vx;
    this.y+=vy;
    if(x >= width || x <= 0){
      this.vx*=-1;
    }
    if(y >= height || y <= 0){
      this.vy*=-1;
    }
    if(vy < 0){
      vy+=0.01;
    }else if(vy > 0){
      vy-=0.01;
    }
    
    if(vx < 0){
      vx+=0.01;
    }else if(vx > 0){
      vx-=0.01;
    }
  }
  
  boolean collision(Ball other){
    if(abs(this.x - other.x) < this.r/2 && abs(this.y - other.y) < this.r/2){
      return true;
    }
    return false;
  }
  
}
