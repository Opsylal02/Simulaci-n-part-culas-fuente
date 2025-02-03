 //<>//
float _timeStep;        // Simulation time-step (s)
float _simTime = 0.0;   // Simulated time (s)

boolean _useTexture = false;



// Variables to be monitored:



ParticleSystem p1;  
// Left particle system
ParticleSystem p2;   
// Center particle system            
ParticleSystem p3;   
// Right particle system
ParticleSystem p4;   
 

PVector V;

// Main code:

void settings()
{
   size(DISPLAY_SIZE_X, DISPLAY_SIZE_Y);
}

void setup()
{
   frameRate(DRAW_FREQ);
   background(BACKGROUND_COLOR[0], BACKGROUND_COLOR[1], BACKGROUND_COLOR[2]);

   initSimulation();
}


void keyPressed()
{
   if (key == 'r' || key == 'R')
      restartSimulation();
   else if (key == 't' || key == 'T')
      _useTexture = !_useTexture;
   else if (key == '+')
      _timeStep *= 1.1;
   else if (key == '-')
      _timeStep /= 1.1;
}

void initSimulation()
{
   p1 = new ParticleSystem(S0);
   p2 = new ParticleSystem(S0);
   p3 = new ParticleSystem(S0);
   p4 = new ParticleSystem(S0);
  
   _simTime = 0.0;
   _timeStep = TS;
      
   
}

void restartSimulation()
{
   initSimulation();
}


void draw()
{
   drawStaticEnvironment();
   drawMovingElements();
   
 
   updateSimulation();
  

}

void drawStaticEnvironment()
{
   background(BACKGROUND_COLOR[0], BACKGROUND_COLOR[1], BACKGROUND_COLOR[2]);
   circle(S0.x, S0.y, 10);    // Center of the particle system
}

void drawMovingElements()
{
   p1.render(_useTexture);
   p3.render(_useTexture);
   p2.render(_useTexture);
    p4.render(_useTexture);
    
}

void updateSimulation()
{
   
    for(int i = 0; i < NT * _timeStep; i++)
    {
    V = new PVector(vx1 + random(-20, 20), vy + random(-20, 20));
    p1.addParticle(m, V0, V, r, 200,L);
    
    V = new PVector(vx2 + random(-20, 20), vy + random(-20, 20));
    p2.addParticle(m, V0, V, r, 200,L);
    
    V = new PVector(vx3 + random(-20, 20), vy + random(-20, 20));
    p3.addParticle(m, V0, V, r, 200,L);
    
    V = new PVector(vx4 + random(-20, 20), vy + random(-20, 20));
    p4.addParticle(m, V0, V, r, 200,L);
    
       
 
    }
    
    p1.update(_timeStep);
    p2.update(_timeStep);
    p3.update(_timeStep);
     p4.update(_timeStep);
     
    
    
  
}
