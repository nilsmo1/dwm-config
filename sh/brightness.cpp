#include <fstream>
#include <string>

const std::string MAX_B  = "/sys/class/backlight/intel_backlight/max_brightness";
const std::string CURR_B = "/sys/class/backlight/intel_backlight/brightness";

int main(int argc, char** argv) {
    if (argc != 2) return 1;
    std::ifstream max{MAX_B};
    std::ifstream curr{CURR_B};
    int curr_b{}, max_b{}, delta_b{100}, b{};
    curr >> curr_b;
    max  >> max_b;
    std::ofstream curr_out{CURR_B};
    if ((std::string)argv[1] == "inc") {
        if ((b = curr_b + delta_b) <= max_b)
            curr_out << b;
        else curr_out << curr_b;
        return 0;
    } else if ((std::string)argv[1] == "dec") {
        if ((b = curr_b - delta_b) >= 0)
            curr_out << b;
        else curr_out << curr_b;
        return 0;
    } else if ((std::string)argv[1] == "max") {
        curr_out << max_b;
        return 0;
    }
    return 0;
}


