//
// Created by Tinotenda Chemvura
//

#ifndef image_h
#define image_h

#include <memory>
#include <iostream>

namespace CHMTIN004 {

    class Image {

    private:
        Image(int h, int w);
        int width, height;
        std::unique_ptr<unsigned char[]> data;
        std::string filename = "default.pgm";
        void loadImageData();

    public:
        class iterator {
        private:
            unsigned char *samples;
            int index = 0, height = 0, width = 0;
            friend class Image;
            iterator(unsigned char *d, int w, int h) : index(0), height(h), width(w), samples(d) { } // constructor for begin()
            iterator(int i) : index(i) { }    // construtor for end()
            iterator(): index(0){};

        public:
            iterator(const iterator &rhs): index(rhs.index) {   // copy constructor
                samples = rhs.samples;
//                samples = new unsigned char [width*height];
//                for (int i = 0; i < width*height; i++){
//                    samples[i] = rhs.samples[i];
//                }
            }
            iterator(iterator &&rhs) : index(rhs.index), samples(rhs.samples) { rhs.samples = nullptr;} // move constructor
            iterator &operator=(const iterator &rhs) {          //copy assignment constructor
                index = rhs.index;
                samples = rhs.samples;
//                samples = new unsigned char[width * height];
//                for (int i = 0; i < width * height; i++) {
//                    samples[i] = rhs.samples[i];
//                }
                return *this;
            }
            iterator &operator=(iterator &&rhs)  {              //move assignment constructor
                index = rhs.index;
                samples = rhs.samples;
                rhs.samples = nullptr;
                return *this;
            }
            iterator &operator++() {
                index++;
                return *this;
            }                              // ++ prefix increment
            iterator operator++(int) {
                iterator temp = *this;
                index++;
                return temp;
            }                            // postfix increment
            iterator &operator--() {
                index--;
                return *this;
            }                              // ++ prefix decrement
            iterator operator--(int) {
                iterator temp = *this;
                index--;
                return temp;
            }                            // postfix decrement
            unsigned char &operator*() { return samples[index]; }     // dereffence
            iterator * operator->() { return this; }    // dereffence
            bool operator!=(const iterator &rhs) const { return rhs.index != index; } // not equal to
            bool operator==(const iterator &rhs) { return index == rhs.index; }       // equal to
        };
        // END OF ITERATOR CLASS
        Image() : height(0), width(0), filename("_error_"){};
        Image(std::string fname) : filename(fname){loadImageData();};
        Image(int h, int w, unsigned char d[]) : height(h), width(w) {data = std::unique_ptr<unsigned char[]>(d);};
        ~Image() { data.reset(); }     // delete constructor
        Image(const Image &rhs);       // copy constructor
        Image(Image &&rhs);            // move constructor
        Image &operator=(const Image &rhs); // copy assignment constructor
        Image &operator=(Image &&rhs);      // move assignment constructor
        void save(std::string filename);
        void load(std::string fname){filename = fname;loadImageData();}
        Image operator+(const Image& other);
        Image operator-(const Image& other);
        Image operator/(const Image& other);
        Image operator*(int f);
        Image operator^(const Image& other);
        Image operator!();
//        bool operator==(const Image& other);
        friend std::ostream &operator<<(std::ostream& head, const Image& other);
        friend std::istream &operator>>(std::istream& file, Image& other);
        // iterator methods
        iterator begin(void) const { return iterator(data.get(), width, height); }
        iterator end(void) const { return iterator(width * height); }
    };
}

#endif //image_h
