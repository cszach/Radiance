#ifndef OBJECT_H
#define OBJECT_H

class Material;

#include "AABB.cuh"
#include "Ray.cuh"
#include "Vec3.cuh"

struct HitRecord {
  float t;
  Point3 p;
  Vec3 normal;
  bool front_face;
  Material *material;

  __device__ inline void setFaceNormal(const Ray &ray,
                                       const Vec3 &outward_normal) {
    front_face = ray.direction.dot(outward_normal) < 0.0f;
    normal = front_face ? outward_normal : -outward_normal;
  }
};

class Object {
public:
  Point3 position;
  Material *material;
  AABB boundingBox;

  __device__ Object();
  virtual ~Object() = default;

  __device__ virtual bool hit(const Ray &ray, Interval ray_t,
                              HitRecord &rec) const = 0;

  __device__ virtual void computeBoundingBox() = 0;
};

#endif // OBJECT_H
