"
A TictactoeServerTest is a test class for testing the behavior of TictactoeServer
"
Class {
	#name : #TictactoeServerTest,
	#superclass : #TestCase,
	#category : #'TicTacToe-Tests'
}

{ #category : #tests }
TictactoeServerTest >> testImage [ 
	|server  client |
	server:= TictactoeServer new.
	server start.
	client := ZnClient new.
	client get: 'http://localhost:1701/image.jpg'.
	self assert: client isSuccess.
	server stop.
	
]

{ #category : #tests }
TictactoeServerTest >> testServer [ 
	|server  client |
	server:= TictactoeServer new.
	server start.
	client := ZnClient new.
	client get: 'http://localhost:1701'.
	self assert: client isSuccess.
	server stop.
	
]
