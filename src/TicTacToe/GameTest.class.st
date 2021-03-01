Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #TicTacToe
}

{ #category : #tests }
GameTest >> test3InARow [
	| game |
	game:= TictactoeGame new.
	self assert: game asString equals: '
 | | 
- - -
 | | 
- - -
 | | 
'.
	game at: 1@2 place: 'x'.
	game at: 2@2 place: 'x'.
	game at: 2@3 place: 'x'.
	self assert: game asString equals: '
 | | 
- - -
x|x| 
- - -
 |x| 
'.
	self deny: game areThere3InARow.
	game:= TictactoeGame new.
	game at: 1@1place: 'x'.
	game at: 2@2 place: 'x'.
	game at: 3@3 place: 'x'.
	self assert: game asString equals: '
x| | 
- - -
 |x| 
- - -
 | |x
'.
	self assert: game areThere3InARow.
	game:= TictactoeGame new.
	game at: 1@2place: 'x'.
	game at: 2@2 place: 'x'.
	game at: 3@2 place: 'x'.
	self assert: game asString equals: '
 | | 
- - -
x|x|x
- - -
 | | 
'.
	self assert: game areThere3InARow.
	
	game:= TictactoeGame new.
	game at: 1@2place: 'o'.
	game at: 2@2 place: 'o'.
	game at: 3@2 place: 'o'.
	self assert: game asString equals: '
 | | 
- - -
o|o|o
- - -
 | | 
'.
	self assert: game areThere3InARow.

	
]

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

{ #category : #tests }
GameTest >> testOnly1InACell [
	|game|
	game:= TictactoeGame new.
	game at: 1@2place: 'o'.
	game at: 2@2 place: 'o'.
	game at: 3@2 place: 'o'.
	self assert: game asString equals: '
 | | 
- - -
o|o|o
- - -
 | | 
'.
	self assert: game areThere3InARow.
	game at: 2@2 place: 'x'.
	self assert: game asString equals: '
 | | 
- - -
o|o|o
- - -
 | | 
'.
	
]

{ #category : #tests }
GameTest >> testPutValueFromScreen [
	|game|
	game:= TictactoeGame new.
	game putValue: 'x' fromScreen: 75.4@15.099999999999998. 
	self assert: game asString equals: '
 | |x
- - -
 | | 
- - -
 | | 
'.
]

{ #category : #tests }
GameTest >> testStep [ 
	|game|
	game:= TictactoeGame new.
	
]
