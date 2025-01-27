# Raydiance

[blog]: https://cszach.github.io/Raydiance/

This hopefully will be my long-term ray tracing software project. I will keep
adding features to the ray tracer as I learn and discover ray tracing
techniques.

## Goal

At the moment, I see two primary goals for this project:

1. Declare a public ray tracing API so external applications may include it; and
2. Create an interactive application window (perhaps using ImGui) to demonstrate
   the ray tracing API.

## Current status

CUDA-accelerated ray tracing with support for spheres and 3 materials:
Lambertian, metal, and dielectric. Camera is positionable. Rendering is
accelerated using a BVH.

[![Current output image.](image.png)](image.ppm)

_This image was rendered at 10 samples and 5 bounces per ray, and took 37
seconds to render on an RTX 3080 Mobile._

## Build

Requirements:

- CMake version 3.5+
- GCC (will add support for other compilers in the future)
- The CUDA Toolkit

> **Note**: Replace the CUDA include path in `CMakeLists.txt` with where
> `<curand_kernel.h>` is on your system.

```
cmake -B build .
cmake --build build
```

The binary will be in the `bin` folder.

## Test

After building the program, you can run unit tests by doing:

```bash
cd build
ctest
```

Or, if you want to see a more verbose output:

```bash
cd build/bin
./raydiance_test
```

## Blog

I am setting up a development blog for this project. When it is done, it should
live [here][blog].
