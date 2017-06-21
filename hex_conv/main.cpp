
#include "header.h"

using namespace std;

int main(int argc, char** argv){
	
	JPEG Input;
	
	if(!Input.Read(string(argv[0]))){
		printf("Cannot read image\n");
		return -1;
	}
	
	std::ofstream out("out_hex");
    out << "{ ";
	int count = 0;
	for(int y = 0; y < Input.Height; y++){
		for(int x = 0; x < Input.Width*Input.Components; x+=3){
			count++;
			out << "12'h_"
				<< int_to_hex(Input.Rows[y][x], Input.Rows[y][x+1], Input.Rows[y][x+2])
				<< ", ";
		}
	}
	
	cout << endl << "Total pixels: " << count << endl;
	out.close();
}

std::string int_to_hex(JSAMPLE r, JSAMPLE g, JSAMPLE b){	
	stringstream stream;
	stream << std::hex << int(r/16) << int(g/16) << int(b/16);
	return stream.str();
}

