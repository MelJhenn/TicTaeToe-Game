# TicTaeToe-Game
### Stable version
If you wish to install TicTacToe-Game in Pharo 8, go ahead and execute the following code in a Playground:

```Smalltalk
Metacello new
    baseline: 'Tictactoe';
    repository: 'github://MelJhenn/TicTacToe-Game';
    load.
```
To start the server execute this:
```Smalltalk
TictactoeServer new start. 
WebBrowser openOn: 'http://localhost:1701'.
```
