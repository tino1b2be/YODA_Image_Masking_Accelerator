cmake_minimum_required(VERSION 3.7)
project(hex_conv)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -ljpeg")
include_directories(Libraries/LibJPEG Tools)
link_directories(Libraries/LibJPEG)

set(SOURCE_FILES
        Libraries/LibJPEG/jconfig.h
        Libraries/LibJPEG/jmorecfg.h
        Libraries/LibJPEG/jpeg.lib
        Libraries/LibJPEG/jpeglib.h
        Tools/JPEG.cpp
        Tools/JPEG.h
        Tools/Timer.cpp
        Tools/Timer.h
        header.h
        main.cpp
#        makefile
#        test.jpg
        )

add_executable(hex_conv ${SOURCE_FILES})

target_link_libraries(hex_conv jpeg)
