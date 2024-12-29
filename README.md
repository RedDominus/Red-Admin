# Red's Admin GUI

Welcome to Red's Admin GUI! This project is a customizable admin GUI for Roblox games, designed to enhance game management features and provide an optimal user experience for trusted players.

## Features
- **Trusted Username Check**: Only allow specified players to access the GUI.
- **Command Execution**: Execute various commands like "Kill All," "Go To The Void," "Fly," and more.
- **Draggable GUI**: Both the main and flight GUIs can be moved around the screen for quick access.
- **Open/Close Functionality**: Easily hide or display the GUIs with the click of a button.

## Installation
To set up Red's Admin GUI in your Roblox game:

1. Clone this repository:
    ```bash
    git clone https://github.com/RedDominus/Red-Admin.git
    ```
    
2. Open Roblox Studio and create or open your game project.

3. In Roblox Studio, navigate to the Explorer panel:
    - Under **StarterGui**, right-click and select **Insert Object** > **ScreenGui**.
    - Right-click on the **ScreenGui** you created and select **Insert Object** > **LocalScript**.

4. Copy the code from `LocalScript.lua` in this repository and paste it into the LocalScript in Roblox Studio.

5. Customize the `trustedUsernames` table within the script according to the usernames of trusted players.

## Usage
Once integrated, the admin GUI can be accessed by trusted users only. Players can use the interface to execute commands by clicking the "Execute" button, and can toggle the fly feature for enhanced mobility.

### Controls
- **Close Button**: Hides the current GUI.
- **Open Button**: Displays the main GUI if hidden.
- **Drag Functionality**: Click and hold to move the GUI around.

## Ongoing Updates
This project is actively being developed, and improvements, features, and optimizations are being rolled out over time. Stay tuned for more updates!

## Contributing
If you'd like to contribute to this project, feel free to submit a pull request or open an issue. Your input is highly valued!

## License
This project is open-source and available under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact
For questions or inquiries, please contact [equaterxz@gmail.com].

Thank you for using Red's Admin GUI! Enjoy your enhanced Roblox experience!
