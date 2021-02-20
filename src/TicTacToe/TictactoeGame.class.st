Class {
	#name : #TictactoeGame,
	#superclass : #Object,
	#instVars : [
		'matrix'
	],
	#category : #TicTacToe
}

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
