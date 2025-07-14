import sys
import os
from ase.io import read, write

"""
This script converts a CIF file to an XSF file format using ASE
(Atomic Simulation Environment).

Usage: python convert_cif_to_xsf.py <input_file>

Ensure that the ASE library is installed in your Python environment.
"""


def main():
    if len(sys.argv) < 2:
        print("Usage: python script.py <input_file>")
        sys.exit(1)

    input_file = sys.argv[1]

    if not os.path.isfile(input_file):
        print(f"Error: File '{input_file}' does not exist.")
        sys.exit(1)

    try:
        atoms = read(input_file)
    except Exception as e:
        print(f"Error reading file '{input_file}': {e}")
        sys.exit(1)

    # Remove original extension and add .xsf
    base_name = os.path.splitext(input_file)[0]
    output_file = base_name + ".xsf"

    try:
        write(output_file, atoms)
        print(f"Successfully wrote '{output_file}'")
    except Exception as e:
        print(f"Error writing file '{output_file}': {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
