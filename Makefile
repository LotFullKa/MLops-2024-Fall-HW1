CXX=g++
CXXFLAGS=-std=c++11 -O3 -march=native -Wall $(shell python3 -m pybind11 --includes)
PY_LDFLAGS=$(shell python3-config --ldflags) -shared -fPIC

SRC=Lpnorm.cpp
OUTPUT=lpnorm_core

all: $(OUTPUT)

$(OUTPUT): $(SRC)
	$(CXX) $(CXXFLAGS) -fPIC -c $(SRC) -o Lpnorm.o
	$(CXX) Lpnorm.o -o $(OUTPUT) $(PY_LDFLAGS)

clean:
	rm -f *.o $(OUTPUT)