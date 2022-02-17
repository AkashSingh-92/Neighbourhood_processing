# Neighbourhood_processing

( In Neighbourhood processing we work on each at pixel at a time depending on the neighbourhood pixels)

Neighbourhood Processing is basically done to remove Noise from an image using various filtering mask by performing 2-D convolution between input images's neighbourhood and various filtering Masks.

There are two types of filtering
  1. Low pass Filtering
  2.High pass Filtering

<p>
1. Low pass filtering: Retains low frequency 
  
  <br>
  a. averaging method (It is used to remove Gaussian noise)
  In this we use a averaging mask w=[1 1 1;1 1 1;1 1 1]/9
  </br>
  <br>
  b. median method (It is used to remove Salt & papper noise)
  In this we take 9 values from neighbourhood sort them in ascending order then take out the middle value
  </br>
</p>

2. High pass filtering: Retains High frequencies
   In this we use a std. high pass filter mask w = [-1 -1 -1;-1 8 -1;-1 -1 -1]
   i.e sumission of all elements in the mask is '0'(zero)
   ,after applying this filter we get the edges of image only

   high boost filtering:
   In this we use a mask w = [-1 -1 -1;-1 n -1;-1 -1 -1]  where n>8
   i.e sumission of all elements in the mask is should not be '0'(zero)
   ,after applying this filter we get the edges of image along with some background information
