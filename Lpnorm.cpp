#include <cmath>
#include <vector>
#include <stdexcept>
#include <pybind11/pybind11.h>
#include <pybind11/stl.h>



double LpNorm(const std::vector<double> &arr, double p) {
    if (p <= 0) {
        throw std::invalid_argument("p должно быть положительным");
    }
    
    double sum = 0.0;
    for (double value : arr) {
        sum += std::pow(std::abs(value), p);
    }
    
    return std::pow(sum, 1.0 / p);
}

PYBIND11_MODULE(lpnorm, m) {
    m.doc() = "Module wtih one method"; 
    m.def("lp_norm", &LpNorm, R"doc(
          Compute Lp norm 

          Parameters:
            arr : list of float
            
          Returns:
            float
                Lp norm of vector
      )doc");
}