// Display and output parameters:

final int DRAW_FREQ = 100;                            // Draw frequency (Hz or Frame-per-second)
final int DISPLAY_SIZE_X = 1000;                      // Display width (pixels)
final int DISPLAY_SIZE_Y = 1000;                      // Display height (pixels)
final int [] BACKGROUND_COLOR = {20, 30, 40};         // Background color (RGB)
       // File to write the simulation variables 


// Parameters of the problem:

final float TS = 0.01;     // Initial simulation time step (s)
final float NT = 160.0;    // Rate at which the particles are generated (number of particles per second) (1/s)           
final float L = 4.0;       // Particles' lifespan (s) 
final float K = 0.035;
final float r = 0.2;
final float G = 9.8;     // Gravedad m/s² 
final float Gcm = G * 100; // Gravedad cm/s²
final float m = 0.01;
//
//
//


// Constants of the problem:

final String TEXTURE_FILE = "texture.png";
final PVector Gc = new PVector(0, Gcm);           
// Gravity vector
final PVector S0 = new PVector(DISPLAY_SIZE_X/2, DISPLAY_SIZE_Y);  
// Initial position
final PVector V0 = new PVector(0.0, 0.0);      
// Initial velocity
final float vx1 = -200;                                              // Velocity in x for the first particle system 
final float vx2 = 0;                                                 // Velocity in x for the second particle system                                               
final float vx3 = 200;                                               // Velocity in x for the third particle system 
final float vx4 = 400;                                               // Velocity in x for the forth particle system 
final float vx5 = -400;                                                // Velocity in x for the fifth particle system 
final float vy = -1000;                                              // Velocity in y for all particle systems
//
//
//
