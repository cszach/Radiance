#include <gtest/gtest.h>

#include "Ray.hpp"
#include "Vec3.hpp"
#include <iostream>

class RayTest : public ::testing::Test {
public:
  Ray default_ray;
  Ray r;

protected:
  void SetUp() override {
    default_ray = Ray();
    r = Ray(Point3(0, 1, 2), Vec3(3, 4, 5));
  }
};

TEST_F(RayTest, GettersAndSetters) {
  EXPECT_TRUE(default_ray.origin.equals(Point3(0, 0, 0)));
  EXPECT_TRUE(default_ray.direction.equals(Vec3(0, 0, -1)));

  EXPECT_TRUE(r.origin.equals(Point3(0, 1, 2)));
  EXPECT_TRUE(r.direction.equals(Vec3(3, 4, 5)));
}

// TEST_F(RayTest, At) {
//   EXPECT_TRUE(r.at(0.0f).equals(Point3(0.0f, 1.0f, 2.0f)));
//   EXPECT_TRUE(r.at(1.0f).equals(Point3(3.0f, 5.0f, 7.0f)));
//   EXPECT_TRUE(r.at(2.0f).equals(Point3(6.0f, 9.0f, 12.0f)));
// }
