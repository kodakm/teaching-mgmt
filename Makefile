# Teaching Classes Management System - Makefile

ORACLE_HOME = C:/App/db_home
PROC = "$(ORACLE_HOME)/bin/proc"
CC = gcc
CXX = g++
CFLAGS = -I"$(ORACLE_HOME)/precomp/public"
LDFLAGS = -L"$(ORACLE_HOME)/lib" -lclntsh

SRC_DIR = src
BUILD_DIR = build

# Files
OBJS = $(BUILD_DIR)/main.o $(BUILD_DIR)/student.o $(BUILD_DIR)/db_interface.o $(BUILD_DIR)/class_schedule.o
TARGET = $(BUILD_DIR)/teaching_mgmt.exe

all: $(TARGET)

$(BUILD_DIR):
	@mkdir $(BUILD_DIR)

$(BUILD_DIR)/main.o: $(SRC_DIR)/main.cpp | $(BUILD_DIR)
	$(CXX) -c $< -o $@

$(BUILD_DIR)/student.o: $(SRC_DIR)/student.c | $(BUILD_DIR)
	$(CC) -c $< -o $@ $(CFLAGS)

$(SRC_DIR)/db_interface.c: $(SRC_DIR)/db_interface.pc
	$(PROC) iname=$< oname=$@

$(BUILD_DIR)/db_interface.o: $(SRC_DIR)/db_interface.c | $(BUILD_DIR)
	$(CC) -c $< -o $@ $(CFLAGS)

$(BUILD_DIR)/class_schedule.o: $(SRC_DIR)/class_schedule.cpp | $(BUILD_DIR)
	$(CXX) -c $< -o $@

$(TARGET): $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS)

clean:
	del /Q src\\db_interface.c build\\*.o build\\teaching_mgmt.exe 2>nul || exit 0

.PHONY: all clean
