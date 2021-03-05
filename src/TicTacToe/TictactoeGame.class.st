"
A simple tic tac toe game.

"
Class {
	#name : #TictactoeGame,
	#superclass : #Object,
	#instVars : [
		'matrix',
		'turn'
	],
	#category : #TicTacToe
}

{ #category : #testing }
TictactoeGame >> areThere3InARow [
	^ (self areThere3InARowfor: 'x') or: [self areThere3InARowfor: 'o'] .

]

{ #category : #testing }
TictactoeGame >> areThere3InARowfor: symbol [
	^ self areThere3InARowfor: symbol inAllPositions: 
	{
	{1@1. 2@1. 3@1.}.
	{1@2. 2@2. 3@2.}.
	{1@3. 2@3. 3@3.}.
	{1@1. 1@2. 1@3.}.
	{2@1. 2@2. 2@3.}.
	{3@1. 3@2. 3@3.}.
	{1@1. 2@2. 3@3.}.
	{3@1. 2@2. 1@3.}.
	}
	
]

{ #category : #testing }
TictactoeGame >> areThere3InARowfor: symbol inAllPositions: allPositions [
	^ allPositions
		anySatisfy: [ :positions | self areThere3InARowfor: symbol inPositions: positions ]
]

{ #category : #testing }
TictactoeGame >> areThere3InARowfor: symbol inPositions: positions [
	1 to: 3 do: [ :index| 
		|position value|
		position:= positions at: index.
		value:= matrix at: position y at: position x.
		symbol=value 
			ifFalse: [ ^false ] 
		].
	^true 
]

{ #category : #accessing }
TictactoeGame >> at: aPoint place: aSymbol [
	| value |
	value := matrix at: aPoint y at: aPoint x.
	value ifNil: [ matrix at: aPoint y at: aPoint x put: aSymbol ]
]

{ #category : #rendering }
TictactoeGame >> inform: aString inCanvas: canvas [
	|label box |
	box:= RSBox new.
	box 
		position: 45@45;
		color: (Color white alpha: 0.8);
		cornerRadius: 5;
		border: (RSBorder new color: Color black ).
	label:= RSLabel new.
	label 
		text: aString;
		position: 45@45.
	box width: label width +10.
	box height: label height. 
	canvas add: box.
	canvas add: label.
	
	
	
	
]

{ #category : #initialization }
TictactoeGame >> initialize [ 
	matrix:= Array2D rows: 3 columns: 3.
	turn:= true.
]

{ #category : #opening }
TictactoeGame >> open [ 
	<script: 'self new open'>
	| canvas |
	canvas:= RSCanvas new.
	self renderBoardOn: canvas.
	self renderMatrixOn: canvas.
	canvas when: RSMouseClick send: #processClick: to: self. 
	
	^ canvas open. 
	
	
]

{ #category : #printing }
TictactoeGame >> printOn: stream [ 
	stream cr.
	(1 to: 3) do: [ :row| 
		(1 to: 3) do: [:column| 
			|value|
			value:= matrix at: row  at: column.
			value ifNil:  [ value:= ' ' ]. 
			stream nextPutAll: value.  
			]	separatedBy: [ stream nextPutAll: '|' ]
		] separatedBy: [
			stream cr. 
			stream nextPutAll: '- - -' .
			stream cr.
			].
	
	stream cr.
]

{ #category : #events }
TictactoeGame >> processClick: event [ 
	|symbol canvas|
	canvas:= event canvas.
	self areThere3InARow ifTrue: [^ self restart: canvas ].
	symbol:= turn ifTrue: ['x'] ifFalse: [ 'o' ].
	turn:= turn not.
	self putValue: symbol  fromScreen: event position. 
	self renderMatrixOn:canvas.
	(self areThere3InARowfor: symbol)  ifTrue: [ 
		self inform: 'The winner is ', symbol inCanvas: canvas ].
	
	canvas signalUpdate. 
	
	
]

{ #category : #accessing }
TictactoeGame >> putValue: aSymbol fromScreen: aPoint [ 
	|newPosition |
	newPosition := (aPoint/30) asIntegerPoint +1.
	self at: newPosition  place: aSymbol. 
	
]

{ #category : #rendering }
TictactoeGame >> renderBoardOn: canvas [
	|line1 line2 line3 line4 | 
	line1:= RSLine new.
	line2:= RSLine new.
	line3:= RSLine new.
	line4:= RSLine new.
	line1 startPoint: 30@0 .
	line1 endPoint: 30@90.
	line2 startPoint: 60@0 .
	line2 endPoint: 60@90.
	line3 startPoint: 90@30 .
	line3 endPoint: 0@30.
	line4 startPoint: 0@60 .
	line4 endPoint: 90@60.
	canvas add: line1. 
	canvas add: line2.
	canvas add: line3.
	canvas add: line4.
	canvas zoomToFit.
]

{ #category : #rendering }
TictactoeGame >> renderMatrixOn: canvas [ 
	|label1 value |
	1 to: 3 do: [ :row | 
		1 to: 3 do: [ :column | 
			value:= matrix at: row at: column.
			value ifNotNil: [ 
				label1 := RSLabel new.
				canvas add: label1.
				label1 text: value.
				label1  position: column@row *30 -15.
				label1 fontSize: 28.
				label1  fontName: 'Courier New'. ]
			]
		 ].
	
 
	 
	
]

{ #category : #events }
TictactoeGame >> restart: canvas [
	matrix:= Array2D rows: 3 columns: 3.
	canvas shapes do: [:shape| shape remove].
	self renderBoardOn: canvas.
	canvas signalUpdate.
	
	
	
]
