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
	matrix at: aPoint y at: aPoint x put: aSymbol


]

{ #category : #initialization }
TictactoeGame >> initialize [ 
	matrix:= Array2D rows: 3 columns: 3 
]

{ #category : #'instance creation' }
TictactoeGame >> open [ 
	| canvas |
	canvas:= RSCanvas new.
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
