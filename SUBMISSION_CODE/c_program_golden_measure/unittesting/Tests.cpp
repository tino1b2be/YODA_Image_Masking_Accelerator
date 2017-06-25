//
// Created by Tinotenda Chemvura
// Unit testing class
//
#define CATCH_CONFIG_MAIN  // This tells Catch to provide a main() - only do this in one cpp file

#include "catch.hpp"
#include "../src/Image.h"

TEST_CASE("Testing the threshold function, move constructors and the iterators", "[Testing for Threshold]") {

    // generate random img sample point above
    unsigned char *buffer1 = new unsigned char[16];
    for (int i = 0; i < 16; i++) {
        buffer1[i] = (unsigned char) ((rand() % 95) + 160);
    }
    CHMTIN004::Image im1(4,4,buffer1);
    CHMTIN004::Image im2 = im1 * 150; // move constructor tested here
    CHMTIN004::Image:: iterator one = im2.begin();
    for (;one != im2.end(); one++){
        unsigned char a = *one, b = (unsigned char) 255;
        REQUIRE(a == b); // every value must be 255
    }
}

TEST_CASE("Testing the addition, subtraction and the iterators", "[Testing for Addition and Subtraction]") {

    unsigned char *buffer1 = new unsigned char[16];
    for (int i = 0; i < 16; i++) {
        buffer1[i] = (unsigned char) i;
    }
    unsigned char *buffer2 = new unsigned char[16];
    for (int b = 0; b < 16; b++) {
        buffer2[b] = (unsigned char) (2*b);
    }

    CHMTIN004::Image im1(4,4,buffer1), im2(4,4,buffer2);
    CHMTIN004::Image im3 = im1 + im2; //move constructor tested
    CHMTIN004::Image im4 = im3 - im2;
    CHMTIN004::Image:: iterator one = im3.begin(), two = im4.begin();
    for (int i = 0;one != im3.end(); one++, two++, i++){
        unsigned char a = *one, b = (unsigned char) (3 * i), c = *two, d = (unsigned char) i;
        REQUIRE(a == b);
        REQUIRE(c == d);
    }
}

TEST_CASE("Testing the copy assignment and copy constructors", "[Testing for copy]") {

    unsigned char *buffer1 = new unsigned char[16];
    for (int i = 0; i < 16; i++) {
        buffer1[i] = (unsigned char) i;
    }

    CHMTIN004::Image im1(4,4,buffer1);
    CHMTIN004::Image im2(im1);
    CHMTIN004::Image im3(im1);
    CHMTIN004::Image:: iterator one = im1.begin(), two = im2.begin(), three = im3.begin();

    for (int i = 0;one != im3.end(); one++, two++, three++){

        REQUIRE(*one == *two);
        REQUIRE(*one == *three);
    }
}

TEST_CASE("The qualitative test case that was given as an example in the assignment", "[The qualitative test case]"){

    // create a random image
    unsigned char *buffer1 = new unsigned char[1000000];
    for (int i = 0; i < 1000000; i++) {
        buffer1[i] = (unsigned char) (rand() % 255);
    }

    unsigned char *buffer2 = new unsigned char[1000000];
    for (int i = 0; i < 1000000; i++) {
        buffer2[i] = (unsigned char) ((rand() % 55) + 200);
    }

    unsigned char *buffer3 = new unsigned char[1000000];
    for (int i = 0; i < 1000000; i++) {
        buffer3[i] = (unsigned char) ((rand() % 55) + 200);
    }

    // create a mask
    CHMTIN004::Image M1 = CHMTIN004::Image(1000,1000,buffer1) * 150; // copy and move constructors tested here
    CHMTIN004::Image M2 = !M1;
    CHMTIN004::Image U1(1000,1000,buffer2);
    CHMTIN004::Image U2(1000,1000,buffer3);
    CHMTIN004::Image E1 = U1 / M1;
    CHMTIN004::Image E2 = U2 / M2;
    CHMTIN004::Image O1 = E1+E2;

    E1.save("E1.pgm");
    E2.save("E2.pgm");
    O1.save("Out.pgm");
    // observe the histograms of the exported images.
}
