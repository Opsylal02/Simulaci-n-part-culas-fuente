// Class for a simple particle with no rotational motion
public class Particle
{
   ParticleSystem _ps;  // Reference to the parent ParticleSystem
   int _id;             // Id. of the particle (-)

   float _m;            // Mass of the particle (kg)
   PVector _s;          // Position of the particle (m)
   PVector _v;          // Velocity of the particle (m/s)
   PVector _a;          // Acceleration of the particle (m/(s·s))
   PVector _F;          // Force applied on the particle (N)
   float _energy;       // Energy (J)

   float _radius;       // Radius of the particle (m)
   color _color;        // Color of the particle (RGBA)
   float _lifeSpan;     // Total time the particle should live (s)
   float _timeToLive;   // Remaining time before the particle dies (s)

   Particle(ParticleSystem ps, int id, float m, PVector s, PVector v, float radius, color c, float lifeSpan)
   {
      _ps = ps;
      _id = id;

      _m = m;
      _s = s;
      _v = v;

      _a = new PVector(0.0, 0.0);
      _F = new PVector(0.0, 0.0);
      _energy = 0.0;

      _radius = radius;
      _color = c;
      _lifeSpan = lifeSpan;
      _timeToLive = _lifeSpan;
   }

   void setPos(PVector s)
   {
      _s = s;
   }

   void setVel(PVector v)
   {
      _v = v;
   }

   PVector getForce()
   {
      return _F;
   }

   float getEnergy()
   {
      return _energy;
   }

   float getRadius()
   {
      return _radius;
   }

   float getColor()
   {
      return _color;
   }

   float getTimeToLive()
   {
      return _timeToLive;
   }

   boolean isDead()
   {
      return (_timeToLive <= 0.0);
   }

   void update(float timeStep)
   {
      _timeToLive -= timeStep;

      updateSimplecticEuler(timeStep);
      updateEnergy();
   }

   void updateSimplecticEuler(float timeStep)
   {
      updateForce();
      // v(t+dt) = v(t) + a(t) * dt
      // s(t+dt) = s(t) + v(t+dt) * dt
      
      _a = _F.div(_m);
      _v.add(PVector.mult(_a, timeStep));  
      _s.add(PVector.mult(_v, timeStep));    
   }

   void updateForce()
   {
      PVector Froz = PVector.mult(_v, -K);
      PVector Fpeso = PVector.mult(Gc, _m);
      _F = PVector.add(Froz, Fpeso);
   }

   void updateEnergy()
   {
      float h = (DISPLAY_SIZE_Y - _s.y)/100;
      float Ep = _m * G * h;
      float Ec = _v.mag() * _v.mag() * _m / 200;
      _energy = Ep + Ec;
   }

   void render(boolean useTexture)
   {
      if (useTexture)
      {
        PImage imagen = _ps._tex;
        imageMode(CENTER);
        image(imagen,_s.x, _s.y);

      } 
      else
      {
        noStroke();
        fill(152,200,255);
        ellipse(_s.x, _s.y, 8, 8);
      }
   }
}
