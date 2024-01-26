#include <iostream>
#include <string>
#include <cctype>

enum TokenType {
    INTEGER,
    FLOAT,
    INVALID
};

struct Token {
    TokenType type;
    std::string lexeme;
};

class Lexer {
public:
    Lexer(const std::string& input) : input_(input), current_pos_(0) {}

    Token getNextToken() {
        skipWhitespace();
        if (current_pos_ >= input_.size()) {
            return {INVALID, ""};  // End of input
        }

        if (isdigit(input_[current_pos_]) || input_[current_pos_] == '-') {
            return scanNumber();
        }

        return {INVALID, ""};  // Invalid token
    }

private:
    std::string input_;
    size_t current_pos_;

    void skipWhitespace() {
        while (current_pos_ < input_.size() && isspace(input_[current_pos_])) {
            current_pos_++;
        }
    }

    Token scanNumber() {
        size_t start_pos = current_pos_;

        // Check for a negative sign
        if (input_[current_pos_] == '-') {
            current_pos_++;
        }

        // Scan digits before the decimal point
        while (current_pos_ < input_.size() && isdigit(input_[current_pos_])) {
            current_pos_++;
        }

        // Check for a decimal point and scan digits after it
        if (current_pos_ < input_.size() && input_[current_pos_] == '.') {
            current_pos_++;  // Consume the decimal point

            // Scan digits after the decimal point
            while (current_pos_ < input_.size() && isdigit(input_[current_pos_])) {
                current_pos_++;
            }

            return {FLOAT, input_.substr(start_pos, current_pos_ - start_pos)};
        }

        return {INTEGER, input_.substr(start_pos, current_pos_ - start_pos)};
    }
};

int main() {
    std::string input = "42 -3.14 123 456.789";
    std::string names[3] = {"INTEGER","FLOAT","INVALID"};
    Lexer lexer(input);

    Token token;
    while ((token = lexer.getNextToken()).type != INVALID) {
        std::cout << "Token: " << token.lexeme << " (Type: " << names[(int)token.type] << ")\n";
    }

    return 0;
}
