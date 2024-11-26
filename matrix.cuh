#include <vector>

namespace matrix {

/// Determines algorithm implementation.
enum ExecutionPolicy {
    naive,
    sequential,
    parallel
};

/// Determines how matrix borders are handled during convolution.
enum ConvolutionMode {
    reflect,
    nearest,
    constant,
};

/// TODO: This is currently templatized, but likely should be either float or double.
///       We need to do some research on the implications of using a float vs. a double with CUDA.
template<class type>
class Matrix2D {
public:
    /// No default constructor
    Matrix2D() = delete;

    Matrix2D(const std::vector<std::vector<type>>& v)
        : rows(v.size()), cols(v[0].size), data(v), exec_policy(naive) {};

    /// Constructor with an ExecutionPolicy
    Matrix2D(const std::vector<std::vector<type>>& v, ExecutionPolicy pol)
        : rows(v.size()), cols(v[0].size), data(v), exec_policy(pol) {};

    /// Overload the * operator to allow for matrix multiplication.
    Matrix2D operator*(const Matrix2D& rhs) {
        switch(exec_policy) {
            case naive:      return naive_matmul(rhs);
            case sequential: return sequential_matmul(rhs);
            case parallel:   return parallel_matmul(rhs);
        }
    }

    /**
     * @brief Transposes this matrix.
     */
    void T();

    /** 
     * @brief Matrix convolution.
     *
     * @param kernel Kernel to slide over the matrix.
     * @param mode   Determines how the matrix borders are handled. Default is 'reflect'.
     * @param cval   Value to fill past edges of input if `mode` is 'constant'.
     *
     * @returns New matrix depicting the convolution.
     */
    Matrix2D convolve(const Matrix2D& kernel, ConvolutionMode mode=reflect, type cval=0);

private:
    std::vector<std::vector<type>> data;
    size_t rows, cols;
    ExecutionPolicy exec_policy;

    /**
     * @brief Naive implementation of matrix multiplication.
     *
     * This method is mainly used as a 'control' for performance tests.
     */
    Matrix2D naive_matmul(const Matrix2D& rhs);

    /**
     * @brief Ideal implementation of sequential matrix multiplication.
     */
    Matrix2D sequential_matmul(const Matrix2D& rhs);

    /**
     * @brief Ideal implementation of parallel matrix multiplication.
     */
    Matrix2D parallel_matmul(const Matrix2D& rhs);
};

}