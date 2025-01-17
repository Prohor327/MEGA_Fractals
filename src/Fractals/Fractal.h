#pragma once

#include <glm/vec2.hpp>
#include <Vector2.h>

namespace figure
{
    class Fractal
    {
        protected:
            float *VBO = 0;
            unsigned int *shaderId;
            int amountElements, VBOindex, iterations;
            engine::Vector2 startPoint;
            
            void resize(int amountRepeats);
            virtual void calculateAmountElements(int iterations) = 0;

        public:
            virtual void update(float deltaTime) = 0;
            virtual void withdrawUI() = 0;
            void setScale(glm::vec2 newScale);
            ~Fractal();
    };
}