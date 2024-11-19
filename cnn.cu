#include "cnn.cuh"

#include <iostream>

#include <thrust/host_vector.h>
#include <thrust/device_vector.h>
#include <thrust/copy.h>
#include <thrust/fill.h>
#include <thrust/sequence.h>

/// Initialize a vector on the GPU and do some operations.
/// Primarily just a "hello world" of sorts.
void CNN::vector_init() {
    // Initialize large device vector
    thrust::device_vector<int> D(100'000'000);
    
    // Fill er up, and transform it!
    thrust::sequence(D.begin(), D.end());
    thrust::transform(D.begin(), D.end(), 
                      D.begin(), thrust::negate<int>{});
    
    // Grab the first 5 onto host
    thrust::host_vector<int> H(D.begin(), D.begin() + 5);

    // Print those
    for (const auto& x : H) {
        std::cout << x << " ";
    }

    std::cout << std::endl;
}

void CNN::print_hello() {
    std::cout << "Hello from the CNN" << std::endl;
}
