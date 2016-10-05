Particle [] bob;
float speedBoost = 0;


void setup()
{
	size(800,800);
	bob = new Particle[2000];
	for (int i = 0; i < bob.length; i++) {
		bob[i] = new NormalParticle();
	}
	for (int i = bob.length-1; i < bob.length; i++) {
		bob[i] = new OddballParticle();
	}
	for(int i = bob.length-3; i < bob.length-1; i++) {
		bob[i] = new JumboParticle();
	}
}
void draw()
{
	fill(0,0,0,70);
	rect(0,0,800,800);
	for (int i = 0; i < bob.length; i++) {
		bob[i].move();
		bob[i].show();
	}
}

void mousePressed() {
	speedBoost = ((float)(speedBoost+Math.random()));
}
class NormalParticle implements Particle
{
	int myColor;
	float myX, myY, angle, speed;

	NormalParticle() {
		myX = 400 + (int)(Math.random()*49) - 24;
		myY = 400 + (int)(Math.random()*49) - 24;
		angle = (float)(Math.PI*2*Math.random());
		speed = (float)(Math.random()*5+5+speedBoost);

		myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255),200);
	}

	public void move() {
		myX = myX + cos(angle)*speed;
		myY = myY + sin(angle)*speed;

		if(myX > 800 || myX < 0) {
			myX = 400 + (int)(Math.random()*49) - 24;
			myY = 400 + (int)(Math.random()*49) - 24;
			angle = (float)(Math.PI*2*Math.random());
			speed = (float)(Math.random()*5+5+speedBoost);

		}
		if(myY > 800 || myY < 0) {
			myX = 400 + (int)(Math.random()*49) - 24;
			myY = 400 + (int)(Math.random()*49) - 24;
			angle = (float)(Math.PI*2*Math.random());
			speed = (float)(Math.random()*5+5+speedBoost);
		}
	}

	public void show() {
		fill(myColor);
		ellipse(myX,myY,3,3);
	}

}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle
{
	int myColor;
	float myX, myY, angle, speed;

	OddballParticle() {
		myX = 400 + (int)(Math.random()*49) - 24;
		myY = 400 + (int)(Math.random()*49) - 24;
		angle = (float)(Math.PI*2*Math.random());
		speed = (float)(Math.random()*5+25+speedBoost);

		myColor = color(255,255,255,50-(int)(speedBoost/2));
	}

	public void move() {
		myX = myX + cos(angle)*speed;
		myY = myY + sin(angle)*speed;

		if(myX > 800 || myX < 0) {
			myX = mouseX + (int)(Math.random()*49) - 24;
			myY = mouseY + (int)(Math.random()*49) - 24;
			angle = (float)(Math.PI*2*Math.random());
			speed = (float)(Math.random()*5+(speedBoost/5));
		}
		if(myY > 800 || myY < 0) {
			myX = mouseX + (int)(Math.random()*49) - 24;
			myY = mouseY + (int)(Math.random()*49) - 24;
			angle = (float)(Math.PI*2*Math.random());
			speed = (float)(Math.random()*5+(speedBoost/5));
		}
	}

	public void show() {
		fill(myColor);
		ellipse(myX,myY,50,50);

	}
}
class JumboParticle extends NormalParticle
{
	JumboParticle() {
		speed = (float)(Math.random()+2+speedBoost);
	}
	public void move() {
		myX = myX + cos(angle)*speed;
		myY = myY + sin(angle)*speed;

		if(myX > 800 || myX < 0) {
			myX = 400 + (int)(Math.random()*49) - 24;
			myY = 400 + (int)(Math.random()*49) - 24;
			angle = (float)(Math.PI*2*Math.random());
			speed = (float)(Math.random()+2+speedBoost);
			myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255),200);
		}
		if(myY > 800 || myY < 0) {
			myX = 400 + (int)(Math.random()*49) - 24;
			myY = 400 + (int)(Math.random()*49) - 24;
			angle = (float)(Math.PI*2*Math.random());
			speed = (float)(Math.random()+2+speedBoost);
			myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255),200);
		}
	}
	public void show() {
		fill(myColor);
		ellipse(myX,myY,30,30);
	}
}

