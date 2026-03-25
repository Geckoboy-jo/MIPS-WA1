# MIPS-WA1

Fibonacci sequence using MIPS

## Workspace setup

This workspace is configured for MIPS development in VS Code:

- Source file: `main.s`
- VS Code tasks: `.vscode/tasks.json`
  - `Run MIPS (SPIM)`
  - `Run MIPS (MARS jar)`
- Extension recommendations: `.vscode/extensions.json`

## Run with SPIM

1. Install SPIM (Linux):

	```bash
	sudo apt install spim
	```

2. Run from terminal:

	```bash
	spim -file main.s
	```

3. Or run in VS Code using the task `Run MIPS (SPIM)`.

## Run with MARS (optional)

1. Download `Mars4_5.jar` and place it at:

	```
	tools/Mars4_5.jar
	```

2. Run the VS Code task `Run MIPS (MARS jar)`.
