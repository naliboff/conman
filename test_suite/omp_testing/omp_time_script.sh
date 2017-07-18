for i in {1..8}; do 
export OMP_NUM_THREADS=$i; 
echo threads $i grid 32
time ../../conman.openmp< run32x32; 
cp tser.32x32 tser.32x32.$i
cp out.32x32 out.32x32.$i
echo threads $i grid 64
time ../../conman.openmp< run64x64; 
cp tser.64x64 tser.64x64.$i
cp out.64x64 out.64x64.$i
echo threads $i grid 128 
time ../../conman.openmp< run128x128; 
cp tser.128x128 tser.128x128.$i
cp out.128x128 out.128x128.$i
echo threads $i grid 256 
time ../../conman.openmp< run256x256; 
cp tser.256x256 tser.256x256.$i
cp out.256x256 out.256x256.$i
echo threads $i grid 512 
time ../../conman.openmp< run512x512; 
cp tser.512x512 tser.512x512.$i
cp out.512x512 out.512x512.$i
done
