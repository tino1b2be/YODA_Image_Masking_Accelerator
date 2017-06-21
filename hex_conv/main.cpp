#include "header.h"

using namespace std;

int main(int argc, char **argv) {

    JPEG Input;

    if (argc < 3) {
        printf("Program requires 2 arguments");
        return -1;
    }

    if (!Input.Read(argv[1])) {
        printf("Cannot read image\n");
        return -1;
    }

    std::ofstream out(argv[2]);
    out << "reg[11:0] image["
        << Input.Width*Input.Height - 1
        << ":0] = { ";
    int count = 0;
    for (int y = 0; y < Input.Height; y++) {
        for (int x = 0; x < Input.Width * Input.Components; x += 3) {
            count++;
            out << "12'h_"
                << int_to_hex(Input.Rows[y][x], Input.Rows[y][x + 1], Input.Rows[y][x + 2])
                << ", ";
        }
    }

    out << "} ";

    cout << endl << "Total pixels: " << count << endl;
    out.close();
}

std::string int_to_hex(JSAMPLE r, JSAMPLE g, JSAMPLE b) {
    stringstream stream;
    stream << std::hex << r / 16 << g / 16 << b / 16;
    return stream.str();
}
