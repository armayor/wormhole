# Wormhole ray tracer

## Scope of the program

This program is part of a thesis submitted in partial fulfillment of the requirements for the degree of Physics at the University of Oviedo. The idea was to code a program that generates an image of the surroundings of an Ellis Wormhole using raytracing techniques.

## General idea

The program uses two images to compute the view through an Ellis wormhole. Once a camera position is chosen, it traces back the pixels on the camera local sky back to their origin on one of the two regions connected by the wormhole. To calculate the light rays a Runge-Kutta (2,3) explicit method is used (MATLABS's `ode23` function).

## Instructions

- This program requires MATLAB to run, so make sure you have it installed in your computer.
- To run the program execute wh.m and wait

## Notes

The higher the resolution set for the resulting image, the longer the time it takes the computer to compute each pixel.



## References
- Oliver James et al. «Visualizing Interstellar’s Wormhole». In: American Journal of Physics 83.6 (2015), pags. 486-499. doi: 10.1119/1.4916949. Available at https://arxiv.org/pdf/1502.03809.pdf (last access: 01/07/2021)
- https://cdn.spacetelescope.org/archives/images/wallpaper2/potw1849a.jpg (last access: 01/07/2021)
- https://www.dneg.com/interstellar-wormhole/ (last access: 01/07/2021)