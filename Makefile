# Teaching Classes Management System - Makefile

ORACLE_HOME = C:/App/db_home
PROC = $(ORACLE_HOME)/bin/proc
CC = gcc
CXX = g++
CFLAGS = -I$(ORACLE_HOME)/precomp/public
LDFLAGS = -L$(ORACLE_HOME)/lib -lclntsh

SRC_DIR = src
BUILD_DIR = build

# Files
OBJS = $(BUILD_DIR)/main.o $(BUILD_DIR)/student.o $(BUILD_DIR)/db_interface.o

# Executable
TARGET = $(BUILD_DIR)/teaching_mgmt.exe

all: $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compile main.cpp
$(BUILD_DIR)/main.o: $(SRC_DIR)/main.cpp | $(BUILD_DIR)
	$(CXX) -c $< -o $@

# Compile student.c
$(BUILD_DIR)/student.o: $(SRC_DIR)/student.c | $(BUILD_DIR)
	$(CC) -c $< -o $@ $(CFLAGS)

# Precompile Pro*C file
$(SRC_DIR)/db_interface.c: $(SRC_DIR)/db_interface.pc
	$(PROC) iname=$< oname=$@

# Compile generated db_interface.c
$(BUILD_DIR)/db_interface.o: $(SRC_DIR)/db_interface.c | $(BUILD_DIR)
	$(CC) -c $< -o $@ $(CFLAGS)

# Link everything
$(TARGET): $(OBJS)
	$(CXX) -o $@ $^ $(LDFLAGS)

clean:
	del /Q src\\db_interface.c build\\*.o build\\teaching_mgmt.exe 2>nul || exit 0
	
# rm -f $(SRC_DIR)/*.c $(BUILD_DIR)/*.o $(TARGET)