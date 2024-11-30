#include "matrix.cuh" 

using namespace matrix;

/**
* @brief Abstract base class for all layers.
* 
* This class defines the common interface for all layers, with methods for
* the forward and backward passes. The `layerData` matrix holds data needed
* for gradient calculation such as input matricies, gradients, or indicies
* depending on the layer type. 
*/
class Layer {
    protected:
        Matrix2D layerData;
        
    public:
        virtual Matrix2D forwardPass(Matrix2D &layer) = 0;
        virtual Matrix2D backwardPass(Matrix2 &layer) = 0;
}