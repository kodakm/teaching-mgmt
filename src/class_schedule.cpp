#include <iostream>
#include <string>
#include "class_schedule.h"

// Simulated class schedule store (we’ll later connect it to Oracle DB)
struct Class {
    std::string subject;
    std::string time;
    std::string instructor;
};

#define MAX_CLASSES 100
Class classList[MAX_CLASSES];
int classCount = 0;

void addClassSchedule() {
    if (classCount >= MAX_CLASSES) {
        std::cout << "Class schedule full.\n";
        return;
    }

    Class c;
    std::cout << "Enter Subject: ";
    std::cin >> c.subject;

    std::cout << "Enter Time (e.g., 10:00AM): ";
    std::cin >> c.time;

    std::cout << "Enter Instructor: ";
    std::cin >> c.instructor;

    classList[classCount++] = c;
    std::cout << "Class added successfully.\n";
}

void listClassSchedules() {
    std::cout << "\n--- Scheduled Classes ---\n";
    for (int i = 0; i < classCount; ++i) {
        std::cout << i + 1 << ". "
                  << "Subject: " << classList[i].subject
                  << ", Time: " << classList[i].time
                  << ", Instructor: " << classList[i].instructor << "\n";
    }
    if (classCount == 0) {
        std::cout << "No classes scheduled yet.\n";
    }
}
