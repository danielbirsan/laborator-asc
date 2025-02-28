## Conway's Game of Life in Assembly

### Introduction
This is an implementation of Conway's Game of Life written in x86 Assembly. The program simulates the evolution of a cellular automaton based on the classic rules defined by John Conway.

### Requirements
- An x86-based system (or an emulator such as QEMU, Bochs, or DOSBox)
- An assembler like `nasm`
- A linker (e.g., `ld` for Linux)
- An environment capable of running 32-bit applications (if running on a 64-bit system, you may need `gcc-multilib` and `libc6-dev-i386`)

### Compilation and Execution

1. Assemble the source code using `nasm`:
   ```sh
   nasm -f elf32 conway.asm -o conway.o
   ```
2. Link the object file:
   ```sh
   ld -m elf_i386 conway.o -o conway
   ```
3. Run the program:
   ```sh
   ./conway
   ```

### How It Works
The program follows these steps:
1. Reads the grid dimensions (rows and columns) from the user.
2. Adjusts the dimensions to include boundary padding.
3. Reads the number of initial live cells and their positions.
4. Reads the number of iterations to perform.
5. Updates the grid according to the Game of Life rules:
   - Any live cell with fewer than 2 live neighbors dies (underpopulation).
   - Any live cell with 2 or 3 live neighbors survives.
   - Any live cell with more than 3 live neighbors dies (overpopulation).
   - Any dead cell with exactly 3 live neighbors becomes alive (reproduction).
6. Prints the grid after each iteration.

### Data Structures
- `matrix`: Stores the current state of the grid.
- `copy`: Temporary matrix to store the next state before copying back.
- `lines`, `columns`: Store the grid dimensions.
- `puncte`: Number of initial live cells.
- `iteratii`: Number of iterations.
- Various registers and memory locations are used to manage indexes and neighbor calculations.

### Controls & Input Format
- The program prompts the user to enter:
  1. Number of rows.
  2. Number of columns.
  3. Number of initial live cells and their (row, column) positions.
  4. Number of iterations.
- The program then runs the simulation and prints each step.

### Example Input & Output
**Input:**
```
5   (rows)
5   (columns)
4   (number of live cells)
1 1
1 2
2 1
2 2
3   (iterations)
```

**Output:**
```
Iteration 1:
0 1 1 0 0 
1 1 0 0 0 
1 0 0 0 0 
0 0 0 0 0 
0 0 0 0 0 

Iteration 2:
...
```

### Notes
- The implementation is optimized for performance using low-level register manipulations.
- Uses a temporary `copy` matrix to avoid modifying the grid while iterating.
- Uses `scanf` and `printf` for input/output.
- Runs in a loop until all iterations are completed.

### Future Improvements
- Support for different grid sizes dynamically allocated.
- Optimizations for performance improvements.
- Implement a graphical representation instead of text-based output.

### License
This project is open-source under the MIT License.
