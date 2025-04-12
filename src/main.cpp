#include <iostream>
extern "C" {
    void getStudentDetails(char*, char*, char*, char*);
    void registerStudent(const char*, const char*, const char*, const char*);
}
#include "class_schedule.h"

int main() {
    char name[100], email[100], phone[15], course[50];

    int choice;
    do {
        std::cout << "\n=== Teaching Classes Management ===" << std::endl;
        std::cout << "1. Register Student" << std::endl;
        std::cout << "2. Add Class Schedule" << std::endl;
        std::cout << "3. View Class Schedules" << std::endl;
        std::cout << "4. Exit" << std::endl;
        std::cin >> choice;

        switch (choice) {
            case 1:
                getStudentDetails(name, email, phone, course);
                registerStudent(name, email, phone, course);
                break;
            case 2:
                addClassSchedule();
                break;
            case 3:
                listClassSchedules();
                break;
        }
    } while (choice != 4);

    return 0;
}
