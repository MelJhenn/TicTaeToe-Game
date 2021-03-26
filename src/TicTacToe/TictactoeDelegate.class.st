"
Handle request, get information, coordinates and return an image.
"
Class {
	#name : #TictactoeDelegate,
	#superclass : #ZnStaticFileServerDelegate,
	#instVars : [
		'game'
	],
	#category : #TicTacToe
}

{ #category : #public }
TictactoeDelegate >> convertToText: image [ 
	|stream base64|
	stream := WriteStream on: ByteArray new.
	PNGReadWriter putForm: image onStream: stream.
	base64 := Base64MimeConverter mimeEncode: stream contents readStream multiLine: false.
	^base64 contents.

	
]

{ #category : #accessing }
TictactoeDelegate >> game [
	^ game
]

{ #category : #accessing }
TictactoeDelegate >> game: anObject [
	game := anObject
]

{ #category : #public }
TictactoeDelegate >> handleRequest: request [
	^request method = #POST
		ifTrue:[
			self processCoordinates: request
			]
		ifFalse: [ 
			super handleRequest: request
			 ]
]

{ #category : #'as yet unclassified' }
TictactoeDelegate >> positionFrom: request [
	|fields x y|
	request entity ifNil: [^nil].
	fields:= request entity fields.
	x:= fields at: 'x'.
	y:= fields at: 'y'.
	x:= x asNumber.
	y:= y asNumber.
	^x@y *90/500.


]

{ #category : #public }
TictactoeDelegate >> processCoordinates: request [
	|image text position |
	position:= self positionFrom: request.
	position ifNotNil: [ 
		game processPosition: position.
		 ].
	image:= self game asForm . 
	text:= self convertToText: image.
	^ ZnResponse ok: (ZnEntity text: text).
	
	
]
