APP_NAME=planner

OBJS=main.o planner.o map.o node.o

CXX = g++ -m64 -std=c++11
CXXFLAGS = -I. -O3 -Wall -Werror

default: $(APP_NAME)

$(APP_NAME): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS)

%.o: %.cpp
	$(CXX) $< $(CXXFLAGS) -c -o $@

clean:
	/bin/rm -rf *~ *.o $(APP_NAME)