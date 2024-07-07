# Bubble Popper Game in Assembly Language

## Description

The **Bubble Popper Game in Assembly Language** is an engaging and entertaining video game that challenges players to pop bubbles and earn points. This simple yet addictive game provides an exciting gaming experience with the thrill of timing, precision, and quick reflexes.

## Key Features

### Bubble Generation
- Bubbles with randomly generated characters from 'a' to 'z' appear on the game screen.
- The bubbles continuously spawn at various positions, making the gameplay dynamic and unpredictable.

### Popping Mechanism
- Players pop the bubbles by pressing the corresponding key on the keyboard when a bubble with a specific character is on the screen.
- Successful bubble pops earn the player 10 points per bubble.

### Timer
- The game has a built-in timer that runs for 2 minutes, providing a sense of urgency to the gameplay.
- Players must aim to score as many points as possible within the allotted time.

### Score Tracking
- The player's current score is displayed on the screen, allowing them to track their progress in real-time.
- The final score is recorded at the end of the 2-minute game session.

### High Score Recording
- The game keeps track of the highest score achieved, encouraging players to improve their performance with each session.

## Gameplay

Players are presented with a colorful and animated game screen where bubbles bearing characters from 'a' to 'z' randomly appear at different positions. To pop a bubble and earn points, the player must press the corresponding key on their keyboard as quickly and accurately as possible. For each successfully popped bubble, 10 points are added to the player's score. The game continues until the 2-minute timer runs out, at which point the final score is recorded, and the highest score is updated if necessary.

## Objective

The main objective of the Bubble Popper Game is to achieve the highest score possible by popping bubbles within the 2-minute time limit. Players can challenge themselves to improve their speed and accuracy with each playthrough, aiming for the top spot on the high score leaderboard.

## Development

The game is developed using Assembly Language, a low-level programming language, which allows for precise control over hardware and graphical elements, making it a suitable choice for simple 2D games like this one.

This game provides a fun and engaging experience for players, testing their reflexes and coordination while offering a competitive element through the high score system. Whether you're looking to take a break, compete with friends, or simply enjoy a quick and challenging gaming experience, the Bubble Popper Game in Assembly Language is a great choice.


# Bubble Popper Game in Assembly Language (HOW TO RUN)

**Bubble Popper Game** is an exciting and addictive video game developed in Assembly Language. Players must pop bubbles with corresponding characters and earn points within a 2-minute time limit. This README provides instructions for setting up and running the game on your system.

## Installation

To run the Bubble Popper Game, you need to install the following tools:

### NASM (Netwide Assembler)

NASM is used to assemble the Assembly Language source code into a binary executable. You can download and install NASM by following the instructions for your specific operating system:

- **Linux:**
  ```bash
  sudo apt-get install nasm

### DOSBox
DOSBox is a DOS emulator that allows you to run old DOS-based programs and games. Download DOSBox from the official website and install it.

## Usage
After installing NASM and DOSBox, follow these steps to compile and run the Bubble Popper Game:

Open a terminal or command prompt.

Use NASM to assemble the source code and generate a .com file:

- ```bash
  nasm -f bin bubble.asm -o bubble.com

After running the command above, a bubble.com file should be generated in the same directory.

Start DOSBox:

Linux and macOS: Open your terminal and run dosbox.

In DOSBox, navigate to the directory where the bubble.com file is located using DOS commands.

Run the game by typing the name of the .com file (without the file extension):

# Author
- Muhammad Anique

Feel free to modify and enhance the game and share your own version on GitHub!

