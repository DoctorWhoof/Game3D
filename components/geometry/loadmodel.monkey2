Namespace game3d


Class LoadModel Extends Component
	
	Field path:= ""
	
	Method New()
		Super.New( "LoadModel" )
	End
	
	Method OnAttach() Override
		GameObject.SetEntity( Model.Load( path ) )
	End
	
End