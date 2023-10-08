#include <iostream>
#include <cassert>

#include "embree3/rtcore.h"

// https://www.embree.org/data/embree-siggraph-2018-final.pdf

int main() {
    // create Embree device at application startup
    RTCDevice device = rtcNewDevice(nullptr);
    assert(rtcGetDeviceError(device) == RTC_ERROR_NONE);

    // create scene
    RTCScene scene = rtcNewScene(device);
    assert(rtcGetDeviceError(device) == RTC_ERROR_NONE);
    assert(scene);

    // application vertex and index layout
    struct Vertex   { float x, y, z, a; };
    struct Triangle { int v0, v1, v2, materialID; };

    Vertex v[3];
    v[0].x = -10; v[0].y = -10; v[0].z = 10;
    v[1].x =  20; v[1].y = -10; v[1].z = 10;
    v[2].x =  20; v[2].y =  20; v[2].z = 10;

    Triangle t[1];
    t[0].v0 = 0;
    t[0].v1 = 1;
    t[0].v2 = 2;

    Vertex *vertexPtr = v;
    Triangle *indexPtr = t;

    // create triangle mesh
    RTCGeometry geom = rtcNewGeometry(device, RTC_GEOMETRY_TYPE_TRIANGLE);
    assert(rtcGetDeviceError(device) == RTC_ERROR_NONE);
    assert(geom);

    // share data buffers
    size_t vertexCount = 3;
    size_t indexCount = 3;
    rtcSetSharedGeometryBuffer(geom, RTC_BUFFER_TYPE_VERTEX, 0,
        RTC_FORMAT_FLOAT3, vertexPtr, 0, sizeof(Vertex), vertexCount);
    assert(rtcGetDeviceError(device) == RTC_ERROR_NONE);
    rtcSetSharedGeometryBuffer(geom, RTC_BUFFER_TYPE_INDEX, 0,
        RTC_FORMAT_UINT3, indexPtr, sizeof(Vertex) * vertexCount, sizeof(Triangle), indexCount);
    assert(rtcGetDeviceError(device) == RTC_ERROR_NONE);

    // commit geometry
    rtcCommitGeometry(geom);
    // attach geometry to scene
    unsigned int geomID = 1;
    rtcAttachGeometryByID(scene, geom, geomID);
    assert(rtcGetDeviceError(device) == RTC_ERROR_NONE);

    // commit changes
    rtcCommitScene(scene);
    assert(rtcGetDeviceError(device) == RTC_ERROR_NONE);

    // release objects
    rtcReleaseScene(scene);
    rtcReleaseDevice(device);

    return 0;
}