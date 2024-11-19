#include <iostream>

#include "cnn.cuh"

int main() {
    CNN cnn = CNN();
    std::cout << "----------------------------------------------------------\n"
                 "For testing, a vector is initialized with 100 million\n"
                 "elements. It is then put onto the GPU, and transformed.\n"
                 "The transformation is simple -- negate all values in the\n"
                 "vector -- but it illustrates the idea nicely. The first\n"
                 "five elements are printed: 0, -1, -2, -3, -4. If this is\n"
                 "what you see, then everything should be working properly!\n"
                 "----------------------------------------------------------\n";

    cnn.vector_init();
    cnn.print_hello();
}
