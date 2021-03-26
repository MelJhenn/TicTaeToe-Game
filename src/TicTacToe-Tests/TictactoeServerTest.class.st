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
	client 
		url: 'http://localhost:1701';
		addPath: 'coordinates';
		post.
	self assert: client isSuccess.
	server stop.
	
]

{ #category : #tests }
TictactoeServerTest >> testImageWithPosition [
	| server client |
	server := TictactoeServer new.
	server start.
	self assert: server game asString equals: '
 | | 
- - -
 | | 
- - -
 | | 
'.
	client := ZnClient new.
	client
		url: 'http://localhost:1701';
		addPath: 'coordinates';
		formAdd: 'x' -> '5';
		formAdd: 'y' -> '8';
		post.
	self assert: client isSuccess.
	self
		assert: server game asString equals: '
x| | 
- - -
 | | 
- - -
 | | 
'.
	client := ZnClient new.
	client
		url: 'http://localhost:1701';
		addPath: 'coordinates';
		formAdd: 'x' -> '250';
		formAdd: 'y' -> '240';
		post.
	self assert: client isSuccess.
	self assert: server game asString equals: '
x| | 
- - -
 |o| 
- - -
 | | 
'.
	server stop
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
