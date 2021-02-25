Class {
	#name : #TictactoeGame,
	#superclass : #Object,
	#instVars : [
		'matrix'
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

{ #category : #'instance creation' }
TictactoeGame >> at: aPoint place: aSymbol [
	| value |
	value := matrix at: aPoint y at: aPoint x.
	value ifNil: [ matrix at: aPoint y at: aPoint x put: aSymbol ]
]

{ #category : #initialization }
TictactoeGame >> initialize [ 
	matrix:= Array2D rows: 3 columns: 3 
]

{ #category : #'instance creation' }
TictactoeGame >> open [ 
	<script: 'self new open'>
	| canvas line1 line2 line3 line4 |
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
	canvas:= RSCanvas new.
	canvas add: line1. 
	canvas add: line2.
	canvas add: line3.
	canvas add: line4.
	canvas zoomToFit.
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
