//Arduinoとのシリアル通信のためのライブラリ
import processing.serial.*;
import cc.arduino.*;
//Arduinoとの通信の準備
Arduino arduino;
void setup()
{
  //画面サイズ300*300に設定
  size(300,300);
  //ダブルクオーテーションの中は環境に合わせる
  arduino = new Arduino(this,"/dev/ttyACM0", 57600);
}
void draw()
{
  //背景を緑に設定
  background(0,255,0);
  //9分割ための線を描画
  line(0,100,300,100);
  line(0,200,300,200);
  line(100,0,100,300);
  line(200,0,200,300);
}
//マウスが押された場合の動作
//マウスのXとY座標を判断してラジコンを制御
void mousePressed()
{
  //上段中央が押された場合に前進
  if(mouseX >= 100 && mouseX <= 200 && mouseY >= 0 && mouseY <= 100)
  {
    arduino.digitalWrite(2,arduino.HIGH);
    arduino.digitalWrite(3,arduino.LOW);
    arduino.digitalWrite(4,arduino.LOW);
    arduino.digitalWrite(5,arduino.HIGH);
  }
  //下段中央が押された場合に後退
  if(mouseX >= 100 && mouseX <= 200 && mouseY >= 200 && mouseY <= 300)
  {
    arduino.digitalWrite(2,arduino.LOW);
    arduino.digitalWrite(3,arduino.HIGH);
    arduino.digitalWrite(4,arduino.HIGH);
    arduino.digitalWrite(5,arduino.LOW);
  }
  //中央左が押された場合に左旋回
  if(mouseX >= 0 && mouseX <= 100 && mouseY >= 100 && mouseY <= 200)
  {
    arduino.digitalWrite(2,arduino.HIGH);
    arduino.digitalWrite(3,arduino.LOW);
    arduino.digitalWrite(4,arduino.HIGH);
    arduino.digitalWrite(5,arduino.LOW);
  }
  //中央右が押された場合に右旋回
  if(mouseX >= 200 && mouseX <= 300 && mouseY >= 100 && mouseY <= 200)
  {
    arduino.digitalWrite(2,arduino.LOW);
    arduino.digitalWrite(3,arduino.HIGH);
    arduino.digitalWrite(4,arduino.LOW);
    arduino.digitalWrite(5,arduino.HIGH);
  }
}

//マウスをはなした場合の動作
//停止する
void mouseReleased()
{
  arduino.digitalWrite(2,arduino.LOW);
  arduino.digitalWrite(3,arduino.LOW);
  arduino.digitalWrite(4,arduino.LOW);
  arduino.digitalWrite(5,arduino.LOW);
}