Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #TicTacToe
}

{ #category : #tests }
GameTest >> testBasic [
	| game window |
	game:= TictactoeGame new.
	window:= game open.
	self assert: window isDisplayed.
 	window delete.
]

{ #category : #tests }
GameTest >> testBasic2 [
	| game |
	game:= TictactoeGame new.
	self assert: game asString equals: '
 | | 
- - -
 | | 
- - -
 | | 
'.
	game at: 2@2 place: 'x'.
	self assert: game asString equals: '
 | | 
- - -
 |x| 
- - -
 | | 
'.
]
