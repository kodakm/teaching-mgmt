#include <stdio.h>
#include <string.h>

void getStudentDetails(char *name, char *email, char *phone, char *course) {
    printf("Enter Name: ");
    scanf("%s", name);
    printf("Enter Email: ");
    scanf("%s", email);
    printf("Enter Phone: ");
    scanf("%s", phone);
    printf("Enter Course: ");
    scanf("%s", course);
}
