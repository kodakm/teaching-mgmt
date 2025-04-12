#include <iostream>
extern "C" {
    void getStudentDetails(char*, char*, char*, char*);
    void registerStudent(const char*, const char*, const char*, const char*);
}

int main() {
    char name[100], email[100], phone[15], course[50];

    std::cout << "=== Teaching Classes Management ===" << std::endl;
    std::cout << "1. Register Student" << std::endl;
    std::cout << "2. Exit" << std::endl;

    int choice;
    std::cin >> choice;

    if (choice == 1) {
        getStudentDetails(name, email, phone, course);
        registerStudent(name, email, phone, course);
    }

    return 0;
}
