# Cygwin Uninstaller Bat Script

<h2>Description</h2>

This script is designed to automate the process of uninstalling Cygwin from a Windows machine. The script performs the following actions:

   * Delete the Cygwin shortcuts on the Desktop and Start Menu.
   * Delete the registry node Software\Cygnus Solutions under HKEY_LOCAL_MACHINE and HKEY_CURRENT_USER.
   * Delete the Cygwin directory (typically C:\cygwin).
   * Delete any files created in the setup temporary directory.
   * Delete C:\cygwin\bin from the PATH environment variable if you have it.

<h2>Usage</h2>

1.  Download the CygwinUninstaller.bat file from the repository.
2.  Right-click on the file and select "Run as administrator". <br>
2.1 If you are prompted with a Microsoft Defender Smartscreen popup, select More info and then Run anyway.
3.  Follow the on-screen prompts to complete the uninstallation process.

<h2>Requirements</h2>

 *  Windows operating system
 *  Administrator privileges on the machine

<h2>Note</h2>

   Use this script at your own risk.
   The script has been tested on a limited number of machines and may not work on all systems.
   It is recommended to backup your data before running the script.

