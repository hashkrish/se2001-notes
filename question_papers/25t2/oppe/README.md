# 2025T2 OPPE Papers

These are attached in folder structure to facilitate easy experimentation.

## How to Solve

0. Clone the repository if you haven't already.

1. Create a symlink to this folder in your system at `/opt/se2001`.

   ```bash
   # Ensure you are in this `oppe` folder in your terminal.
   [[ $(basename $(pwd)) == "oppe" ]] || exit 1;
   rm -rf /opt/se2001 # ensure no important data is lost before running this.
   ln -s $(realpath .) /opt/se2001
   ```

   This lets the `evaluation_file.sh` script work as expected.

2. For each question, `cd` in it, read the question by `cat README.md`, and create the required file.
   Ensure it is executable by running `chmod +x <filename>`.
   For pretty printing, install and use `batcat` in your system.

3. Run the evaluation script to test your solution.

```bash
bash evaluation_file.sh
```

This will simulate `synchro eval` behavior and show test case status for public test cases.
