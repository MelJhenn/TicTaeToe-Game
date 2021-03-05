"
Start a new server on localhost:1701

"
Class {
	#name : #TictactoeServer,
	#superclass : #Object,
	#category : #TicTacToe
}

{ #category : #accessing }
TictactoeServer >> gameInFile [
	|file|
	file:= 'game.html' asFileReference.
	^file contents.
	 
	
]

{ #category : #accessing }
TictactoeServer >> start [ 
	<script: 'self new start. 
	 WebBrowser openOn: ''http://localhost:1701''
	'>
	(ZnServer startDefaultOn: 1701) 
		delegate: (ZnDispatcherDelegate new
      	map: '/'
      	to: [ :request :response |
            response entity: (ZnEntity html: self gameInFile) ];
			map: '/image.jpg'
      	to: [ :request :response |
            response entity: (ZnEntity html: self gameInFile) ]).
	
]

{ #category : #accessing }
TictactoeServer >> stop [
	<script: 'self new stop'>
	ZnServer stopDefault
	
]
