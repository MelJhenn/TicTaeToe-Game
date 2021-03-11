"
Start a new server on localhost:1701

"
Class {
	#name : #TictactoeServer,
	#superclass : #Object,
	#category : #TicTacToe
}

{ #category : #accessing }
TictactoeServer >> start [ 
	<script: 'self new start. 
	 WebBrowser openOn: ''http://localhost:1701''
	'>
	(ZnServer startDefaultOn: 1701) 
		delegate: (TictactoeDelegate new
			directory: '.' asFileReference;
			yourself).	
			
	
]

{ #category : #accessing }
TictactoeServer >> stop [
	<script: 'self new stop'>
	ZnServer stopDefault
	
]
