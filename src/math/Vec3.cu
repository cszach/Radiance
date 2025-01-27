#include "Vec3.cuh"

#include <cmath>

__device__ Vec3::Vec3() : x(0), y(0), z(0) {}
__device__ Vec3::Vec3(float x, float y, float z) : x(x), y(y), z(z) {}

__device__ float Vec3::get(int i) const {
  if (i == 0) {
    return x;
  }
  if (i == 1) {
    return y;
  }
  /* else */ return z;
}
__device__ void Vec3::set(float x, float y, float z) {
  this->x = x;
  this->y = y;
  this->z = z;
}

__device__ float Vec3::length() const { return sqrt(lengthSquared()); }
__device__ float Vec3::lengthSquared() const { return x * x + y * y + z * z; }
__device__ bool Vec3::equals(const Vec3 &v) const {
  return x == v.x && y == v.y && z == v.z;
}
__device__ bool Vec3::isNearZero() const {
  auto epsilon = 1e-8;
  return fabs(x) < epsilon && fabs(y) < epsilon && fabs(z) < epsilon;
}

__device__ Vec3 Vec3::operator-() const { return Vec3(-x, -y, -z); }

__device__ Vec3 &Vec3::operator+=(const Vec3 &v) {
  x += v.x;
  y += v.y;
  z += v.z;

  return *this;
}

__device__ Vec3 &Vec3::operator-=(const Vec3 &v) {
  x -= v.x;
  y -= v.y;
  z -= v.z;

  return *this;
}

__device__ Vec3 &Vec3::operator*=(const Vec3 &v) {
  x *= v.x;
  y *= v.y;
  z *= v.z;

  return *this;
}

__device__ Vec3 &Vec3::operator/=(const float t) {
  x /= t;
  y /= t;
  z /= t;

  return *this;
}
