NormalParticle bob;


void setup()
{
	size(800,800);
	bob = new NormalParticle();
}
void draw()
{
	background(0);
	bob.move();
	bob.show();
}
class NormalParticle
{
	int myColor;
	float myX, myY, angle, speed;

	NormalParticle() {
		myX = 400;
		myY = 400;
		angle = (float)(Math.PI*2*Math.random());
		speed = (float)(Math.random()*5);

		myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255),200);
	}

	public void move() {
		myX = myX + cos(angle)*speed;
		myY = myY + speed;
	}

	public void show() {
		fill(myColor);
		ellipse(myX,myY,8,8);
	}

}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

