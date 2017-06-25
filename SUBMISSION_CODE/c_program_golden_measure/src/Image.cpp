//
// Created by Tinotenda Chemvura
//

#include <fstream>
#include <memory>
#include "Image.h"

using std::ifstream;
using std::string;
using std::cout;
using std::endl;

namespace CHMTIN004 {

    void Image::loadImageData() {

        ifstream in(filename, std::ios::binary);
        if (in.is_open()) {
            string temp;
            getline(in, temp);
            if (temp.compare("P5") != 0) {
                std::cerr << "Invalid image file " + filename + " has been selected" << endl;
                return;
            }
            while (in.good()) {
                in >> temp;
                if (temp.compare("#") == 0) {
                    // comment line
                    getline(in, temp);
                    continue;
                } else {
                    // comments finished, set height and width
                    height = stoi(temp);
                    in >> std::ws >> width >> std::ws >> temp >> std::ws;
                    break;
                }
            }
            // finished processing header
            data = std::unique_ptr<unsigned char[]>(new unsigned char[height * width]); // set the size the array
            in.read((char *) data.get(), height * width);
            in.close();
        } else
            std::cerr << "File could not be opened" << endl;
        in.close();
    }

    void Image::save(string filename) {
        std::ofstream out(filename, std::ios::binary);
        out << "P5" << endl;
        out << height << " " << width << "\n" << "255" << endl;
        out.write((char *) data.get(), height * width);
        out.close();
    }

    Image::Image(const Image &rhs) {
        width = rhs.width;
        height = rhs.height;
        data = std::unique_ptr<unsigned char[]>(new unsigned char[height * width]);
        // copy the values using iterator
        Image::iterator beg = this->begin(), end = this->end();
        Image::iterator inStart = rhs.begin(), inEnd = rhs.end();
        while (beg != end) {
            *beg = *inStart;
            ++beg;
            ++inStart;
        }

    }

    Image::Image(Image &&rhs) {
        height = rhs.height;
        width = rhs.width;
        filename = move(rhs.filename);
        data = std::unique_ptr<unsigned char[]>(rhs.data.release()); // rhs.data points to null
        rhs.width = 0;
        rhs.height = 0;
    }

    Image::Image(int h, int w) : height(h), width(w) {
        data = std::unique_ptr<unsigned char[]>(new unsigned char[height * width]);
    }

    Image &Image::operator=(const Image &rhs) {
        if (this != &rhs) {
            width = rhs.width;
            height = rhs.height;
            if (data.get() != nullptr) data.reset(); // destroy whatever may be inside THIS.data
            data = std::unique_ptr<unsigned char[]>(new unsigned char[height * width]);

            // copy the values using iterator
            Image::iterator beg = this->begin(), end = this->end();
            Image::iterator inStart = rhs.begin(), inEnd = rhs.end();
            while (beg != end) {
                *beg = *inStart;
                ++beg;
                ++inStart;
            }
        }
        return *this;
    }

    Image &Image::operator=(Image &&rhs) {
        if (this != &rhs) {
            width = rhs.width;
            height = rhs.height;
            if (data.get() != nullptr) data.reset(); // destroy whatever may be inside THIS.data
            data = std::unique_ptr<unsigned char[]>(rhs.data.release());
            rhs.data.reset();
            rhs.width = 0, rhs.height = 0;
        }
        return *this;
    }

    Image Image::operator+(const Image &other) {
        if (height != other.height && width != other.width) {
            std::cerr << "Dimensions mismatch." << endl;
            return Image();
        }
        Image out(height, width);
        for (Image::iterator it1 = this->begin(), it2 = other.begin(), outIT = out.begin();
             it1 != this->end(); ++it1, ++it2, ++outIT) {
            *outIT = *it1 + *it2;
            if (*outIT > 255)
                *outIT = 255;
        }
        return out;
    }

    Image Image::operator-(const Image &other) {
        if (height != other.height && width != other.width) {
            std::cerr << "Dimensions mismatch." << endl;
            return Image();
        }
        Image out(height, width);
        Image::iterator it1, it2, outIT;

        for (it1 = this->begin(), it2 = other.begin(), outIT = out.begin(); it1 != this->end(); ++it1, ++it2, ++outIT) {
            *outIT = *it1 - *it2;
            if (*outIT < 0)
                *outIT = 0;
        }
        return out;
    }

    Image Image::operator/(const Image &other) {
        if (height != other.height && width != other.width) {
            std::cerr << "Dimensions mismatch." << endl;
            return Image();
        }
        Image out(height, width);
        Image::iterator it1, it2, outIT;

        for (it1 = this->begin(), it2 = other.begin(), outIT = out.begin(); it1 != this->end(); ++it1, ++it2, ++outIT) {
            *outIT = (unsigned char) (*it2 == 255 ? *it1 : 0);
        }
        return out;
    }

    Image Image::operator!() {
        Image out(height, width);
        Image::iterator it1, outIT;
        for (it1 = this->begin(), outIT = out.begin(); it1 != this->end(); it1++, outIT++) {
            *outIT = (unsigned char) (255 - *it1);
        }
        return out;
    }

    Image Image::operator*(int f) {
        Image out(height, width);
        Image::iterator it1, outIT;
        for (it1 = this->begin(), outIT = out.begin(); it1 != this->end(); it1++, outIT++) {
            *outIT = (unsigned char) (*it1 > f ? 255 : 0);
        }
        return out;
    }

    Image Image::operator^(const Image& other) {
        if (height != other.height && width != other.width) {
            std::cerr << "Dimensions mismatch." << endl;
            return Image();
        }
        Image out(height, width);
        Image::iterator it1, it2, outIT;

        for (it1 = this->begin(), it2 = other.begin(), outIT = out.begin(); it1 != this->end(); ++it1, ++it2, ++outIT) {
            *outIT = *it1 ^ *it2;
            if (*outIT < 0)
                *outIT = 0;
            else if (*outIT > 255)
                *outIT = 255;
        }
        return out;
    }

    std::ostream &operator<<(std::ostream &out, const Image &other) {
        if (out.good()) {
            out << "P5" << endl;
            out << other.height << " " << other.width << "\n" << "255" << endl;
            out.write((char *) other.data.get(), other.height * other.width);
        } else
            std::cerr << "File could not be opened." << endl;
        return out;
    }

    std::istream &operator>>(std::istream &in, CHMTIN004::Image &other) {
        if (in.good()) {
            string temp;
            getline(in, temp);
            if (temp.compare("P5") != 0) {
                std::cerr << "Invalid image file " + other.filename + " has been selected" << endl;
                return in;
            }
            while (in.good()) {
                in >> temp;
                if (temp.compare("#") == 0) {
                    // comment line
                    getline(in, temp);
                    continue;
                } else {
                    // comments finished, set height and width
                    other.height = stoi(temp);
                    in >> std::ws >> other.width >> std::ws >> temp >> std::ws;
                    break;
                }
            }
            // finished processing header
            other.data = std::unique_ptr<unsigned char[]>(
                    new unsigned char[other.height * other.width]); // set the size the array
            in.read((char *) other.data.get(), other.height * other.width);
        } else
            std::cerr << "File could not be opened" << endl;
        return in;
    }

}
