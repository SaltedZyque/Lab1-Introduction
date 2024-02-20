## Basics

Loading an Image into Matlab:
clown.mat in the Matlab folder - has greyscale values (0-1) of each pixel of the clown

![][_img/clown.jpg]

Save data into Matlab:
``` 
load clown
```

Show Image:
```
imshow(clown)
```

Note: each data type is a *double*
e.g. the pixel at `clown (20,319)` is `0.1554`

---
## Task 1 - Image Rotation

You are required to write a function which rotates a grey scale image by $\theta$ degrees radian

![][_img/rotated.jpg]

Conditions
- The resulting image should be the same size as the original. (i.e. the matrix storing the image should have the same dimensions, so some clipping of the image may occur).
- If a source pixel lies outside the image you should paint it black.
- Use “nearest pixel” only: for example if the source pixel required is (34.43,46.667) you should use the pixel at the location (34,47) in the source image.
- The rotation should be performed about the centre of the image.
### Forward Mapping

Image rotation can be done with forward mapping:
![][_img/forward_plot.jpg]
![][_img/rotation_eq.jpg]

### Reverse Mapping

> The problem with using the forward mapping directly:
> * There are pixels in the destination image with more than one source pixel. 
> * Some pixels are never written to, leaving the destination image with holes!

![][_img/forward_mapping.jpg]

To solve this is to start from the destination image's pixels, and calculate a reverse mapping to find which source pixel matches that destination most

---
## Task 2 - Image Shearing

You are required to write a function which shears the input image in both the x and y direction and centres the result, as shown in the figure below (using Xshear=0.1, Yshear=0.5).

![][_img/sheared.jpg]

Conditions:
- The resulting image should be the same size as the original. (i.e. the matrix storing the image should have the same dimensions, so some clipping of the image may occur).
- If a source pixel lies outside the image you should paint it black.
- Use “nearest pixel” only, as before.
- You should centre the sheared result (i.e. the centre pixel of the image remains stationary).
- The shear values (Xshear, and Yshear) should be expressed as fractions of the images width and height respectively.
	>Thus when Xshear = 1, Yshear = 0: 
		- (0,0) -> (-height/2,0)  
		- (0,height) -> (height/2,0)

Shear Equation: 
![][_img/shear_plot.jpg]

--- 
## Files:

![][matlab/clown_shear.m]

![][matlab/clown_rotate.m]
