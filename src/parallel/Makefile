all : archive extract

archive : Compressor.cpp
	mpic++ -std=c++11 -lhdf5 -fopenmp -DOMPI_SKIP_MPICXX Compressor.cpp -o archive

extract : Decompressor.cpp
	g++ -std=c++11 Decompressor.cpp -o extract

clean :
	@rm -f archive
	@rm -f extract

.PHONY : all clean
