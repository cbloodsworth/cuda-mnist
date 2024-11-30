#include "matrix.cuh" 

using namespace matrix;

/**
* @brief Abstract base class for layer class
 */
class Layer {
    public: 
        virtual ~Layer() {};
        virtual Matrix2D forwardPass(Matrix2D &layer) = 0; 
        virtual Matrix2D backwardPass(Matrix2D &layer) = 0;
}

/**
* @brief Abstract base class for all gradient calculating layers
 */
class GradientLayer : public Layer {
    protected:
        Matrix2D inputLayer;
        
    public:
        virtual Matrix2D forwardPass(Matrix2D &layer) = 0;
        virtual Matrix2D backwardPass(Matrix2d &layer) = 0;
}