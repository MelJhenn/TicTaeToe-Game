"
Start a new server on localhost:1701

"
Class {
	#name : #TictactoeServer,
	#superclass : #Object,
	#instVars : [
		'game'
	],
	#category : #TicTacToe
}

{ #category : #accessing }
TictactoeServer >> game [
	^game.
]

{ #category : #accessing }
TictactoeServer >> start [ 
	<script: 'self new start. 
	 WebBrowser openOn: ''http://localhost:1701''
	'>
	game:= TictactoeGame  new.
	(ZnServer startDefaultOn: 1701) 
		delegate: (TictactoeDelegate new
			directory: '.' asFileReference; 
			game: game;
			yourself).	
			
	
]

{ #category : #accessing }
TictactoeServer >> stop [
	<script: 'self new stop'>
	ZnServer stopDefault
	
]
