# ASUS Display Control CLI (Windows)

## Installation

1. **Copy this entire folder** to a permanent location of your choice, for example:
   - `C:\Tools\dwc\`
   - `C:\Program Files\dwc\`
   - `D:\Apps\dwc\`

2. **Run `install.bat`** inside the copied folder.
   - A UAC prompt will appear — click **Yes** to grant administrator privileges.
   - The installer will add the folder to the system PATH automatically.
   - If you decline the UAC prompt, the folder will be added to your user PATH instead.

3. **Open a new Command Prompt or PowerShell window** and verify the installation:

   ```
   dwc.exe --help
   ```

> **Important:** Do not move or delete the folder after installation.
> The PATH entry points to the location you chose in step 1.
> If you need to move it, run `install.bat` again from the new location.
