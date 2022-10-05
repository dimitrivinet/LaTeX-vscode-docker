# LaTeX with Docker and VSCode

Develop in LaTeX with VSCode and Docker. Minimal dependencies required.

## Usage

- Clone this repository and `cd` into the newly created folder, optionally renaming the destination folder:

```bash
git clone https://github.com/dimitrivinet/LaTeX-vscode-docker your_folder_name && cd your_folder_name
```

- Copy your template inside the directory

- Setup your compilation script:

    Inside `.vscode/tasks.json`, modify the `command` and `args` for the task labelled `Build LaTeX document`:

    ```jsonc
    {
        "version": "2.0.0",
        "tasks": [
            {
                "label": "Build LaTeX document",
                "type": "process",
                // ---------- MODIFY BELOW ----------
                // vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
                "command": "/bin/bash",
                "args": [
                    "compile"
                ],
                // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                // ---------- MODIFY ABOVE ----------
                "options": {
                    "statusbar": {
                        "hide": true
                    }
                },
                "presentation": {
                    "close": true
                }
            },
            ...
        ]
    }
    ```

    In this case, the task will run `/bin/bash compile` a.k.a. running the `compile` file.

- Build and run the Docker image:

    Press `Ctrl+Shift+P` and search for and execute the command `Remote-Containers: Open Folder in Container`.

    VSCode should reopen in Remote Container mode. The first time, the image will build which can take 5 to 10 minutes. Once the image is built, you will be able to see your files in the File explorer.

- Test your compilation script by clicking `Build and Refresh` in the bottom status bar of your VSCode window.
