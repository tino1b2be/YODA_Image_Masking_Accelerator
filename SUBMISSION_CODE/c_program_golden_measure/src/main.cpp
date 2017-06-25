
// Created by Tinotenda Chemvura

#include <iostream>
#include "Image.h"

using namespace std;
using namespace CHMTIN004;

int main(int argc, char *argv[]) {

    if (argc < 3) {
        cerr << "Invalid arguments entered" << endl;
        return 0;
    }
    string option = string(argv[1]);
    if (option.compare("-a") == 0) {
        string f1 = string(argv[2]), f2 = string(argv[3]), out = string(argv[4]);
        Image im1(f1), im2(f2);
        Image imgOut = im1 + im2;
        imgOut.save(out + ".pgm");
    } else if (option.compare("-s") == 0) {
        string f1 = string(argv[2]), f2 = string(argv[3]), out = string(argv[4]);
        Image im1(f1), im2(f2);
        Image imgOut = im1 - im2;
        imgOut.save(out + ".pgm");
    } else if (option.compare("-i") == 0) {
        string f1 = string(argv[2]), out = string(argv[3]);
        Image im1(f1);
        Image imgOut = !im1;
        imgOut.save(out + ".pgm");
    } else if (option.compare("-l") == 0) {
        string f1 = string(argv[2]), f2 = string(argv[3]), out = string(argv[4]);
        Image im1(f1), im2(f2);
        Image imgOut = im1 / im2;
        imgOut.save(out + ".pgm");
    }else if (option.compare("-x") == 0) {
        string f1 = string(argv[2]), f2 = string(argv[3]), out = string(argv[4]);
        Image im1(f1), im2(f2);
        Image imgOut = im1 ^ im2;
        imgOut.save(out + ".pgm");
    } else if (option.compare("-t") == 0) {
        string f1 = string(argv[2]), f = string(argv[3]), out = string(argv[4]);
        Image im1(f1);
        Image imgOut = im1 * stoi(f);
        imgOut.save(out + ".pgm");
    }
    else {
        cerr << "Invalid arguments entered" << endl;
    }

    return 0;
}
