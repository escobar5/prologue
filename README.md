# prologue
Generative algorithm with particles that attract/repel.


<p align="center">
  <img alt="Prologue" src="https://github.com/jse-co/prologue/blob/master/images/prologue_1.png?raw=true" width="500" height="500" />
</p>


This code is based on this blog post: https://generateme.wordpress.com/2017/01/03/grow-own-iris/

The main idea is that there are initially some particles in a square in the center, they start to move in time as other particles attract or repel them.

If you play with the time step, number of particles, mood function, initial position, you get a lot of interesting effects.

In `prologue_2.pde` I've changed the positional logic a little, instead of having a number of particles I split the square in a number of cells, and put a particle in each cell.

Here are some examples of the diverse results:

<p align="center">
  <img alt="Prologue" src="https://github.com/jse-co/prologue/blob/master/images/prologue_2.png?raw=true" width="500" height="500" />
  <img alt="Prologue" src="https://github.com/jse-co/prologue/blob/master/images/prologue_3.png?raw=true" width="500" height="500" />
  <img alt="Prologue" src="https://github.com/jse-co/prologue/blob/master/images/prologue_4.png?raw=true" width="500" height="500" />
  <img alt="Prologue" src="https://github.com/jse-co/prologue/blob/master/images/prologue_5.png?raw=true" width="500" height="500" />
  <img alt="Prologue" src="https://github.com/jse-co/prologue/blob/master/images/prologue_6.png?raw=true" width="500" height="500" />
  <img alt="Prologue" src="https://github.com/jse-co/prologue/blob/master/images/prologue_7.png?raw=true" width="500" height="500" />
  <img alt="Prologue" src="https://github.com/jse-co/prologue/blob/master/images/prologue_8.png?raw=true" width="500" height="500" />
</p>
