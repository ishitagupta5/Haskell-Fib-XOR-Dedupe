# Haskell-Fib-XOR-Dedupe
Haskell command-line tool that implements Fibonacci calculation, XOR fold, and duplicate removal. Reads input from a file and writes results to output.

This Haskell project processes input commands from a text file and performs operations such as:

- `remove_duplicates` – removes all duplicate elements from a list
- `xor` – computes a XOR fold over a list of binary values
- `fib` – computes the n-th Fibonacci number using tail recursion

---

## 📁 Files

- `Homework6.hs` – Module containing the core functions (`remove_duplicates`, `xor`, `fib`)
- `hw6-main.hs` – Main program that reads input and writes output
- `hw6-main` – Compiled binary (platform dependent)
- `input.txt` – List of commands to be executed
- `output.txt` – Program output
- `my-output.txt` – (Optional) Your implementation’s output
- `.hi` and `.o` files – GHC-generated intermediate files (can be ignored or added to `.gitignore`)

---

## 🚀 How It Works

Each line in the input file contains a command. The entire example, including compile and run instructions, is shown below:

-- Example input.txt
remove_duplicates 1 2 3 2 1 5
xor 1 0 1 0 1
fib 7

-- Will produce output.txt
remove_duplicates 1 2 3 2 1 5 is [3,2,1,5]
xor 1 0 1 0 1 is 1
fib 7 is 13

-- Compile (run this in terminal)
ghc hw6-main.hs

-- Run the program
./hw6-main input.txt output.txt

> Note: `remove_duplicates` keeps only the **last** occurrence of each value.

---

## 🧑‍💻 Author Notes

This project was written for a CS functional programming assignment using Haskell. All `.hs` files were written by the student. Input/output text files were used for testing.

> Intermediate files like `.hi` and `.o` are auto-generated and can be excluded from version control.
