#include <iostream>
#include <string>
#include <regex>

int main() {
    // Input string containing numbers
    std::string input = "42 -3.14 123 456.789";

    // Regular expression to match integers and floating-point numbers
    std::regex numberRegex(R"([-+]?\d+(\.\d+)?)");

    // Iterator for searching through the input string
    std::sregex_iterator iterator(input.begin(), input.end(), numberRegex);
    std::sregex_iterator end;

    while (iterator != end) {
        std::smatch match = *iterator;
        std::cout << "Token: " << match.str() << " (Type: NUMBER)\n";
        ++iterator;
    }

    return 0;
}
