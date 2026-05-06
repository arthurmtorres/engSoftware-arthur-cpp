CXX = g++
CXXFLAGS = -Wall

# Busca todos os arquivos .cpp em src
SRC_FILES = $(wildcard src/*.cpp)

# Remove o main.cpp da lista para não dar conflito na hora de compilar os testes
LIB_FILES = $(filter-out src/main.cpp, $(SRC_FILES))

# Define os arquivos objeto correspondentes na pasta bin
OBJ_FILES = $(patsubst src/%.cpp, bin/%.o, $(SRC_FILES))
LIB_OBJ_FILES = $(patsubst src/%.cpp, bin/%.o, $(LIB_FILES))

APP_EXEC = bin/app.exe
TEST_EXEC = bin/testeRegressivo.exe

all: $(APP_EXEC)

$(APP_EXEC): $(OBJ_FILES)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Regra genérica para compilar objetos
bin/%.o: src/%.cpp
	mkdir -p bin
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Regra para compilar testes
test: $(LIB_OBJ_FILES)
	mkdir -p bin
	$(CXX) $(CXXFLAGS) test/main.cpp $(LIB_OBJ_FILES) -o $(TEST_EXEC)

clean:
	rm -rf bin/*